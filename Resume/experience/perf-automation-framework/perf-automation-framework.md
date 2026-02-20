# Performance & Automation Framework

> Corresponding tex: `perf-automation-framework.tex`

## Context
Built a scalable performance testing framework supporting HTTP, JDBC, and ISO protocols to evaluate core banking microservices at Kotak Mahindra Bank.

## Key Claims & Evidence

### "Built a scalable performance framework for HTTP, JDBC, and ISO protocols to evaluate core microservices."
- **What**: [Fill in: what protocols, what microservices, what scale?]
- **Metrics**: [Fill in: requests/sec, latency improvements, services covered]
- **How**: [Fill in: JMeter? Gatling? Custom? Architecture decisions]
- **Why**: [Fill in: what was failing before? what triggered this need?]

### "Implemented auth token refresh mechanisms, preventing mid-load test failures due to expired credentials."
- **What**: [Fill in: what auth system? OAuth2? JWT? How did tokens expire?]
- **Metrics**: [Fill in: how many test runs were failing before? What % improvement?]
- **How**: [Fill in: token refresh logic, retry mechanisms, thread safety]
- **Why**: [Fill in: load tests were failing mid-run, wasting hours of execution]

### "Developed Azure DevOps scripts for distributed load testing, enhancing cross-team infrastructure scalability."
- **What**: [Fill in: ADO pipelines? YAML? Shell scripts? What distribution model?]
- **Metrics**: [Fill in: how many agents, concurrent users, teams served]
- **How**: [Fill in: pipeline design, agent provisioning, parameterization]
- **Why**: [Fill in: teams couldn't run load tests at scale without shared infra]

### "Accelerated adoption via DevPortal and starter repos, reducing onboarding time by 70% for 5+ internal teams."
- **What**: [Fill in: what is DevPortal? What were the starter repos?]
- **Metrics**: 70% reduction in onboarding time, 5+ teams adopted
- **How**: [Fill in: documentation, templates, example configs]
- **Why**: [Fill in: teams were spending weeks setting up perf testing from scratch]

## Talking Points
- [Fill in: STAR stories for system design interviews]
- [Fill in: how to frame for "tell me about a technical challenge"]

## Anticipated Questions
- Q: How did you decide on the protocol support (HTTP vs JDBC vs ISO)?
  - A: [Fill in]
- Q: How did you handle distributed load generation?
  - A: [Fill in]
- Q: What was the hardest part of getting teams to adopt the framework?
  - A: [Fill in]

## Technical Deep-Dive
[Fill in: architecture diagram description, tech stack, key design decisions]
