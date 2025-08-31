# Steering Document & AI Workflow Guide (v1.1)

## 1. Purpose
Defines the universal workflow for all AI agents. Ensures consistency, traceability, and smooth handoffs.

## 2. Core Principles
- **Collaborate:** Any task may be picked up by another agent.
- **Traceability:** All significant actions must be logged and summarized.
- **State Awareness:** Always check project state before starting work.

## 3. Universal Workflow (Follow EVERY task)

1. **Sync Context**
   - Read `README.md` for project goals.
   - Read the **Current Project Status Summary** at top of `changelog.md`.
   - Review `TASKS.md` to identify next pending task.
   - If required files (`README.md`, `TASKS.md`, `changelog.md`) are missing, create using templates.

2. **Claim Task**
   - Move task from "Pending" → "In Progress".
   - Confirm no other agent is currently working on it.

3. **Execute Task**
   - Complete the assigned work, modifying or creating files in `project_docs/`.

4. **Log Your Work**
   - Append new entry in `changelog.md`:
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
   - Announce completion to the system or user.

7. **Validation**
   - Confirm file changes persist.
   - Verify task status updated correctly.
   - Ensure UTC timestamp format.
   - **Check if workflow changes require version bump in steering.md**

## 4. Conflict Resolution
- Check timestamps; newer entries take precedence.
- If timestamps are close (<1 hour), add separate changelog entry.
- Note conflicts for transparency.


