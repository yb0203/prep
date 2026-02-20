# SDE-1 at Kotak Mahindra Bank

> Corresponding tex: `experience.tex`

## Context
Software Development Engineer at Kotak Mahindra Bank Limited since Aug 2023. Working across performance engineering, centralized reporting, and AI/LLM security evaluation.

## Key Claims & Evidence
<!-- Role-level claims: overall impact, scope of work, team leadership -->

### Role Overview
- **What**: Day-to-day involves designing and building internal developer tooling and infrastructure — specifically performance testing frameworks, CI/CD pipelines in Azure DevOps, and AI/LLM evaluation pipelines. I write mostly Java and Python, run load tests against core banking microservices, triage performance regressions, and maintain shared frameworks used by multiple product teams. There are also recurring code reviews, stakeholder syncs with 5+ consuming teams, and iterative work on a centralized reporting server that aggregates test results across the org.
- **Scope**: Directly impacting 5+ internal engineering teams who consume the shared performance framework and DevPortal. Systems touched span HTTP-based REST microservices, JDBC-backed data services, and ISO 8583 payment protocol services — essentially the core transaction and account layer of the bank. Primary stakeholders include the platform engineering lead, QA chapter, and individual team tech leads across deposits, payments, and lending verticals.
- **Growth**: Started as an individual contributor focused purely on the HTTP layer of the perf framework. Within the first six months, expanded scope to cover JDBC and ISO 8583 protocols after proving reliability of the HTTP layer. By mid-2024 was owning the full framework end-to-end — including the Azure DevOps distributed testing infrastructure, the DevPortal documentation, and starter repo templates. More recently, extended into AI/LLM security evaluation work using DeepEval and Ollama, which is a newer initiative with direct input into model deployment decisions.

## Talking Points
- Why banking after mining engineering at IIT BHU
- Breadth of work: performance, full-stack, AI/ML security
- The non-obvious pivot: mining engineering builds strong systems-thinking and quantitative analysis skills — both directly applicable to performance engineering and capacity planning in fintech
- Ownership model: as an SDE-1, taking end-to-end ownership of a framework consumed by 5+ teams is atypical; speak to why that happened and what it required
- The 70% onboarding reduction is a concrete, measurable outcome — lead with it and explain the before/after clearly
- AI/LLM security evaluation is a differentiator; not many SDE-1s at traditional banks are running LLM red-teaming pipelines with DeepEval and Ollama

## Anticipated Questions
- Q: Why did you choose banking/fintech?
  - A: Honestly, it wasn't the plan coming out of IIT BHU. I studied Mining Engineering but spent most of my time building side projects and doing competitive programming. When Kotak came to campus for SDE roles, I saw it as a chance to do serious software engineering on systems that handle real money at scale — transactions, payments, authentication — where correctness and performance actually matter in a high-stakes way. The rigor that comes with fintech constraints turned out to be a great environment to grow fast as an engineer.

- Q: What's your biggest impact at Kotak?
  - A: The performance and automation framework, specifically the 70% reduction in onboarding time for internal teams. Before this, each team that wanted to run load tests had to figure out JMeter configuration, protocol handling, auth token management, and ADO pipeline setup from scratch — often taking 2–3 weeks. I built a set of starter repo templates and a DevPortal page that gave teams a working perf test suite in under a day. That multiplied across 5+ teams means hundreds of hours saved and significantly more consistent test coverage across the org. The secondary impact is that the distributed ADO infrastructure means teams can now simulate realistic concurrent load that wasn't possible before.

- Q: How do you prioritize across multiple projects?
  - A: I use a combination of urgency (is a team blocked right now?) and leverage (does this improvement benefit one team or five?). For example, fixing the auth token expiry bug was top priority the moment it surfaced because it was causing every load test run longer than 15 minutes to fail — that was blocking multiple teams immediately. In contrast, the DevPortal and starter repo work was scheduled work with a clear ROI argument: investing two weeks to build templates would save weeks of repeated setup across every future team onboarding. I also communicate tradeoffs explicitly with the platform lead so nothing gets deprioritized silently.
