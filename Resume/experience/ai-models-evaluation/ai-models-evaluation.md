# AI Models Evaluation & Security

> Corresponding tex: `experience/ai-models-evaluation/ai-models-evaluation.tex`

## Context

Developed a comprehensive LLM evaluation framework to identify and assess OWASP security vulnerabilities specific to banking use cases. Banks face significant security and compliance risks when deploying LLMs, with limited tooling available to evaluate those risks in a domain-specific context. This project delivered a modular, extensible evaluation pipeline using DeepEval that translated banking compliance requirements — including OWASP Top 10, PCI-DSS, and RBI guidelines — into automated model assessments.

## Key Claims & Evidence

### "Built an LLM evaluation framework to identify 10+ OWASP security vulnerabilities in banking use cases."
- **What**: Designed and implemented a custom evaluation framework that systematically tested LLMs against OWASP security vulnerability categories adapted for the banking domain.
- **Metrics**: Identified 10+ distinct OWASP security vulnerabilities applicable to banking LLM deployments.
- **How**: Mapped OWASP Top 10 categories to LLM-specific attack surfaces (prompt injection, jailbreaking, data poisoning, model inversion, hallucination on sensitive data, bias in credit/lending contexts, etc.) and built test cases for each.
- **Why**: No standardized tooling existed to evaluate LLM security in a banking context prior to production deployment, creating compliance and reputational risk.

### "Integrated compliance guardrails via DeepEval using modular classes to validate critical model outputs."
- **What**: Built modular, composable evaluation classes on top of DeepEval that enforced compliance guardrails — validating model outputs against banking regulatory requirements before outputs could be considered safe.
- **Metrics**: Reusable modular architecture enabling framework scalability across multiple model types and use cases.
- **How**: Translated business and compliance requirements (PCI-DSS, RBI guidelines) into technical evaluation specifications; implemented each as an independent, composable class within the DeepEval pipeline.
- **Why**: A modular design was essential so that new compliance requirements or model types could be added without rewriting the framework — accelerating adoption across teams.

### "Mitigated 120+ bugs within core API infrastructure, significantly enhancing production system resiliency."
- **What**: Identified and resolved over 120 bugs across the core API infrastructure supporting the evaluation platform and production banking systems.
- **Metrics**: 120+ bugs mitigated; significant improvement in production system resiliency.
- **How**: Combined systematic API testing (similar in spirit to the Finacle framework) with the evaluation pipeline to surface infrastructure-level issues alongside model-level vulnerabilities.
- **Why**: Infrastructure bugs in banking API systems carry direct compliance and operational risk — resolving them was as important as the model-level security work.

## Talking Points

- The core challenge was that standard OWASP guidance is not written for LLMs — it required deliberate translation work to map vulnerability categories to LLM-specific attack vectors in a banking context.
- DeepEval provided the evaluation scaffolding, but the domain-specific value came from the custom modular classes that encoded banking compliance logic.
- The modular class design was a deliberate architectural decision: banking compliance requirements change, and the framework needed to evolve without becoming a maintenance burden.
- Identifying 120+ API infrastructure bugs was a side effect of rigorous testing — the evaluation pipeline surfaced issues that manual testing had missed.
- Created high-level design docs and roadmaps alongside the framework to ensure continued development and team adoption after handoff.

## Anticipated Questions

- Q: What does it mean to identify OWASP vulnerabilities in an LLM context specifically?
  - A: OWASP's traditional vulnerability categories (injection, broken access control, etc.) manifest differently in LLMs. For example, "injection" in an LLM context means prompt injection — crafting inputs that override system instructions. I mapped each relevant OWASP category to its LLM equivalent and built test cases that probed the model for each vulnerability type in realistic banking scenarios.

- Q: Why DeepEval specifically?
  - A: DeepEval provided a well-structured evaluation pipeline with support for custom metrics, making it a natural foundation. The key contribution was building domain-specific modular classes on top of it that encoded banking compliance logic — DeepEval handled the plumbing, the custom classes handled the domain expertise.

- Q: How did modular classes improve the framework?
  - A: Each compliance requirement was encapsulated in its own class, making it independently testable and swappable. Adding a new regulatory requirement meant writing a new class, not modifying existing logic. This kept the framework extensible without accumulating technical debt.

- Q: What kinds of bugs were in the 120+ you mitigated?
  - A: Infrastructure-level API bugs — things like incorrect error handling, edge cases in input validation, and response inconsistencies that could create security or compliance gaps in production banking systems. These were surfaced through rigorous API testing conducted alongside the LLM evaluation work.

- Q: How did you handle hallucination as a security vulnerability?
  - A: Hallucination in banking LLMs is a direct compliance risk — a model confidently providing incorrect account balances or regulatory guidance is not just wrong, it's a liability. I built evaluation cases that tested model outputs against known-correct data for sensitive financial queries and flagged confidence-accuracy mismatches.

## Technical Deep-Dive

- **Evaluation Framework**: DeepEval as the base pipeline, extended with custom modular evaluation classes.
- **Vulnerability Scope**: Prompt injection, jailbreaking, data poisoning, training data manipulation, model inversion, membership inference, hallucination on sensitive financial data, bias in credit/lending contexts.
- **Compliance Mapping**: OWASP Top 10 adapted for LLM attack surfaces; PCI-DSS and RBI guideline requirements translated into evaluation specifications.
- **Architecture**: Extensible evaluation pipeline supporting multiple model types; modular class design allowing independent addition of new compliance requirements.
- **Documentation**: High-level design documents and development roadmaps created to support long-term framework maintenance and team adoption.
- **Infrastructure Testing**: API-level testing that identified 120+ bugs in core banking API infrastructure, improving production resiliency alongside the model evaluation work.
