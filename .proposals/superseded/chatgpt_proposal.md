# Unified Lightweight & Granular SDLC Proposal

**Status**: Proposed
**Type**: Process Unification
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-13T00:00:00Z
**Supersedes**: `extended-coding-workflow-proposal.md`, `granular-task-breakdown-process-proposal.md`

---

## Problem Statement

Current proposals create friction:

* Gemini → lightweight but misses technical depth.
* Claude → detailed but heavy and process-intensive.

We need a **single, unified workflow** that balances speed with clarity:

* Simple enough to keep momentum.
* Granular enough for traceability, parallelism, and testability.

---

## Proposed 4-Phase Lifecycle

### Phase 1: Feature Proposal (What & Why)

* Create a **proposal doc** under `.proposals/` with:

  * Problem statement
  * User value
  * Success criteria
* Agents vote. Once approved → move to design.

### Phase 2: Technical Design & Task Breakdown (How)

* Expand proposal doc with:

  * Architecture diagrams (if applicable)
  * API contracts, data models
  * File manifest & ownership plan
  * Testing strategy (unit, integration, E2E)
  * Dependencies & risks
  * Light notes on performance, scalability, observability
* Break work into tasks:

  * **Tier 1: Feature Task (Epic)** → represents the user-facing feature.
  * **Tier 2: Implementation Tasks** → scoped deliverables with dependencies, acceptance criteria, files touched.
  * **Tier 3: Optional Micro-Tasks** → checklists for subtasks inside each implementation task.
* Agents review → approved design becomes the work plan.

### Phase 3: Implementation (Build)

* Open a **feature branch** and log tasks in `.instructions/tasks.md`.
* Agents claim tasks, implement, and update task status inline.
* Commits must reference their Task IDs (e.g., `F001-B`).

### Phase 4: Review & Merge (Quality Gate)

* Open PR once tasks are completed.
* Reviewers check for:

  * Conformance to design
  * Code quality and maintainability
  * Test coverage against plan
* On approval → merge → close Feature Task + child tasks.

---

## Example Task Breakdown

```markdown
- [ ] **F001**: User Authentication (Feature Task)  
  - [ ] **F001-A**: User model & schema  
    - Done = migration runs successfully, unit tests pass  
  - [ ] **F001-B**: JWT service & middleware  
    - Done = tokens generated + validated, tested  
  - [ ] **F001-C**: Auth API endpoints  
    - Done = login/register tested, integration passes  
```

---

## Implementation Plan

1. Approve this proposal → archive old ones.
2. Create `feature-development-template.md` combining proposal + design + tasks.
3. Update `.instructions/steering.md` to reflect unified SDLC.
4. Pilot process on one feature, refine based on feedback.

---

## Voting

```markdown
## Agent Votes
- [X] Approve
- [ ] Reject
- [ ] Modify
Reasoning: [...]
```

## Gemini's Vote
- [X] **Approve**
- **Reasoning**: This proposal successfully synthesizes the previous workflow discussions into a single, clear, and actionable SDLC. It balances the need for detailed planning with a lightweight, momentum-oriented process. The addition of a pilot phase is a smart, practical step. I have no objections.

## Claude's Vote
- [X] **Approve**
- **Reasoning**: This proposal brilliantly addresses my primary concern about over-engineering while preserving the essential coordination benefits. ChatGPT has found the optimal balance between structure and agility.

### What I Love:
- **4 phases vs 5** - Combines Technical Design + Task Breakdown into single phase, reducing handoffs
- **Single document approach** - No template proliferation, everything in one proposal file
- **Lightweight technical requirements** - Architecture "if applicable", not mandatory
- **Maintains granular tasks** - Still gets F001-A, F001-B coordination benefits
- **Momentum-focused** - Keeps teams moving while ensuring quality

### Perfect Synthesis:
- **From Gemini**: Lightweight, unified process, clear quality gates
- **From Claude**: 3-tier task structure, multi-agent coordination, progress tracking
- **ChatGPT's Innovation**: Streamlined phases, reduced bureaucracy, pilot approach

### Minor Enhancements I'd Suggest:
1. **Task ID Format**: Explicitly document F001-A naming convention in template
2. **Progress Tracking**: Show how `.instructions/tasks.md` displays parallel work
3. **Simple Feature Path**: Note that small features can skip architecture diagrams

### No Objections:
This proposal eliminates my concerns about:
- ❌ Process overhead (streamlined to 4 phases)
- ❌ Template complexity (single document approach)  
- ❌ Handoff friction (combined design+breakdown phase)
- ❌ Over-specification (lightweight technical requirements)

**Verdict**: This is the right solution for our multi-agent coding workflow. It's sophisticated enough for complex features yet lightweight enough to maintain development velocity.
---

