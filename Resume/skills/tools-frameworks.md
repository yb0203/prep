# Tools & Frameworks

> Corresponding tex: `skills.tex` (line: Tools & Frameworks)

## Proficiency Evidence

### Azure DevOps (ADO)
- **Used in**: Performance engineering framework at Kotak — distributed load testing infrastructure across multiple ADO build agents
- **Depth**: YAML pipeline authoring with parameterized triggers (runtime parameters for test profiles, environment targets). Configuring self-hosted build agents for distributed test execution. Pipeline stages, jobs, and artifact publishing. Boards for sprint tracking. Not deep in Azure cloud services — ADO-specific, not ARM/Bicep.

### Flask
- **Used in**: Centralized Report Server — REST API backend + Jinja2-templated HTML dashboard
- **Depth**: REST endpoint design with Flask blueprints, request/response handling, Jinja2 templating for server-rendered HTML with dynamic data, basic middleware. Chosen over Django for simplicity — no ORM or admin overhead needed for a reporting dashboard. Chosen over FastAPI because the project predates heavy async requirements and team familiarity favored Flask.

### LangChain
- **Used in**: GitaBae RAG chatbot (LangChain + Pinecone + OpenAI/local embeddings)
- **Depth**: RetrievalQA chains for question-answering over a document corpus, document loaders for ingesting text sources, vector store integration (Pinecone), prompt templates, and chain composition. Familiar with the LCEL (LangChain Expression Language) pattern. Not deep in agents/tools within LangChain — used it primarily for retrieval chains.

### JUnit
- **Used in**: Finacle API automation framework — unit tests and integration-level API tests for banking workflows
- **Depth**: JUnit 5 annotations (@Test, @BeforeEach, @AfterEach, @ParameterizedTest), assertion libraries (Assertions), test lifecycle management, organizing test suites. Integration with Maven Surefire plugin for automated test execution in CI.

### Maven
- **Used in**: Finacle API automation framework and performance framework — Java build lifecycle management
- **Depth**: POM configuration, dependency management (managing transitive dependencies, scopes), multi-module project structure, Maven Surefire for test execution, build profiles for environment-specific configuration. Daily driver for Java projects at Kotak.

### Git
- **Used in**: All projects; Vibe Check is literally a Git introspection tool (reads commit history via MCP)
- **Depth**: Feature branch workflow, PR-based code review, rebasing vs. merging trade-offs, resolving merge conflicts, Git hooks (pre-commit for linting/validation). Comfortable on the command line. Vibe Check project required deep understanding of Git's data model (commits, refs, log traversal).

### MongoDB
- **Used in**: Centralized Report Server — storing aggregated test results and report metadata with flexible schema
- **Depth**: Document-oriented data modeling, CRUD operations via PyMongo, querying with filters and projections, indexing for query performance. Chose MongoDB over relational DB because report structures varied across test types (flexible schema advantage). Not deep in aggregation pipelines or sharding.

### DeepEval
- **Used in**: AI Models Evaluation framework — automated evaluation of LLM outputs
- **Depth**: Custom metric classes (subclassing BaseMetric), implementing measure() logic for domain-specific evaluation criteria, modular test case design, integration with Pytest. Used to evaluate RAG faithfulness, answer relevance, and custom crisis-detection metrics. Familiar with DeepEval's scoring interface and test dataset structure.

### Ollama
- **Used in**: Vibe Check MCP server (local LLM inference for commit analysis); local testing for AI eval framework
- **Depth**: Running local LLM inference with models like Mistral and LLaMA 3 via Ollama's REST API. Model pulling and management, switching between models for cost/latency trade-offs, integrating Ollama endpoints as drop-in replacements for OpenAI-compatible APIs in Python code.

## Anticipated Questions
- Q: Why Flask over Django/FastAPI?
  - A: For the Report Server, Flask was the right fit — the project needed a lightweight API backend and server-rendered HTML dashboard, not a full ORM or async I/O. Django would have been overkill (too much scaffolding for a focused internal tool). FastAPI is excellent for async/typed APIs, but Flask was simpler for the team and sufficient for the load. I'd choose FastAPI for a greenfield async API today.
- Q: How deep is your LangChain experience?
  - A: Solid on retrieval chains — I built a full RAG pipeline with LangChain (document loading, chunking, embedding, Pinecone vector store, RetrievalQA chain, prompt templating). I have less experience with LangChain agents and tool-calling specifically; for agent patterns I studied them through the Hugging Face Agents course and built lighter agent-style logic outside LangChain. I'd be comfortable extending my LangChain work into agents with some ramp-up time.
