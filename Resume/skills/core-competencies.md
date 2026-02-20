# Core Competencies

> Corresponding tex: `skills.tex` (line: Core Competencies)

## Proficiency Evidence

### Performance Engineering
- **Evidence**: Built a multi-protocol performance testing framework at Kotak Mahindra Bank; designed distributed load testing infrastructure using ADO agents
- **Depth**: Track latency (mean, p95, p99), throughput (requests/sec), error rate, and resource utilization (CPU, memory) as core metrics. Identify bottlenecks by profiling hot paths, correlating latency spikes with GC pauses or thread contention, and isolating slow API endpoints. Familiar with JMeter for load generation and custom framework code for protocol-specific testing. Understanding of Little's Law for capacity reasoning.

### Distributed Systems
- **Evidence**: Distributed load testing across multiple ADO build agents; Centralized Report Server aggregating results from parallel test runners across environments
- **Depth**: Practical experience with distributing work (test execution) across agents and aggregating results centrally — a coordinator/worker pattern. Understanding of the consistency/availability trade-off (CAP theorem at conceptual level): the report server prioritizes availability and eventual consistency of aggregated data over strict consistency. Familiar with microservices architecture patterns from Kotak's banking platform context. Not a distributed databases expert but can reason about partition tolerance and failure modes.

### RAG
- **Evidence**: GitaBae RAG chatbot — embed Bhagavad Gita text, retrieve relevant shlokas, generate contextual responses (LangChain + Pinecone + OpenAI)
- **Depth**: Full pipeline: document chunking (chunk size and overlap tuning to balance context completeness vs. retrieval precision), embedding generation (OpenAI embeddings), vector similarity search (cosine similarity in Pinecone), prompt construction with retrieved context, generation via LLM. Aware of failure modes: hallucination when retrieval misses, chunk boundary issues losing context, and embedding model mismatch degrading retrieval quality.

### AI Guardrails
- **Evidence**: DeepEval custom evaluation metrics in AI Models Evaluation framework; crisis keyword detection in GitaBae (routing distressed users away from chatbot responses)
- **Depth**: Two layers: input validation (keyword/intent filtering — flagging crisis signals before reaching LLM) and output validation (DeepEval metrics checking for faithfulness, relevance, and harmful content). First-principles approach: treat guardrails as a separate evaluation layer, not embedded in the LLM prompt. Custom DeepEval metrics operationalize specific safety and quality criteria as automated test cases.

### OOPS
- **Evidence**: Modular class design across Finacle automation framework, AI eval framework, and report server
- **Depth**: Applies SOLID principles in practice — particularly Open/Closed (evaluation metric classes are open for extension, closed for modification: add a new metric by subclassing BaseMetric, not editing existing classes) and Single Responsibility (each test class owns one concern). Uses Strategy pattern for swappable evaluation logic in the AI eval framework, and Factory pattern for creating protocol-specific test runners in the performance framework. Familiar with inheritance vs. composition trade-offs.

### DSA
- **Depth**: Studied algorithms and data structures rigorously at IIT BHU, including competitive programming. Comfortable solving LeetCode medium-level problems: sliding window, two pointers, BFS/DFS graph traversal, dynamic programming (1D/2D), binary search variants, and heap-based problems. Applied DSA thinking in framework optimizations — e.g., using priority queues for scheduling test tasks, hash maps for O(1) result lookups.
- **Comfort level**: Confidently solves mediums; hard problems require more time and are hit-or-miss depending on pattern familiarity. Not actively competitive programming now but revisit LeetCode for interview prep.

### Agile
- **Evidence**: Sprint-based development at Kotak Mahindra Bank across performance and automation projects
- **Depth**: 2-week sprint cycles, daily standups, sprint planning and retrospectives. Jira for backlog management and task tracking. PR-based code review as part of definition of done. Comfortable with iterative delivery — the report server and automation framework both evolved across multiple sprints with incremental feature additions rather than big-bang releases.

## Anticipated Questions
- Q: Explain a distributed system you've built
  - A: The distributed load testing infrastructure at Kotak. The problem: a single agent couldn't generate sufficient load for realistic banking API performance tests. Solution: orchestrate test execution across multiple ADO build agents in parallel, each running a subset of the test scenarios, then funnel all results into a centralized Flask-based report server. The coordinator (ADO pipeline) fans out parameterized test jobs to N agents; each agent writes results to a shared store; the report server aggregates, normalizes, and renders consolidated dashboards. Key challenges were result consistency (agents finish at different times) and ensuring the aggregation layer was idempotent.
- Q: How do you approach performance testing?
  - A: Define objectives first — what SLA are we testing against? (e.g., p99 < 500ms under 500 concurrent users). Then: baseline measurement with no load, ramp-up test to find the breaking point, soak test for memory leaks over sustained load. Instrument with latency percentiles (p50/p95/p99), throughput, and error rate. When a bottleneck appears, profile to isolate — is it CPU-bound, I/O-bound, or lock contention? Fix the bottleneck, re-run, and compare delta. Document the results in the report server for trend analysis across releases.
