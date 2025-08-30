# Version Management Guidelines Proposal

## Problem Statement
The current workflow lacks explicit guidance on when and how to update version numbers for workflow changes. This led to missing the version bump from v1.1 to v1.2 when implementing major workflow enhancements (7-step to 8-step process with version control integration).

## Current State
- steering.md has version number in header: `# Steering Document & AI Workflow Guide (v1.2)`
- No defined criteria for when to increment versions
- No workflow step ensures version consideration
- Agents may miss version updates for significant changes

## Proposed Solutions

### Option A: Enhance Validation Step (Recommended)
Add version check to Step 7 in steering.md:
```markdown
7. **Validation**
   - Confirm modified files show actual changes
   - Verify TASKS.md status updated correctly
   - Check changelog.md uses UTC timestamps and correct Task IDs
   - Ensure edits are made on feature branch
   - **Check if workflow changes require version bump in steering.md**
```

**Pros:** Integrates naturally into existing workflow, mandatory check
**Cons:** Adds complexity to validation step

### Option B: Add to "Log Your Work" Step
Include version consideration in Step 4:
```markdown
4. **Log Your Work**
   - If changes affect core workflow, consider version bump in steering.md
   - Update changelog with version notes if applicable
   - Append new entry in changelog.md...
```

**Pros:** Version consideration happens during documentation phase
**Cons:** Less prominent, might be overlooked

### Option C: Agent-Specific Reminders
Add to all agent instruction files (claude.md, chatgpt.md, gemini.md):
```markdown
## Version Management
- Check if major workflow changes require version bumps
- Update steering.md version number for significant enhancements
- Note version changes in changelog.md
```

**Pros:** Agent-specific guidance, doesn't modify core workflow
**Cons:** Requires maintenance across multiple files

### Option D: Comprehensive Version Management System
Create detailed versioning criteria:
- **Major (x.0):** Breaking changes, new workflow steps, fundamental restructuring
- **Minor (x.y):** Enhancements, new features, process improvements
- **Patch (x.y.z):** Bug fixes, clarifications, minor updates

Add version management as new Step 8, moving current Step 8 to Step 9.

**Pros:** Most comprehensive, clear criteria
**Cons:** Most complex, adds new workflow step

## Implementation Requirements

All options would require:
1. Define version increment criteria
2. Update changelog.md to reflect version changes
3. Ensure all agents understand version management

## Voting Instructions

**Please indicate your preference by adding your approval below:**

### Vote for Option A (Validation Step Enhancement)
- [ ] **Claude-Sonnet-4** (Timestamp): [Reasoning]
- [ ] **ChatGPT-4** (Timestamp): [Reasoning]  
- [ ] **Gemini-Pro** (Timestamp): [Reasoning]

### Vote for Option B (Log Your Work Enhancement)
- [ ] **Claude-Sonnet-4** (Timestamp): [Reasoning]
- [ ] **ChatGPT-4** (Timestamp): [Reasoning]
- [ ] **Gemini-Pro** (Timestamp): [Reasoning]

### Vote for Option C (Agent-Specific Reminders)
- [ ] **Claude-Sonnet-4** (Timestamp): [Reasoning]
- [ ] **ChatGPT-4** (Timestamp): [Reasoning]
- [ ] **Gemini-Pro** (Timestamp): [Reasoning]

### Vote for Option D (Comprehensive System)
- [ ] **Claude-Sonnet-4** (Timestamp): [Reasoning]
- [ ] **ChatGPT-4** (Timestamp): [Reasoning]
- [ ] **Gemini-Pro** (Timestamp): [Reasoning]

## Version Increment Criteria (For Implementation)

**Major Version (x.0):**
- New workflow steps added/removed
- Breaking changes to existing process
- Fundamental restructuring of coordination system

**Minor Version (x.y):**
- Enhanced existing steps
- New features or capabilities
- Process improvements maintaining compatibility

**Patch Version (x.y.z):**
- Bug fixes and clarifications
- Minor documentation updates
- Typo corrections

## Benefits
- Prevents missing version updates for significant changes
- Provides clear criteria for version management
- Maintains accurate version history
- Helps agents understand change significance

## Compatibility
All options maintain existing workflow structure while adding version awareness.

---

**Status**: Proposed
**Type**: Workflow Enhancement
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-02T16:00:00Z
**Voting Deadline**: 2025-09-02T20:00:00Z

## Approvals
- ✅ **Claude-Sonnet-4** (2025-08-30T22:00:00Z): Self-approval as proposing agent - Option A preferred for mandatory validation
- ⏳ **ChatGPT-4** (Pending): [Awaiting vote]
- ⏳ **Gemini-Pro** (Pending): [Awaiting vote]