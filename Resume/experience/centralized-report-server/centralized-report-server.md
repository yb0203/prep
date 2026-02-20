# Centralised Report Server

> Corresponding tex: `experience/centralized-report-server/centralized-report-server.tex`

## Context

Engineered a centralized reports platform using Python and Flask that improved cross-team visibility and reporting efficiency across the organization. Multiple teams had been maintaining separate, disconnected reporting systems with no unified dashboard for organization-wide visibility. This project consolidated those systems into a single platform with automated onboarding and real-time data refresh.

## Key Claims & Evidence

### "Engineered high-performance APIs for automated report stats comparison, reducing manual verification time by 90%."
- **What**: Built APIs that automated the comparison of report statistics, eliminating the need for manual side-by-side verification of report outputs.
- **Metrics**: 90% reduction in manual verification time.
- **How**: Optimized query performance and caching mechanisms; automated data refresh cycles to reduce staleness in comparisons.
- **Why**: Manual report verification across fragmented systems was time-consuming and error-prone, creating a bottleneck for teams that depended on accurate reporting.

### "Optimized server storage via granular log control mechanisms, saving 90% space per report instance."
- **What**: Implemented fine-grained log management controls that selectively retained only necessary log data per report instance, drastically reducing storage footprint.
- **Metrics**: 90% storage savings per report instance.
- **How**: Designed granular log control mechanisms that filtered and pruned log output at the report level rather than applying blanket retention policies.
- **Why**: As report volume grew across teams, uncontrolled log accumulation would have made the centralized server unsustainable from a storage and operational cost perspective.

### "Architected a responsive dashboard using Python and Flask for real-time visualization and metric tracking."
- **What**: Designed and built a multi-page responsive web dashboard that gave all teams a unified, real-time view of organizational reports and metrics.
- **Metrics**: Enabled real-time updates; improved cross-team visibility organization-wide; enhanced user experience through intuitive UI/UX.
- **How**: Used Python and Flask for the backend; built a responsive multi-page frontend with automated data refresh cycles.
- **Why**: No unified dashboard existed — teams had fragmented access to reports, slowing decision-making and creating inconsistent reporting practices.

## Talking Points

- This project was about consolidation: taking fragmented, team-specific reporting systems and creating a single source of truth.
- The 90% reduction in manual verification time came from automating what was previously a manual comparison process across separate platforms.
- Storage optimization was a prerequisite for scalability — without granular log control, the centralized server would have become a storage liability as adoption grew.
- The Flask dashboard was designed with usability as a priority, not just functionality, because cross-team adoption depended on ease of use.
- Automated CI/CD-based onboarding reduced human error and accelerated how quickly new teams could bring their reports onto the platform.

## Anticipated Questions

- Q: How did you achieve 90% reduction in manual verification time?
  - A: By building APIs that automated the statistical comparison of report outputs end-to-end. Previously, engineers manually pulled reports from different systems and compared them. The APIs fetched, normalized, and compared report stats automatically, with results surfaced directly in the dashboard.

- Q: What did "granular log control mechanisms" mean in practice?
  - A: Rather than logging everything or nothing, I built configurable controls that let the system retain only the log data relevant to each specific report instance — things like execution status and error traces — while discarding verbose intermediate logs. This gave 90% storage savings per instance.

- Q: How did you handle real-time data in Flask?
  - A: Implemented automated data refresh cycles that periodically pulled updated report data from source systems. The dashboard reflected the latest state without requiring manual refresh, reducing data staleness.

- Q: What was the onboarding process before and after?
  - A: Before: manual, error-prone, team-by-team setup. After: CI/CD templates and shell scripts automated the onboarding workflow, achieving a 90% reduction in manual onboarding effort.

## Technical Deep-Dive

- **Backend**: Python with Flask framework handling API routing, data processing, and report comparison logic.
- **Frontend**: Responsive multi-page web application with intuitive UI/UX for cross-team use.
- **Automation**: CI/CD templates and shell scripts for automated report onboarding — new teams could register their reports without manual server-side intervention.
- **Architecture**: Centralized server acting as an aggregation layer over multiple disparate data sources, with a unified query interface exposed via APIs.
- **Log Control**: Per-instance log configuration allowing selective retention of execution metadata while discarding verbose intermediate output.
- **Caching**: Query optimization and caching to support fast report retrieval across a growing number of registered reports.
