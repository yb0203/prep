# Vibe Check — AI-Powered MCP Server

> Corresponding tex: `vibe-check.tex`

## Context
An AI-powered MCP (Model Context Protocol) server that enables natural language Git operations, abstracting CLI complexity for team collaborators.

## Key Claims & Evidence

### "Built an AI server enabling Natural Language Git operations to abstract CLI complexity for collaborators."
- **What**: Supports the core Git operations a developer uses daily — `status`, `add`, `commit`, `push`, `branch` (create/switch/list), `diff`, `log`, `stash`. A user types a natural language request like "what changed since yesterday?" or "start a new branch for the auth feature" and the server translates it to the correct Git command(s) and executes them.
- **Metrics**: Reduces the Git command surface a non-expert needs to memorize to zero for common workflows. Particularly useful for collaborators who contribute to a repo occasionally and forget flags (e.g., `git push --set-upstream origin branch-name`).
- **How**: Built as an MCP server exposing tool definitions for each Git operation category. An LLM (Ollama locally or Claude API) receives the natural language prompt plus the tool schema, selects the appropriate tool, fills in parameters, and the server executes the underlying Git command via subprocess. Results are returned as structured text back through the MCP protocol.
- **Why**: Teammates who were strong domain contributors but Git novices kept interrupting the workflow to ask basic Git questions or would accidentally work on the wrong branch. The goal was to give them a conversational interface to Git without requiring them to learn CLI syntax.

### "Automated project versioning and commit messages by integrating LLM-based user prompt parsing logic."
- **What**: Two automation features. (1) Commit message generation: the server diffs the staged changes, summarizes the diff, and asks the LLM to produce a Conventional Commits-format message (`feat:`, `fix:`, `chore:`, etc.) with a concise subject line and optional body. (2) Semantic version bumping: the user describes the change in plain English ("this is a breaking change to the auth API") and the server parses the intent to determine whether to bump major, minor, or patch, then updates the version field in `package.json` or `pyproject.toml`.
- **Metrics**: Commit messages produced are consistently in Conventional Commits format, removing the need for manual formatting discipline on a team. Semantic version decisions that previously required a team discussion ("is this a minor or a patch?") are resolved from the user's own description of the change.
- **How**: For commit messages: `git diff --staged` output is passed to the LLM with a prompt instructing it to follow the Conventional Commits spec. For versioning: user's natural language description is passed to the LLM with a prompt explaining semver rules; the model outputs one of `major`, `minor`, or `patch`; the server programmatically reads and rewrites the version string in the project manifest.
- **Why**: Inconsistent commit messages make `git log` and changelogs useless. Manual version bumps are error-prone and require everyone to remember semver rules. Automating both removes friction and enforces consistency without requiring discipline from contributors.

## Talking Points
- Demonstrates understanding of MCP, an emerging standard that is rapidly being adopted across AI tooling (Claude, Cursor, and other LLM clients support it natively)
- Developer Experience (DX) focus — the problem is real friction in collaborative engineering workflows, not a toy demo
- Shows judgment about LLM integration: using local Ollama (Mistral/Llama 3) for privacy-sensitive operations, Claude API as the quality upgrade path
- Safety-first design: read operations are freely accessible; destructive operations require explicit user confirmation, treating irreversibility as a first-class concern
- Practical prompt engineering: structured output requirements (Conventional Commits format, `major`/`minor`/`patch` classification) where the LLM's output is machine-consumed, not just displayed

## Anticipated Questions
- Q: What is MCP and why did you choose it?
  - A: MCP stands for Model Context Protocol — it is an open standard (introduced by Anthropic) that defines how LLM clients communicate with external tool servers. Instead of writing one-off API integrations for every LLM, you implement an MCP server once and any compliant client (Claude Desktop, Cursor, etc.) can call your tools. I chose MCP because it meant the server would work out-of-the-box with Claude and Cursor, which is what my target users already had installed. It also forced a clean tool-definition discipline: every operation has an explicit name, description, and parameter schema, which doubles as self-documentation.

- Q: How do you handle ambiguous natural language commands?
  - A: The LLM is given the full tool schema with descriptions, so it can ask for clarification when the intent is unclear — for example, if the user says "push it" without a branch context, the server will prompt "Which branch would you like to push?" before executing anything. For operations that could be interpreted multiple ways, the server echoes back the interpreted command before running it: "I'll run `git push origin feature/auth`. Confirm?" This keeps the user in the loop and prevents silent misinterpretation.

- Q: What safety measures prevent destructive Git operations?
  - A: Operations are tiered by risk. Read-only operations (`status`, `diff`, `log`, `branch -l`) execute immediately with no confirmation. Write operations that are easily reversible (`add`, `stash`) also run without friction. Destructive or hard-to-reverse operations (`push`, `reset`, `branch -D`, `push --force`) require the user to include explicit confirmation language in their prompt or respond to a confirmation step before execution. The classification is defined in the server's tool schema as a `destructive: true` flag, and the server middleware checks this flag before dispatching the subprocess call.

## Technical Deep-Dive

**MCP Server Architecture:**

```
LLM Client (Claude Desktop / Cursor)
    │
    │  MCP protocol (JSON-RPC over stdio or SSE)
    │
    ▼
Vibe Check MCP Server
    │
    ├── Tool Registry
    │     ├── git_status      (read, safe)
    │     ├── git_diff        (read, safe)
    │     ├── git_log         (read, safe)
    │     ├── git_add         (write, safe)
    │     ├── git_commit      (write, safe + LLM message gen)
    │     ├── git_push        (write, DESTRUCTIVE — requires confirm)
    │     ├── git_branch      (write, destructive delete requires confirm)
    │     └── git_stash       (write, safe)
    │
    ├── Safety Middleware
    │     └── checks destructive flag → prompts confirmation if set
    │
    ├── LLM Integration Layer
    │     ├── Ollama (local: mistral, llama3) — default for privacy
    │     └── Claude API — opt-in for higher quality
    │
    └── Git Executor
          └── subprocess calls to git CLI, captures stdout/stderr
```

**LLM Integration:**
Two use cases for the LLM within the server itself:
1. **Natural language → tool selection**: handled by the MCP client (Claude/Cursor) — the LLM reads the tool schema and decides which tool to call with which parameters.
2. **Diff → commit message**: an explicit call from the `git_commit` tool handler to the configured LLM (Ollama or Claude API) with a structured prompt. The response is parsed to extract the commit message before passing it to `git commit -m`.

**Versioning Logic:**
```python
# Simplified version bump handler
def bump_version(current: str, bump_type: str) -> str:
    major, minor, patch = map(int, current.split("."))
    if bump_type == "major":
        return f"{major + 1}.0.0"
    elif bump_type == "minor":
        return f"{major}.{minor + 1}.0"
    else:  # patch
        return f"{major}.{minor}.{patch + 1}"
```
The LLM classifies bump type from the user's description; the version rewrite is deterministic code, not LLM output — keeping the safety-critical part predictable.

**Commit Message Prompt (Conventional Commits):**
```
You are a commit message generator following the Conventional Commits specification.
Given the following git diff, produce a commit message with:
- A type prefix: feat, fix, docs, style, refactor, test, or chore
- A concise subject line (max 72 chars)
- An optional body explaining WHY if the change is non-obvious

Diff:
{diff}

Output only the commit message. No explanation.
```
