# /read Skill for Claude Code

This is a custom Claude Code skill that enables interactive article reading sessions.

## What It Does

The `/read` skill allows you to learn from technical articles through conversation:

- **Interactive Learning**: Discuss concepts as you read, not passively
- **Flexible Pacing**: Continue reading, pause, ask questions, review any time
- **Progress Tracking**: All conversations saved in session transcripts
- **Deep Understanding**: Connect concepts to your projects and real-world systems

## How to Use

### Start a Reading Session

```
/read system-design-core-concepts
```

### During Reading

Use natural language:
- `Continue reading` - Move to next section
- `Explain that more simply` - Get clearer explanation
- `Give me an example` - See practical examples
- `Test my understanding` - Validate your learning
- `Summarize what we've learned` - Recap key points
- Ask any clarifying questions

### Available Articles

- `system-design-core-concepts` - System Design fundamentals

More articles can be added to `/Users/yashvi/interview-prep/articles/`

## Files

- `SKILL.md` - The skill configuration and instructions
- `README.md` - This file
- `.claude/skills/read/` - Skill directory

## How It Works

1. **Invocation**: User types `/read [article-name]`
2. **Loading**: Skill loads article from `/Users/yashvi/interview-prep/articles/[article-name]/`
3. **Reading**: Claude reads sections and explains concepts
4. **Interaction**: User asks questions, requests clarifications
5. **Tracking**: Progress saved to `session_transcript.md`
6. **Learning**: Key concepts documented in `notes.md`

## Integration with Claude Code

This skill:
- Works with all Claude Code commands
- Integrates with `/practice-interview`, `/tech-topic`, `/project-deep-dive`
- Can be resumed multiple times for the same article
- Maintains full conversation history

## Tips for Best Results

1. **Be Interactive**: Ask questions as you read
2. **Take Your Time**: There's no rush to finish
3. **Connect Concepts**: Ask how ideas relate to your projects
4. **Test Yourself**: Use "Test my understanding" frequently
5. **Review Notes**: Check notes.md after each session

## Examples

### Learning System Design
```
/read system-design-core-concepts
→ Continue through sections
→ Ask questions about concepts you don't understand
→ Later: /practice-interview general system-design to test learning
```

### Combining with Other Skills
```
/read system-design-core-concepts
→ /tech-topic system-design for deeper dive
→ /project-deep-dive ms-teams to apply concepts
→ /practice-interview kayhan system-design to interview prep
```

---

**Created**: January 29, 2026
**Version**: 1.0
**Status**: Ready to Use ✅

Start reading now: `/read system-design-core-concepts`
