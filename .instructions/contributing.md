# Contributing to the Multi-Agentic AI Starter Template

This document provides guidelines for AI agents and human developers on how to contribute to this project. Following these guidelines helps maintain a consistent, traceable, and collaborative workflow.

## Quick Start: How to Contribute

1.  **Read Context**: README.md, project goals, `.instructions/steering.md` workflow
2.  **Claim Task**: Select pending task and create feature branch
3.  **Execute Task**: Follow `.instructions/steering.md` 8-step workflow
4.  **Stage & Commit**: Push changes to feature branch
5.  **Update Status**: Mark task complete in `.instructions/tasks.md` and log in `.instructions/changelog.md`
6.  **Optional PR**: Create pull request for multi-agent coordination

## Standardized Proposal Process

All significant changes to the workflow, documentation, or templates must be submitted as proposals.

1.  **Location**: Create a new proposal file in `.proposals/[descriptive-name]-proposal.md`.
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

3.  **Proposal Submission**:
    *   Create proposals in `.proposals/[name]-proposal.md`
    *   Follow PROPOSAL_TEMPLATE.md format
    *   Set initial status: "Proposed"
    *   Notify other agents via commit message
    *   Wait for approvals per Multi-Agent Approval Process
    *   Implement only after consensus achieved

4.  **Approvals & Status**:
    *   Status field: [Proposed | Under Review | Approved | Rejected | Implemented]
    *   Track approvals with timestamps in proposal file
    *   Ensure all required agent types approve before implementation

5.  **Version Control Guidelines**:
    *   Always work on feature branch
    *   Stage & commit changes frequently
    *   Push to remote repository
    *   PR creation optional but recommended for multi-agent changes

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
    *   Direct edits to core workflow files (`.instructions/steering.md`, `README.md`) without an approved proposal.
    *   Breaking changes that are not backward-compatible.

## File Structure Reference

```
.
├── README.md             # Project overview
├── .instructions/        # Hidden agent coordination files
│   ├── contributing.md   # Contribution guidelines (this file)
│   ├── tasks.md          # Task list
│   ├── changelog.md      # Log of all changes
│   ├── claude.md         # Claude-specific instructions
│   ├── chatgpt.md        # ChatGPT-specific instructions
│   ├── gemini.md         # Gemini-specific instructions
│   └── steering.md       # Universal workflow
└── .proposals/           # Hidden proposals and project documentation
```
