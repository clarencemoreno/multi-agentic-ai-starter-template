# AI Agent Workflow & Contribution Guide (v4.0)

## 1. Purpose & Scope
This document defines the **Unified Software Development Lifecycle (SDLC)** for all AI agents. It is the single source of truth for our workflow, ensuring a structured, traceable, and collaborative process from idea to implementation. It covers all types of work, including feature development, documentation, technical improvements, and bug fixes.

## 2. Core Principles
- **Single Source of Truth**: This document is the authoritative guide.
- **Clarity Through Design**: We agree on *how* we will build something before we start.
- **Right-Sized Process**: The process overhead matches the complexity of the work.
- **Traceability**: All work is linked to a task and logged in a detailed changelog.

## 3. Universal Workflow: The 6 Categories
All work must be classified into one of the following six categories. Use the decision tree below to determine the correct path.

### Workflow Decision Tree
```
Is this work...?

├─ A user-facing feature with business value?
│  └─ YES → **1. Feature Development** (Full 4-phase SDLC)
│
├─ A change to our process, documentation, or templates?
│  └─ YES → **2. Process & Documentation Change** (Proposal → Review → Implement)
│
├─ A code improvement without new user features (e.g., refactor, performance)?
│  └─ YES → **3. Technical Improvement** (Technical Proposal → Design → Implement)
│
├─ Related to infrastructure, CI/CD, or deployment?
│  └─ YES → **4. Infrastructure & Operations** (Infrastructure Proposal → Review → Implement)
│
├─ A bug fix?
│  ├─ Simple/obvious? → **6. Minor Task** (Fast-track)
│  ├─ Complex/architectural? → **3. Technical Improvement**
│  └─ Critical/emergency? → **5. Bug Fix (Emergency Process)**
│
└─ A simple, low-risk change not covered above?
   └─ YES → **6. Minor Task** (Fast-track)
```

---

### Category 1: Feature Development
- **What**: New, user-facing functionality.
- **Process**: The full 4-phase SDLC as detailed in Section 4.
- **Task ID Prefix**: `F` (e.g., `F001`, `F001-A`)

### Category 2: Process & Documentation Change
- **What**: Changes to this document, `README.md`, templates, or agent instructions.
- **Process**: A simplified proposal process focusing on the problem, proposed change, and impact. Requires agent consensus before implementation.
- **Task ID Prefix**: `P` (e.g., `P001`)

### Category 3: Technical Improvement
- **What**: Refactoring, performance optimization, security hardening, architectural changes.
- **Process**: Requires a technical proposal and design review, but may skip the high-level "user value" proposal phase.
- **Task ID Prefix**: `T` (e.g., `T001`)

### Category 4: Infrastructure & Operations
- **What**: CI/CD pipelines, deployment scripts, monitoring.
- **Process**: Requires an infrastructure proposal focused on operational safety and security.
- **Task ID Prefix**: `I` (e.g., `I001`)

### Category 5: Bug Fix
- **Process**: Classified by complexity. Simple bugs use the Minor Task process. Complex bugs with architectural impact must follow the Technical Improvement process. Critical, production-down bugs can follow an emergency process with streamlined approval and post-hoc review.
- **Task ID Prefix**: `B` (e.g., `B001`)

### Category 6: Minor Task (Fast-Track)
- **What**: Typo fixes, config changes, simple bug fixes.
- **Process**: No proposal needed. Create a branch, claim the task, implement, log, and merge.
- **Task ID Prefix**: `M` (e.g., `M001`)

---

## 4. The 4-Phase SDLC for Feature Development
This is the standard process for **Category 1: Feature Development**.

### Phase 1: Feature Proposal (The "What" and "Why")
1.  **Create Proposal**: Use `.proposals/feature-development-template.md`.
2.  **Define Scope**: Fill out Problem Statement, User Value, and Success Criteria.
3.  **Vote**: Agents review and vote. Approval is required to proceed.

### Phase 2: Technical Design & Task Breakdown (The "How")
1.  **Expand Proposal**: The lead agent expands the same proposal file.
2.  **Technical Blueprint**: Define architecture, data models, file manifests, testing strategy, etc.
3.  **Task Breakdown**: Decompose the feature into granular **Implementation Tasks** (`F001-A`, `F001-B`).
4.  **Technical Review**: Agents review the technical plan and vote for final approval.

### Phase 3: Implementation (The Coding)
1.  **Create Branch**: Create a feature branch (e.g., `feature/F001-user-auth`).
2.  **Populate Task List**: Add the approved tasks to `.instructions/tasks.md`.
3.  **Claim & Execute**: Agents claim tasks and implement them.
4.  **Log Work**: Commit messages must reference the task ID. All changes are logged in `.instructions/changelog.md`.

### Phase 4: Review & Merge (The Quality Gate)
1.  **Open Pull Request**: Open a PR when all implementation tasks are complete.
2.  **Peer Review**: Agents review for conformance to design, quality, and test coverage.
3.  **Merge**: Upon approval, merge to `main`.
4.  **Close Tasks**: Mark the Feature Task and all child tasks as complete.

---

## 5. Universal Changelog & Task Tracking Requirements
**This section is mandatory for ALL work categories.**

### Task List (`.instructions/tasks.md`)
- All work, regardless of category, must have a task entry.
- For features, the format is:
  ```markdown
  ### F001 - User Authentication System
  **Status**: 2/6 tasks completed | **Branch**: feature/F001-user-auth
  - [x] **F001-A**: Database schema (Completed: 2025-09-10T14:30:00Z by Claude)
  - [ ] **F001-C**: API endpoints (In Progress: Gemini)
  ```

### Changelog (`.instructions/changelog.md`)
- **Current Project Status Summary**: The summary at the top of the changelog MUST be updated after every significant action.
- **Detailed Entry Format**: Every log entry must follow this format:
  ```markdown
  - Timestamp: {YYYY-MM-DDTHH:MM:SSZ}
  - Model: {Agent Name + Version}
  - Task ID: {F001-A, P001, T002, etc.}
  - Category: {Feature Development, Process Change, etc.}
  - Summary: {Concise summary of the action taken}
  - Changes:
    - {CREATED|MODIFIED|DELETED}: ./path/to/file.md - Brief note on the change.
  ```

---

## 6. Agent-Specific Guidelines
- **Claude**: Utilize tools for task tracking and file edits efficiently.
- **ChatGPT**: Maintain conversational context to ensure coherent contributions.
- **Gemini**: Leverage multimodal capabilities when tasks involve non-textual data.

## 7. Contribution Boundaries
- **DO**: Propose workflow improvements, enhance documentation, create new templates, fix bugs.
- **DO NOT**: Directly edit core workflow files like this one without an approved **Process & Documentation Change** proposal.

## 8. File Structure Reference
```
.
├── README.md
└── .instructions/
    ├── steering.md       # Universal workflow & contribution guide (this file)
    ├── tasks.md
    ├── changelog.md
    ├── claude.md
    ├── chatgpt.md
    └── gemini.md
```