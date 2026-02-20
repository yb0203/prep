# Certifications

> Corresponding tex: `skills.tex` (line: Certifications)

## Proficiency Evidence

### Design Thinking
- **Issuer**: Coursera (IDEO / University of Virginia - Design Thinking for Innovation, or equivalent NPTEL course)
- **What you learned**: The 5-stage design thinking process — Empathize, Define, Ideate, Prototype, Test. User research techniques (interviews, empathy maps), reframing problems from user needs rather than technical constraints, rapid prototyping to validate assumptions early before full implementation.
- **How you've applied it**: Applied it in the Report Server project — the initial version displayed raw JSON test results. Using design thinking, I interviewed the QA engineers (empathize), defined their real need (quickly identify regressions across environments, not wade through raw data), and prototyped a dashboard with trend charts and pass/fail summaries (ideate → prototype → test with users). The result was a significantly more useful tool than the original data-dump design.

### SOLID Principles
- **Issuer**: Udemy (e.g., "Java Design Patterns & SOLID Design Principles" or equivalent)
- **What you learned**: All five principles in depth — Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion. How violations (God classes, fragile base classes, fat interfaces) manifest in real codebases and how to refactor toward each principle.
- **How you've applied it**: Most directly in the AI Models Evaluation framework. The evaluation metric classes follow Open/Closed: each metric (faithfulness, answer relevance, crisis detection) is a separate class extending BaseMetric — adding a new metric requires zero changes to existing code. The framework also uses Dependency Inversion: the test runner depends on the BaseMetric interface, not concrete implementations, making it trivial to swap or compose metrics. In the Finacle framework, Single Responsibility guided splitting API call logic from assertion logic from report generation into separate classes.

### Hugging Face - Agents Course
- **Issuer**: Hugging Face (huggingface.co/learn/agents-course)
- **What you learned**: How LLM agents work at a fundamental level — the ReAct (Reason + Act) loop, tool use (defining tools as structured function specs the LLM can call), function calling with JSON schemas, agent memory patterns, and multi-step task decomposition. Covered Transformers-based agents, smolagents library, and integration patterns with external APIs as tools.
- **How you've applied it**: Directly informed the architecture of Vibe Check (MCP server) — the course's tool-use framing clarified how to expose Git introspection operations as discrete tools that an LLM orchestrator (Claude) calls sequentially to analyze a repository's "vibe." Also deepened understanding of the AI eval framework's design: thinking of each DeepEval metric as an "evaluator agent" with a specific judgment task reinforced why modular, single-purpose evaluation classes are the right design. The function-calling knowledge is directly applicable to OpenAI/Anthropic tool-use APIs.

## Anticipated Questions
- Q: What did you learn from the Hugging Face Agents course?
  - A: The most valuable takeaway was understanding the ReAct loop — how an agent reasons about what tool to call next, calls it, observes the result, and reasons again. This demystified a lot of "magic" in LLM applications. Practically, I learned how to define tools as structured JSON specs with clear input/output contracts, which I applied directly in Vibe Check's MCP server design. I also learned about agent failure modes — infinite loops, hallucinated tool arguments — and how to add guardrails (max iterations, output validation) to make agents reliable.
- Q: How do you apply SOLID principles in your daily work?
  - A: I use Open/Closed and Single Responsibility most actively. When I add a feature, I first ask: can I extend this without modifying existing code? In the eval framework, every new evaluation criterion becomes a new class, not a new if-branch in an existing class. For Single Responsibility, when a class starts doing two distinct things (e.g., a test class both executes API calls and formats reports), I split it. Liskov Substitution I think about when designing inheritance — if a subclass can't honor the base class contract, it's a sign I should use composition instead.
