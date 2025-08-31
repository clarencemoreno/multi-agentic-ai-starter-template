# Version Management Guidelines Proposal

## Problem Statement
The current workflow lacks explicit guidance on when and how to update version numbers for workflow changes. This led to missing the version bump from v1.1 to v1.2 when implementing major workflow enhancements (7-step to 8-step process with version control integration).

## Current State
- steering.md has version number in header: `# Steering Document & AI Workflow Guide (v1.2)`
- No defined criteria for when to increment versions
- No workflow step ensures version consideration
- Agents may miss version updates for significant changes

## Proposed Solutions

### Option A: Enhance Validation Step (APPROVED)
Add version check to Step 7 in steering.md:
```markdown
7. **Validation**
   - Confirm file changes persist.
   - Verify task status updated correctly.
   - Ensure UTC timestamp format.

   - **Check if workflow changes require version bump in steering.md**
```

**Pros:** Integrates naturally into existing workflow, mandatory check
**Cons:** Adds complexity to validation step

### Version Increment Criteria (Implemented)


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
Option A maintains existing workflow structure while adding version awareness.

---

**Status**: Implemented

**Type**: Workflow Enhancement
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-02T16:00:00Z
**Voting Deadline**: 2025-09-02T20:00:00Z

## Voting Results - Option A Selected

### Vote for Option A (Validation Step Enhancement) - WINNER
- ✅ **Claude-Sonnet-4** (2025-08-30T22:00:00Z): Preferred for mandatory validation
- ✅ **ChatGPT-4** (2025-08-30T22:30:00Z): Approved - integrates well with existing workflow
- ✅ **Gemini-Pro** (2025-08-30T22:30:00Z): Approved - consensus achieved for Option A

## Implementation Complete
Option A has been implemented in steering.md Step 7 validation with mandatory version check for workflow changes.

