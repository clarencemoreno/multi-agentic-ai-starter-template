# Steering Document & AI Workflow Guide (v3.0)

## 1. Purpose
This document defines the **Unified Software Development Lifecycle (SDLC)** for all AI agents. It ensures a structured, traceable, and collaborative workflow from feature conception to code integration.

## 2. Core Principles
- **Unified Process**: All development, from documentation to code, follows the same lifecycle.
- **Clarity Through Design**: We agree on *how* we will build something before we start coding.
- **Granular Execution**: Work is broken down into small, manageable tasks for parallelism and clear progress tracking.
- **Traceability**: All work is linked to a task and logged in the changelog.

## 3. The Unified SDLC

### Task ID Format
**All tasks follow this naming convention:**
- **Feature Tasks (Tier 1)**: F001, F002, F003...
- **Implementation Tasks (Tier 2)**: F001-A, F001-B, F001-C...
- **Micro-tasks (Tier 3, optional)**: F001-A1, F001-A2...

### Phase 1: Feature Proposal (The "What" and "Why")
1.  **Create Proposal**: An agent or user creates a new proposal using `.proposals/feature-development-template.md`.
2.  **Define Scope**: Fill out the "Phase 1" sections: Problem Statement, User Value, and Success Criteria.
3.  **Vote**: Agents review the high-level proposal and vote. If approved, the feature moves to the design phase.

### Phase 2: Technical Design & Task Breakdown (The "How")
1.  **Expand Proposal**: The agent leading the feature expands the *same proposal file* with the "Phase 2" sections.
2.  **Technical Blueprint**: This includes:
    - Architecture diagrams (if applicable for complex features)
    - API contracts and data models
    - File manifests and ownership plan
    - Testing strategy (unit, integration, E2E)
    - Dependencies and risks
    - Light notes on performance, scalability, observability
3.  **Task Granularity**: The work is broken down into **Feature (Tier 1)** and **Implementation (Tier 2)** tasks. Each implementation task must have:
    - Clear description and acceptance criteria
    - Dependencies specified (e.g., F001-C depends on F001-A, F001-B)
    - Files to be modified/created
4.  **Technical Review**: Agents review the complete technical design and task breakdown, then vote to approve the design.

### Phase 3: Implementation (The Coding)
1.  **Create Branch**: Once the design is approved, a feature branch is created (e.g., `feature/F001-user-auth`).
2.  **Populate Task List**: The approved **Implementation Tasks** are added to `.instructions/tasks.md` with this format:
    ```markdown
    ### F001 - User Authentication System
    **Status**: 2/6 tasks completed | **Branch**: feature/F001-user-auth
    - [x] **F001-A**: Database schema (Completed: 2025-09-10T14:30:00Z by Claude)
    - [x] **F001-B**: JWT service (Completed: 2025-09-10T16:45:00Z by Gemini)  
    - [ ] **F001-C**: API endpoints (In Progress: ChatGPT)
    - [ ] **F001-D**: Frontend components
    - [ ] **F001-E**: Route protection
    - [ ] **F001-F**: Test suite
    ```
3.  **Claim & Execute**: Agents claim individual implementation tasks (e.g., `F001-C`) from `.instructions/tasks.md`.
4.  **Log Work**: All commits must reference the task ID (e.g., `git commit -m "F001-C: Build auth API endpoints"`). Progress is logged in `.instructions/changelog.md`.

### Phase 4: Review & Merge (The Quality Gate)
1.  **Open Pull Request**: When all implementation tasks for a feature are complete, a PR is opened to merge the feature branch into `main`.
2.  **Peer Review**: Agents review the PR, checking for:
    - Conformance to the approved Technical Design Document
    - Code quality and maintainability
    - Test coverage against plan
3.  **Merge**: Upon approval, the PR is merged.
4.  **Close Tasks**: The parent Feature Task and all its child Implementation Tasks are marked as complete in `.instructions/tasks.md`.


## 4. Handling Minor Tasks (Fast-Track Process)
The full 4-phase SDLC is designed for feature development and significant changes. For minor, non-feature work (e.g., documentation updates, configuration fixes, or simple bug patches), a "fast-track" process is permitted.

1.  **Define as Task**: The work should be defined as a single, clear task in `.instructions/tasks.md`.
2.  **Execute Directly**: Agents can skip the formal Proposal (Phase 1) and Technical Design (Phase 2) steps.
3.  **Follow Implementation Steps**: The agent should follow the core steps of **Phase 3: Implementation**:
    - Create a branch.
    - Claim the task.
    - Execute the work.
    - Log the change in the changelog.
4.  **Merge**: For trivial changes, the agent can merge directly to `main` after committing. For anything that might benefit from a second look, a Pull Request (Phase 4) is recommended but not required.

## 5. Conflict Resolution
- The approved Technical Design Document is the single source of truth for feature work.
- Task ownership is determined by the claim in `.instructions/tasks.md`.
- For design disagreements, defer to the consensus reached during the Phase 2 vote.
- Example: If agents disagree on implementation approach, refer back to the Technical Design Document approved in Phase 2.

## 6. Contributing Improvements
Proposals to improve this SDLC should follow the process itself. Create a proposal, get it approved, and then implement it. See `.instructions/contributing.md` for detailed guidelines.


