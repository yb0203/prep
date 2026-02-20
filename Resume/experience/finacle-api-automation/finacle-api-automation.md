# Finacle API Automation Framework

> NOTE: This project does not currently have a corresponding .tex block in the resume (it is not listed in experience.tex). This file is retained as supporting context and interview preparation material. If this project is added to the resume in the future, a corresponding .tex file should be created and this note updated.

## Context

Designed and implemented a comprehensive Java-based API automation framework for Finacle banking APIs, significantly reducing testing time and improving overall system quality. Manual testing of Finacle APIs was time-consuming and error-prone, with test data preparation requiring extensive manual effort and no centralized framework in place across multiple Finacle modules. This project delivered a reusable, modular framework that resolved a testing bottleneck delaying release cycles.

## Key Claims & Evidence

### "90% reduction in testing time"
- **What**: Automated the end-to-end API testing workflow for Finacle banking APIs, replacing manual test execution with a framework-driven approach.
- **Metrics**: 90% reduction in testing time.
- **How**: Built a modular Java framework with automated test execution, data-driven test cases, and automated teardown/cleanup — eliminating the manual setup-execute-verify cycle.
- **Why**: Manual API testing was a release bottleneck; automation directly unblocked faster delivery cycles.

### "70% reduction in data prep effort"
- **What**: Automated test data generation and cleanup, removing the manual effort required to prepare valid banking data states before each test run.
- **Metrics**: 70% reduction in data preparation effort.
- **How**: Implemented automated data generation and cleanup mechanisms within the framework, so tests could create, use, and tear down their own data without manual intervention.
- **Why**: Banking API testing requires precise data states (account statuses, transaction histories, loan configurations) — manual data prep was slow, inconsistent, and a source of test flakiness.

### "124 bugs identified, ~80% resolution rate"
- **What**: The framework surfaced 124 bugs across Finacle API modules that had not been caught by manual testing.
- **Metrics**: 124 bugs identified; approximately 80% resolved.
- **How**: Systematic coverage of account management, transaction processing, customer master, loan/credit, and regulatory compliance APIs; automated regression runs that caught edge cases manual testers had missed.
- **Why**: Banking APIs carry high correctness requirements — undetected bugs in transaction or compliance APIs have direct regulatory and financial consequences.

## Talking Points

- The key insight was that test data strategy is as important as the test logic itself. Banking domains have complex, interdependent data states — automating data preparation was what made the 90% time reduction possible.
- A page-object-inspired modular architecture meant that when Finacle APIs changed, only the relevant module needed updating — not the entire framework.
- Identifying 124 bugs validated the framework investment: manual testing had been missing a significant portion of defects.
- Banking domain complexity required deep understanding of business rules (loan eligibility logic, regulatory compliance rules, transaction processing constraints) — the framework encoded this knowledge, making it reusable across the team.
- Framework extensibility was a deliberate design priority because Finacle has many modules — the framework needed to grow without becoming a maintenance burden.

## Anticipated Questions

- Q: What made Finacle API testing particularly challenging compared to standard REST API testing?
  - A: Finacle is a core banking system with deeply interdependent modules. Testing a transaction API, for example, requires valid account states, customer master data, and sometimes loan configurations to all be in specific states simultaneously. The data dependency complexity was the hardest part — which is why automating data preparation delivered such a large reduction in effort.

- Q: What does "page-object-inspired architecture" mean for API testing?
  - A: In UI testing, the page object pattern separates page structure from test logic. I applied the same principle to API testing: each Finacle API module (accounts, transactions, loans, etc.) had its own class encapsulating the endpoint details and request/response handling. Test logic stayed separate from API implementation details, making both easier to maintain.

- Q: How did you ensure the framework stayed maintainable as Finacle APIs changed?
  - A: The modular design meant each API module was independently encapsulated. When an endpoint changed, only its module class needed updating. Automated cleanup mechanisms also ensured tests didn't leave stale data that would break subsequent runs.

- Q: What types of bugs did the framework find that manual testing had missed?
  - A: Primarily edge cases in transaction processing (boundary amounts, concurrent operations), input validation gaps in customer master APIs, and compliance rule enforcement inconsistencies — things that are hard to systematically cover manually but straightforward to automate with data-driven test cases.

## Technical Deep-Dive

- **Language**: Java.
- **Testing Scope**: Account management APIs, transaction processing APIs, customer master APIs, loan and credit APIs, regulatory compliance APIs.
- **Framework Design**: Modular, page-object-inspired architecture with independently maintained module classes for each Finacle API domain.
- **Test Data**: Automated generation and cleanup mechanisms — tests created their required data states and cleaned up after execution, enabling reliable, repeatable runs.
- **Architecture Pattern**: Data-driven test cases with parameterized inputs, allowing broad coverage of valid and invalid input combinations without duplicating test logic.
- **Domain Coverage**: Framework encoded banking business rules (regulatory compliance constraints, loan eligibility logic, transaction processing rules) to enable meaningful assertions beyond basic HTTP status checks.
