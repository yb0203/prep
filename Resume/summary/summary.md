# Summary

> Corresponding tex: `summary.tex`

## Context
The opening statement of the resume. Must be defensible in every claim.

## Key Claims & Evidence

### "Software Engineer with 2+ years of experience building scalable banking solutions via Java and Python."
- **What**: Started Aug 2023 at Kotak Mahindra Bank as SDE-1. As of Feb 2026, that is 2.5 years of production engineering experience. In that time, 3 major production systems were designed and shipped: (1) a distributed performance testing framework used by 5+ teams across the bank, (2) a centralized report server that consolidates test results and metrics from multiple squads into a single dashboard, and (3) an LLM/AI evaluation framework for assessing banking-specific model outputs against security and quality benchmarks.
- **Metrics**: 5+ internal teams adopted the performance framework. Report server serves multiple teams. AI eval framework covers OWASP LLM Top 10 threat categories. All systems are in active production use within Kotak's engineering org.
- **Evidence**: Experience section projects (perf framework, report server, AI eval). Languages are Java (primary for banking microservices, Spring Boot, load test orchestration) and Python (AI/LLM evaluation scripting, DeepEval custom metrics, automation tooling).

### "Expert in performance automation, AI/LLM evaluation, and distributed services."
- **What**: "Expert" is earned through depth, not just usage:
  - **Performance automation**: Did not merely run JMeter scripts. Designed a full framework from scratch — custom protocols for banking APIs, distributed load generation across multiple nodes via Azure DevOps pipelines, parameterized test suites per microservice, and integrated reporting. Solved real engineering problems: thread contention, connection pool exhaustion, realistic transaction load simulation.
  - **AI/LLM evaluation**: Built custom DeepEval metrics tailored to banking use cases — hallucination detection on financial data, PII leakage checks, prompt injection resistance. Mapped each metric to OWASP LLM Top 10 threat categories (e.g., LLM01 Prompt Injection, LLM06 Sensitive Information Disclosure). This is not surface-level usage of an off-the-shelf tool; the metrics and threat mappings were custom-engineered.
  - **Distributed services**: Report server was built as a microservice that aggregates data from heterogeneous sources (multiple test frameworks, different teams) using a consistent ingestion API. Designed for horizontal scalability and async processing.
- **Evidence**: Perf framework (custom protocols, distributed ADO pipeline execution), AI eval (OWASP mapping, DeepEval custom metrics, output validation pipeline), report server (distributed architecture, multi-team ingestion).

### "Proven track record in optimizing CI/CD workflows and high-impact banking products while ensuring AI security and guardrails."
- **What**:
  - **CI/CD workflows**: Built ADO (Azure DevOps) pipeline templates for the performance testing framework that allow any team to onboard their microservice for load testing by simply referencing a shared pipeline template — no per-team boilerplate. This reduced new-team onboarding time significantly. Also automated the report server's data ingestion trigger via CI pipeline hooks so test results publish automatically after each run.
  - **Banking products**: The performance framework directly tests the bank's core banking microservices (account management, transactions, notifications). The report server is embedded in the QA workflow for high-visibility releases. These are not toy projects — they run in the bank's internal engineering infrastructure.
  - **AI guardrails**: In the LLM evaluation framework, implemented guardrails as DeepEval custom metrics that validate model outputs before they are surfaced to users. Specific guardrails include: (a) output toxicity filtering, (b) factual grounding checks against known banking FAQs, (c) PII detection in model responses, (d) prompt injection attempt classification. Each guardrail maps to a specific OWASP LLM Top 10 category and has a defined pass/fail threshold.
- **Evidence**: ADO pipeline templates (CI/CD), DevPortal banking product integration, DeepEval compliance guardrails with OWASP mapping.

## Talking Points
- This summary is the "elevator pitch" — practice delivering it in 30 seconds
- Be ready to back up "expert" and "proven track record" with specifics

## Elevator Pitch (30-second version)
"I'm a software engineer with two and a half years at Kotak Mahindra Bank, where I've built three production systems from scratch: a distributed performance testing framework adopted by five-plus teams, a centralized reporting server for QA metrics, and an LLM evaluation framework with AI security guardrails mapped to OWASP standards. My focus is engineering at the intersection of banking infrastructure and AI/ML — making sure high-stakes financial systems are both fast and trustworthy."

_Key emphasis points for delivery: "from scratch" (not just configuration), "five-plus teams" (adoption = impact), "OWASP" (signals security credibility), "banking AI" (differentiator for fintech roles)._

## Anticipated Questions
- Q: What do you mean by "scalable banking solutions"?
  - A: Scalable in two dimensions. First, technical scale — the performance framework is designed to simulate thousands of concurrent users hitting core banking APIs, with distributed load generation so a single machine is never the bottleneck. Second, organizational scale — the report server and CI pipeline templates are built so any new team at the bank can onboard without writing custom infrastructure. One centralized system serving many teams. Both meanings apply.

- Q: Can you give an example of an AI guardrail you implemented?
  - A: Sure. In our LLM evaluation framework, I built a custom DeepEval metric for PII detection. When the model generates a response, the guardrail runs a structured check on the output — scanning for patterns matching Aadhaar numbers, PAN card formats, account number structures, and phone numbers. If any are detected, the response fails validation and is flagged before it reaches the user. This maps to OWASP LLM06 — Sensitive Information Disclosure. The threshold and patterns were tuned specifically for Indian banking data formats, which off-the-shelf tools don't cover well out of the box.
