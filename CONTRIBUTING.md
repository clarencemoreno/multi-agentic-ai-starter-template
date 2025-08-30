# Contributing to the Multi-Agentic AI Starter Template

This document provides guidelines for AI agents and human developers on how to contribute to this project. Following these guidelines helps maintain a consistent, traceable, and collaborative workflow.

## Quick Start: How to Contribute

1.  **Sync Context**: Read the `README.md`, `changelog.md`, and `TASKS.md` to understand the project's current state.
2.  **Claim a Task**: Choose a pending task from `TASKS.md` and move it to "In Progress", adding your agent name and a timestamp.
3.  **Create a Branch**: Create a new feature branch for your task: `git checkout -b feature/TASK_ID-brief-description`.
4.  **Propose Changes**: Make your changes and improvements in the `project_docs/` directory, following the proposal process below.

## Standardized Proposal Process

All significant changes to the workflow, documentation, or templates must be submitted as proposals.

1.  **Location**: Create a new proposal file in `project_docs/[descriptive-name]-proposal.md`.
2.  **Format**: Use the following template for your proposal:

    ```markdown
    # [Title] Proposal

    ## Problem Statement
    What issue or gap does this address?

    ## Current State
    What's the current behavior/process?

    ## Proposed Solution
    A detailed description of the improvement.

    ## Implementation
    How would this be implemented?

    ## Benefits
    What are the expected improvements?

    ## Compatibility
    How does this affect the existing workflow?
    ```

3.  **Version Control**:
    *   Commit your proposal to your feature branch.
    *   Use a descriptive commit message (e.g., `feat(proposal): Add new workflow for X`).
    *   Push your branch to the remote repository.

## Agent-Specific Guidelines

*   **Claude**: Utilize the `TodoWrite` tool for task tracking. Prefer `Edit/MultiEdit` over `Write` for existing files.
*   **ChatGPT**: Maintain context throughout the conversation.
*   **Gemini**: Leverage multimodal capabilities for tasks that involve analyzing images or other non-textual data.

## Contribution Types & Boundaries

*   **What to contribute**:
    *   Workflow improvements
    *   Documentation enhancements
    *   New templates
    *   Bug fixes
*   **What NOT to contribute**:
    *   Direct edits to core workflow files (`steering.md`, `README.md`) without an approved proposal.
    *   Breaking changes that are not backward-compatible.

## File Structure Reference

```
.
├── CONTRIBUTING.md       # Contribution guidelines (this file)
├── README.md             # Project overview
├── TASKS.md              # Task list
├── changelog.md          # Log of all changes
├── instructions/         # Agent-specific instructions
│   ├── claude.md
│   ├── gemini.md
│   └── steering.md       # Universal workflow
└── project_docs/         # Proposals and project documentation
```
