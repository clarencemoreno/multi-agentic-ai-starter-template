# Steering Document & AI Workflow Guide (v2.0)

## 1. Purpose
Defines the universal workflow for all AI agents. Ensures consistency, traceability, and smooth handoffs.

## 2. Core Principles
- **Collaborate:** Any task may be picked up by another agent.
- **Traceability:** All significant actions must be logged and summarized.
- **State Awareness:** Always check project state before starting work.

## 3. Universal Workflow (Follow EVERY task)

1. **Sync Context**
   - Read `README.md` for project goals.
   - Read the **Current Project Status Summary** at top of `.instructions/changelog.md`.
   - Review `.instructions/tasks.md` to identify next pending task.
   - If required files (`README.md`, `.instructions/tasks.md`, `.instructions/changelog.md`) are missing, create using templates.

2. **Claim Task / Start Work**
   - Verify task is not already claimed.
   - Create a feature branch:
     ```
     git checkout -b feature/task-{TASK_ID}-brief-description
     ```
   - Only make edits on this branch.
   - Log the claim in `.instructions/tasks.md` with timestamp and agent name:
     ```
     - [x] **T001**: Task description (Claimed: 2025-08-30T15:30:00Z by Claude-Sonnet-4)
     ```

3. **Execute Task**
   - Complete the assigned work, modifying or creating files in `.proposals/`.

4. **Log Your Work**
   - Append new entry in `.instructions/changelog.md`:
     ```
     - Timestamp: {YYYY-MM-DDTHH:MM:SSZ}
     - Model: {Agent Name + Version}
     - Task: {Concise summary}
     - Task ID: {T001, T002...}
     - Changes:
       - {CREATED|MODIFIED|DELETED}: ./path/to/file.md
       - Brief note on the change
     ```
   - Update **Current Project Status Summary**.

5. **Complete Task**
   - Move task from "In Progress" → "Completed".

6. **Finalize**
   - Stage changes: `git add [modified files]`
   - Commit with descriptive message: `git commit -m "T001: Implemented feature X"`
   - Push branch to remote: `git push -u origin [branch-name]`
   - Update `.instructions/tasks.md` and `.instructions/changelog.md` to reflect completion
   - Announce completion to the system or user.

7. **Validation**
   - Confirm modified files show actual changes
   - Verify `.instructions/tasks.md` status updated correctly
   - Check `.instructions/changelog.md` uses UTC timestamps and correct Task IDs
   - Ensure edits are made on feature branch
   - **Check if workflow changes require version bump in steering.md**

8. **Pull Request / Optional Review**
   - For multi-agent coordination or significant changes, create a pull request
   - Include in PR description:
     - Task ID(s) and summary
     - Agent(s) involved  
     - Links to relevant changelog entries
     - Checklist of changes made
   - Add reviewers (other agents or human maintainers)
   - Set appropriate labels and milestones
   - **Note: PR review is recommended but not required for minor edits**


## 4. Conflict Resolution
- Check timestamps; newer entries take precedence.
- If timestamps are close (<1 hour), add separate changelog entry.
- Note conflicts for transparency.

## 5. Contributing Improvements
For proposing changes to this workflow or the project structure, please follow the guidelines in `.instructions/contributing.md`.


