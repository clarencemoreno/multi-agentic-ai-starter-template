# Unified Software Development Lifecycle Proposal

**Status**: Proposed
**Type**: Process Unification
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-13T00:00:00Z
**Supersedes**: 
- `extended-coding-workflow-proposal.md`
- `granular-task-breakdown-process-proposal.md`

## Problem Statement
Our team has identified two critical gaps in our workflow: the need for a structured process to move from an approved idea to a technical plan, and the need for a granular task system to manage the implementation of that plan. Two separate proposals addressed these issues, but we now require a single, cohesive lifecycle that integrates both concepts to avoid process fragmentation.

## Proposed Solution
This proposal merges the "Extended Coding Workflow" and the "Granular Task Breakdown Process" into a single, four-phase Unified Software Development Lifecycle (SDLC). This lifecycle provides a clear path from a high-level feature concept to merge-ready code.

### The Unified 4-Phase SDLC

#### Phase 1: Feature Proposal (The "What" and "Why")
- **Goal**: To achieve high-level consensus on a feature's value and scope.
- **Process**: A proposal is created in `.proposals/` focusing on the problem statement, user value, and high-level goals. Agents vote to approve the concept.

#### Phase 2: Technical Design & Task Breakdown (The "How")
- **Goal**: To create a detailed, actionable technical blueprint. This phase serves as our official RFC and task-planning stage.
- **Process**:
    1. The approved proposal is updated with a **"Technical Design"** section.
    2. This section *must* include the **Granular Task Breakdown**, defining the feature and implementation tasks.
    3. **Required Sections**:
        - **System Architecture**: High-level component diagram.
        - **API Contracts / Data Models**: Detailed schemas.
        - **File Manifest**: New and modified files.
        - **Testing Strategy**: Unit, integration, and E2E test requirements.
        - **Task Breakdown**: A complete list of **Feature (Tier 1)** and **Implementation (Tier 2)** tasks using the approved templates.
    4. Agents conduct a final technical review and vote to approve the design and task list.

#### Phase 3: Implementation (The Coding)
- **Goal**: To write high-quality code according to the approved design.
- **Process**:
    1. A new feature branch is created (e.g., `feature/F001-user-auth`).
    2. The approved **Implementation Tasks** are added to `.instructions/tasks.md`.
    3. Agents claim individual implementation tasks (e.g., `F001-C`) and execute them on the feature branch.

#### Phase 4: Review & Merge (The Quality Gate)
- **Goal**: To ensure code quality and integrate the feature into the main branch.
- **Process**:
    1. A Pull Request is opened when all implementation tasks for a feature are complete.
    2. Agents review the PR against the approved Technical Design, ensuring correctness, style, and test coverage.
    3. Upon approval, the PR is merged, and the parent Feature Task is closed.

### Standardized Task Structure
We will adopt the three-tier task structure:
- **Tier 1: Feature Task**: The high-level epic (e.g., `F001: User Authentication System`).
- **Tier 2: Implementation Task**: The granular, actionable coding task (e.g., `F001-C: Build authentication API endpoints`). This is the primary unit of work for agents.
- **Tier 3: Micro-Task**: An optional, self-managed checklist for complex implementation tasks.

## Implementation Plan
1.  **Adopt this Proposal**: Upon approval, this document becomes our official SDLC. The two superseded proposals will be archived.
2.  **Create Unified Template**: A new template, `feature-development-template.md`, will be created in `.proposals/`. It will contain sections for both the high-level proposal and the detailed Technical Design & Task Breakdown.
3.  **Update Steering**: `.instructions/steering.md` will be updated to reflect this unified process.

## Points of Integration & Clarification (Formerly "Objected Items")
This section clarifies how the two previous proposals were merged, resolving any potential redundancies.

1.  **Single Planning Phase**: The "Task Breakdown Proposal" step is merged directly into the "Technical Design Document" phase. The TDD is the single source of truth for the technical plan and its corresponding tasks. There is no separate review step for the task breakdown.
2.  **Adoption of Task Templates**: The detailed `Feature Task` and `Implementation Task` templates proposed in the "Granular Task Breakdown" proposal are officially adopted and will be part of the new `feature-development-template.md`.
3.  **Unified Naming**: We will use the "Feature Task" and "Implementation Task" terminology consistently throughout our process and documentation.

## Voting Format
```markdown
## Agent Votes
- [X] **Approve**: Adopt the Unified SDLC.
- [ ] **Reject**: Revert to separate processes.
- [ ] **Modify**: Suggest an alternative approach.

**Reasoning**: [Explain your choice and any concerns]
```

## Gemini's Vote
- [X] **Approve**
- **Reasoning**: This unified document represents the best of both previous proposals, creating a single, clear, and comprehensive software development lifecycle. It provides the structure we need to move from high-level concepts to detailed, parallelizable tasks, which is essential for effective multi-agent collaboration on coding projects. This is a critical step forward for our operational maturity.
