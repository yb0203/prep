# Key Projects

> Corresponding tex: `projects.tex`

## Context
Personal projects built outside of work demonstrating initiative, breadth of AI/ML skills, and engineering judgment in emerging technology domains.

## Talking Points
- These projects show self-directed learning beyond the day job — both were built from scratch, not tutorials
- Both are AI-native: one is RAG (retrieval-augmented generation over a document corpus), one is agentic (LLM-driven tool use over a real external system)
- Together they demonstrate breadth: GitaBae is consumer-facing (any user with a browser), Vibe Check is developer tooling (engineers and their workflows)
- MCP (Vibe Check) and LangChain/Pinecone (GitaBae) are current, in-demand technologies that appear in real production AI stacks today
- Both projects required making real architectural decisions under constraints — not just calling an API, but designing the retrieval pipeline, the safety layer, the tool schema, and the LLM integration

## Anticipated Questions
- Q: Why did you choose these two projects to highlight?
  - A: They deliberately show two different paradigms in applied AI. GitaBae is a classic RAG use case: a knowledge corpus, an embedding model, a vector store, and a retrieval chain. It tests my ability to wrangle data quality, chunking strategy, and prompt design for a specific domain. Vibe Check is an agentic use case: an LLM operating tools over a live external system (Git), with real safety implications. Showing both tells a more complete story than two similar projects — I understand retrieval and I understand tool use, and I made deliberate choices about when each pattern is the right one.

- Q: Are these open-source? Can I see the code?
  - A: Yes, both are public on GitHub at github.com/yb0203. GitaBae is at github.com/yb0203/gitabae and Vibe Check is at github.com/yb0203/vibe-check. I'm happy to walk through any part of the code in detail.

- Q: What would you build next?
  - A: An AI-powered code review bot using MCP and an LLM that automatically reviews pull requests. It would expose a `review_pr` tool via MCP that fetches the PR diff from the GitHub API, passes it to an LLM with context about the repository's coding standards, and posts structured inline review comments. The interesting engineering challenges are: (1) keeping the diff within context limits for large PRs (chunked review by file), (2) avoiding false-positive nitpicks by giving the LLM the repo's style guide as system context, and (3) making it actionable — each comment should explain the issue and suggest a concrete fix, not just flag it. It would sit naturally between Vibe Check (developer tooling, MCP) and GitaBae (LLM over a structured corpus).
