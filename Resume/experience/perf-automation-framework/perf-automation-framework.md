# Performance & Automation Framework

> Corresponding tex: `perf-automation-framework.tex`

## Context
Built a scalable performance testing framework supporting HTTP, JDBC, and ISO protocols to evaluate core banking microservices at Kotak Mahindra Bank.

## Key Claims & Evidence

### "Built a scalable performance framework for HTTP, JDBC, and ISO protocols to evaluate core microservices."
- **What**: Framework covers three protocol layers: (1) HTTP — REST API load testing for account, transaction, and auth microservices; (2) JDBC — connection pool stress testing against core banking databases to surface contention and timeout issues under concurrent load; (3) ISO 8583 — payment message protocol testing for card transaction services. Scale: up to ~500 concurrent virtual users per run, targeting throughput and p95/p99 latency SLOs per service.
- **Metrics**: Framework covers 10+ core microservices. Baseline benchmarks established for p95 latency targets (e.g., <200ms for account lookup, <500ms for payment initiation). JDBC tests identified a connection pool exhaustion issue at 300 concurrent users that was not caught in unit/integration tests. ISO tests caught a message parsing regression in a payment service before it reached production.
- **How**: Built on Apache JMeter as the core engine for HTTP and JDBC protocol execution. ISO 8583 testing uses a custom Java client library (built on top of jPOS) integrated as a JMeter Java sampler, allowing ISO message construction and assertion within the same test plan. Test plans are parameterized via CSV datasets and JMeter properties files so load profiles (ramp-up, steady-state, spike) are fully configurable without touching test logic. Maven is used for dependency management and test packaging.
- **Why**: Before this framework existed, performance testing was ad-hoc — individual teams wrote one-off JMeter scripts that weren't reusable, didn't cover JDBC or ISO at all, and had no consistent reporting. A production incident caused by a connection pool issue that would have been caught by structured load testing was the direct trigger for building this systematically.

### "Implemented auth token refresh mechanisms, preventing mid-load test failures due to expired credentials."
- **What**: Core banking microservices use JWT-based OAuth2 tokens issued by an internal identity provider. Tokens have a 15–30 minute TTL. Load tests longer than 15 minutes — which is typical for soak and stress test scenarios — were failing with 401 Unauthorized errors mid-run because JMeter's default behavior doesn't handle token refresh.
- **Metrics**: Before the fix, any test run exceeding 15 minutes had a near-100% failure rate from auth errors, making soak tests (typically 30–60 minutes) completely unusable. After implementing the refresh mechanism, zero mid-run auth failures were observed across subsequent runs. This unblocked soak testing for all services in the framework.
- **How**: Implemented a JMeter pre-processor (BeanShell/JSR223 with Groovy) that runs before each thread group iteration to check token expiry and proactively refresh it by calling the identity provider's token endpoint before the TTL elapses. The refresh logic reads the token issue time from a thread-local JMeter variable, computes remaining TTL, and triggers a refresh HTTP request with client credentials if TTL is below a configurable threshold (default: 2 minutes remaining). Refresh is thread-safe — each virtual user thread manages its own token independently to avoid shared-state race conditions.
- **Why**: Soak tests are critical for catching memory leaks, connection pool degradation, and slow resource exhaustion — all of which require runs of 30+ minutes. Without working auth, the entire soak test category was a dead end. The fix was also architecturally necessary to make the framework trustworthy for production-readiness sign-off.

### "Developed Azure DevOps scripts for distributed load testing, enhancing cross-team infrastructure scalability."
- **What**: YAML-based Azure DevOps pipelines that orchestrate distributed JMeter load generation across multiple self-hosted agents. Each agent runs a JMeter worker node; the controller node is a dedicated ADO agent that aggregates results and publishes reports. Pipelines are parameterized with load profile inputs (target RPS, ramp duration, steady-state duration, test plan file path) so teams can trigger runs with custom profiles without modifying YAML.
- **Metrics**: Supports up to 5 distributed agent nodes running concurrently, enabling ~2,500 concurrent virtual users across the agent pool — a scale not achievable from a single machine. Serves 5+ teams who trigger pipelines via ADO UI or API. Eliminates the need for teams to provision and manage their own load generation infrastructure.
- **How**: Controller pipeline YAML uses ADO's `matrix` strategy to fan out JMeter worker jobs across agents in parallel. Worker agents receive the test plan artifact (packaged as a Maven artifact or ADO pipeline artifact), execute JMeter in server mode, and write results to a shared Azure File Share mount. After all workers complete, the controller job pulls the distributed .jtl result files, merges them using JMeter's merge results tool, generates an HTML report, and publishes it as an ADO pipeline artifact. Pipeline variables and variable groups handle environment-specific config (target hostnames, credential references from Azure Key Vault).
- **Why**: Individual teams were either running single-node JMeter tests that couldn't generate enough load to stress production-scale services, or weren't running load tests at all because the infrastructure setup cost was too high. The shared ADO pipeline turns load testing into a self-service, one-click operation.

### "Accelerated adoption via DevPortal and starter repos, reducing onboarding time by 70% for 5+ internal teams."
- **What**: DevPortal is an internal developer portal (built on Backstage) where the framework is documented with getting-started guides, protocol-specific tutorials, ADO pipeline usage instructions, and an FAQ for common failure modes. Starter repos are GitHub template repositories pre-configured with a working JMeter test plan for each protocol (HTTP, JDBC, ISO), a Maven project structure, sample CSV datasets, and the ADO pipeline YAML — everything a team needs to run their first load test without writing any boilerplate.
- **Metrics**: 70% reduction in onboarding time — measured by comparing the average time for a team to go from zero to running their first parameterized load test. Before the DevPortal and templates, this typically took 2–3 weeks of back-and-forth. After, teams consistently ran their first test within 1–2 days. 5+ internal teams adopted the framework across payments, deposits, and lending verticals.
- **How**: Starter repos use GitHub's template repository feature. Each repo includes a README with a 5-step quickstart, pre-filled JMeter test plan targeting a configurable base URL, a `config.properties` file for environment parameters, and the complete ADO pipeline YAML. The DevPortal page on Backstage links to all three starter repos, includes an architecture diagram of the distributed testing setup, and has a troubleshooting section derived from the most common support questions received during early adoption.
- **Why**: The framework itself being technically solid wasn't enough — early adopter teams were spending weeks just trying to configure JMeter correctly, understand how to wire in auth, or figure out how to trigger the ADO pipeline. The support burden on me was growing linearly with each new team. The DevPortal and starter repos were a force multiplier: invest once, eliminate recurring hand-holding for every subsequent team.

## Talking Points

- **STAR: Auth Token Refresh (for "tell me about a technical challenge")**
  - **Situation**: Teams were running soak tests that required 30–60 minute runs to catch resource exhaustion bugs. Every test run longer than 15 minutes was failing with 401 errors because JWT tokens expired mid-test.
  - **Task**: Fix the auth issue in a way that worked generically for all services using the bank's internal identity provider, without requiring per-service customization.
  - **Action**: Analyzed how JMeter's threading model works to identify where token refresh logic needed to hook in. Built a JSR223 pre-processor in Groovy that checked token TTL per-thread before each request group and refreshed proactively when TTL dropped below 2 minutes. Made the threshold configurable via a JMeter property so teams could tune it.
  - **Result**: Zero mid-run auth failures in all subsequent test runs. Unblocked soak testing across all framework-covered services. Teams could now run 60-minute stress tests with confidence.

- **STAR: DevPortal Adoption (for "how do you drive adoption of internal tools")**
  - **Situation**: The framework was technically complete and working but adoption was slow — only 2 teams using it after the first month, mostly because setup was still confusing.
  - **Task**: Reduce friction so teams could self-serve without needing me to walk them through setup each time.
  - **Action**: Surveyed early adopters for the top 5 pain points. Built starter repos that pre-solved all 5 (auth config, ADO pipeline wiring, CSV parameterization, result publishing, protocol selection). Wrote DevPortal docs structured around the jobs teams actually wanted to do ("I want to load test my REST API") rather than reference documentation.
  - **Result**: Onboarding time dropped 70%. 5+ teams onboarded independently with no synchronous support. Support requests dropped from multiple per week to near-zero.

- **For system design discussions**: Frame the distributed ADO architecture as a producer-consumer pipeline with artifact passing between stages — relevant for any distributed job execution design question.

- **Protocol choice narrative**: The three protocols map directly to the three layers of a core banking system — HTTP for the API layer, JDBC for the data persistence layer, and ISO 8583 for the payment network integration layer. Covering all three means perf regressions at any layer are caught before release.

## Anticipated Questions

- Q: How did you decide on the protocol support (HTTP vs JDBC vs ISO)?
  - A: It followed the architecture of the bank's core services. HTTP covers the REST microservice APIs that client-facing apps call. JDBC covers the database layer — specifically connection pool behavior under concurrent read/write load, which is a common failure mode in high-throughput banking systems. ISO 8583 is the payment messaging standard used by card networks; the bank's payment services speak ISO 8583 natively, and no generic HTTP/REST framework would catch protocol-level issues there. The sequencing was also pragmatic: HTTP was simplest to instrument and had the widest coverage, so I proved the framework concept there before investing in the JDBC and ISO integrations.

- Q: How did you handle distributed load generation?
  - A: Using JMeter's built-in controller/worker mode, orchestrated via Azure DevOps. The ADO pipeline fans out worker jobs using a matrix strategy across a pool of self-hosted agents — each agent runs JMeter in server mode and receives the test plan as a pipeline artifact. The controller job coordinates start/stop and collects .jtl result files from all workers via a shared Azure File Share. After workers complete, results are merged into a single dataset and an HTML report is published as a pipeline artifact. The key design decision was keeping the test plan and configuration as pipeline artifacts rather than baking them into the agent images — that way any team's test plan can run on any agent without custom agent setup.

- Q: What was the hardest part of getting teams to adopt the framework?
  - A: The hardest part was that "just use JMeter" felt like extra work to teams who were already shipping features. The framework had to be so easy that the cost of adoption was less than the cost of the next production incident it would prevent. The turning point was realizing that documentation structured around tasks ("run your first load test in 30 minutes") converted far better than reference docs. The starter repos removed the blank-page problem entirely — teams clicked "Use this template," cloned it, changed a base URL, and had a working test. Once early adopters had success stories, word-of-mouth within the org did the rest.

## Technical Deep-Dive

**Architecture overview:**
- Core engine: Apache JMeter, managed as a Maven dependency, executed headlessly via the JMeter Maven Plugin or CLI in CI.
- Protocol adapters: HTTP via JMeter's built-in HTTP sampler; JDBC via JMeter's JDBC sampler with configurable connection pool parameters; ISO 8583 via a custom Java sampler wrapping jPOS for message construction, sending, and response assertion.
- Auth layer: JSR223 (Groovy) pre-processor per thread group; reads token issue timestamp from JMeter thread-local variable, computes remaining TTL, fires a refresh request to the OAuth2 token endpoint if TTL < configurable threshold. Each thread manages its own token to avoid cross-thread state.
- Distributed execution: JMeter controller/worker topology. Workers started via ADO agent matrix jobs. Results written to Azure File Share, merged by controller node post-execution.
- Reporting: JMeter HTML Dashboard generated from merged .jtl files; published as ADO pipeline artifact. Key metrics surfaced: throughput (req/sec), error rate, p50/p90/p95/p99 latency, active threads over time.
- Config management: Environment-specific parameters (hostnames, credentials) stored in ADO variable groups linked to Azure Key Vault. Test-specific parameters (load profile, ramp duration, thread count) passed as ADO pipeline variables at trigger time.
- Tech stack: Java 11, Groovy (JMeter scripting), Python (ADO automation scripts, result post-processing), Maven, Azure DevOps YAML pipelines, JUnit for framework unit tests, jPOS for ISO 8583 message handling.
