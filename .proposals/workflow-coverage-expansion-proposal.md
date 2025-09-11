# Workflow Coverage Expansion Proposal

**Status**: Proposed
**Type**: Process Enhancement
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-13T00:00:00Z

## Problem Statement

The current steering.md v3.0 has significant coverage gaps for common development activities and missing critical traceability components:

### What's Well Covered:
- ✅ **New user-facing features** → Full 4-phase SDLC
- ✅ **Minor tasks** → Fast-track process

### What's Missing:
- ❌ **Documentation changes** (steering.md, README updates) → No clear path
- ❌ **Code refactoring** (DB restructuring, architecture improvements) → Ambiguous classification
- ❌ **Infrastructure work** (CI/CD, deployment configs) → Not addressed
- ❌ **Bug fixes** → Range from trivial to complex, unclear classification
- ❌ **Process improvements** → Like this proposal itself

### Critical Missing Component - Changelog Requirements:
- ❌ **No detailed changelog entry format** → Lost from original v2.0 vision
- ❌ **No Current Project Status Summary updates** → Agents lose chronological context
- ❌ **No audit trail requirements** → Missing "what was done when and why"
- ❌ **Inconsistent traceability** → Mentioned but not enforced

### Documentation Split Problem:
- ❌ **Redundant guidance** → steering.md and contributing.md overlap significantly
- ❌ **Split authority** → Two sources of truth causing agent confusion
- ❌ **Contributing.md not followed** → Agents default to steering.md, ignore contributing.md
- ❌ **Maintenance burden** → Need to keep two documents synchronized

### Real-World Examples:
1. **Updating steering.md** → Too significant for fast-track, not a user feature
2. **Refactoring database schema** → Needs technical design but no user-facing value
3. **Fixing critical security bug** → Could be simple patch or major architectural change
4. **Adding CI/CD pipeline** → Infrastructure work requiring coordination
5. **Agent losing context** → No detailed changelog entries to understand what changed and why
6. **Agent ignores contributing.md** → Follows steering.md only, misses proposal process details

## Current State Analysis

### Workflow Classification Problems:
- **False Binary**: Current system assumes work is either "feature" or "minor task"
- **Process Confusion**: Where does this very proposal fit in the workflow?
- **Agent Uncertainty**: No clear guidance on which path to follow for non-feature work
- **Coordination Risk**: Important work might skip necessary review due to unclear classification

### Traceability Problems:
- **Lost Changelog Format**: v3.0 removed detailed entry requirements from v2.0
- **No Context Preservation**: Agents can't understand chronological changes
- **Missing Audit Trail**: No structured "what, when, who, why" documentation
- **Inconsistent Logging**: "Log in changelog" mentioned but format not specified
- **No Status Summary**: Missing "Current Project Status Summary" updates that provide project state

### Documentation Fragmentation Problems:
- **Redundant Content**: contributing.md line 9 says "Follow steering.md workflow" then provides additional guidance
- **Split Proposal Process**: Template in contributing.md, workflow in steering.md
- **Agent Confusion**: Which document is authoritative when they conflict?
- **Two Maintenance Points**: Changes require updating both documents
- **Contributing.md Ignored**: Agents naturally gravitate to steering.md, miss proposal details

## Proposed Solution: Comprehensive Workflow Categories

### Category 1: Feature Development (Existing - No Change)
**What**: User-facing functionality with business value
**Process**: Full 4-phase SDLC (Proposal → Design → Implementation → Review)
**Examples**: User authentication, payment processing, dashboard features

### Category 2: Process & Documentation Changes (New)
**What**: Workflow changes, documentation updates, template modifications
**Process**: 
1. **Proposal Phase**: Problem statement, impact assessment, proposed changes
2. **Review & Approval**: Multi-agent consensus vote
3. **Implementation**: Make changes, update related files
4. **Validation**: Ensure changes work in practice

**Examples**: 
- Updating steering.md workflow
- Modifying proposal templates
- Changing agent instruction files
- README updates with process changes

### Category 3: Technical Improvements (New)
**What**: Code quality, architecture improvements, performance optimizations
**Process**:
1. **Technical Proposal**: Problem analysis, proposed solution, impact assessment
2. **Design Review**: Architecture changes, testing strategy, rollback plan
3. **Implementation**: Code changes with comprehensive testing
4. **Review & Merge**: Technical review focused on quality and safety

**Examples**:
- Database schema refactoring
- API architecture improvements
- Performance optimizations
- Security enhancements
- Code consolidation/cleanup

### Category 4: Infrastructure & Operations (New)
**What**: Deployment, monitoring, CI/CD, tooling
**Process**:
1. **Infrastructure Proposal**: Requirements, design, operational impact
2. **Review**: Operational safety, security considerations
3. **Implementation**: Staged rollout with monitoring
4. **Validation**: Operational verification

**Examples**:
- CI/CD pipeline setup
- Monitoring and alerting
- Deployment automation
- Development tooling

### Category 5: Bug Fixes (Enhanced Classification)
**Process depends on complexity:**

**Simple Bug Fixes** → Fast-track process:
- Clear issue with known solution
- Low risk of side effects
- Examples: Typos, obvious logic errors, broken links

**Complex Bug Fixes** → Technical Improvement process:
- Unclear root cause or solution
- Potential architectural implications
- Examples: Performance issues, security vulnerabilities, data corruption

**Critical Bug Fixes** → Emergency process:
- Production issues requiring immediate attention
- Streamlined approval with post-hoc review
- Examples: Security breaches, data loss, system down

### Category 6: Minor Tasks (Existing - Clarified)
**What**: Simple, low-risk changes with minimal coordination needs
**Process**: Fast-track (claim task → implement → commit)
**Examples**: 
- Typo fixes in documentation
- Configuration value updates
- Simple content updates
- Dependency version bumps

## Updated Workflow Decision Tree

```
Is this work...?

├─ User-facing feature with business value?
│  └─ YES → **Feature Development** (4-phase SDLC)
│
├─ Documentation/process change affecting multiple agents?
│  └─ YES → **Process & Documentation Changes** (Proposal → Review → Implement)
│
├─ Code improvement without user-facing changes?
│  └─ YES → **Technical Improvements** (Technical Proposal → Design → Implement)
│
├─ Infrastructure/operations work?
│  └─ YES → **Infrastructure & Operations** (Infrastructure Proposal → Review → Implement)
│
├─ Bug fix?
│  ├─ Simple/obvious? → **Minor Tasks** (Fast-track)
│  ├─ Complex/architectural? → **Technical Improvements**
│  └─ Critical/emergency? → **Emergency Process**
│
└─ Simple, low-risk change?
   └─ YES → **Minor Tasks** (Fast-track)
```

## Universal Changelog Requirements

**All work categories must include detailed changelog entries** to restore the original v2.0 traceability vision:

### Required Changelog Entry Format
```markdown
- Timestamp: {YYYY-MM-DDTHH:MM:SSZ}
- Model: {Agent Name + Version}
- Task: {Concise summary}
- Task ID: {F001, P001, T001, I001, B001, M001}
- Category: {Feature Development, Process Change, Technical Improvement, Infrastructure, Bug Fix, Minor Task}
- Changes:
  - {CREATED|MODIFIED|DELETED}: ./path/to/file.md
  - Brief note on the change
```

### Current Project Status Summary Updates
**All significant work must update the status summary at top of `.instructions/changelog.md`:**
```markdown
## Current Project Status Summary
*(Single source of truth for project state; updated after every task completion)*

- Latest feature: F001 - User Authentication (4/6 tasks completed)
- Active infrastructure work: I001 - CI/CD pipeline setup
- Recent process changes: P001 - Workflow categories expansion (completed)
- Next priorities: Complete F001, implement F002 - User Profiles
```

### Changelog Benefits Restored
- **Chronological Context**: Agents understand project evolution
- **Audit Trail**: Complete "what, when, who, why" documentation  
- **Context Switching**: New agents can read changelog to understand current state
- **Debugging**: Track when issues were introduced or fixed
- **Decision History**: Understand reasoning behind changes

## Documentation Consolidation Solution

**Merge contributing.md into steering.md** to create single, authoritative workflow document:

### Current Redundancy Analysis
**steering.md has**: Universal workflow, task management, conflict resolution
**contributing.md has**: Proposal process, agent guidelines, file structure, boundaries

### Proposed Consolidated Structure
```markdown
# AI Agent Workflow & Contribution Guide (v4.0)

## 1. Purpose & Scope
## 2. Core Principles  
## 3. Universal Workflow (6 categories + changelog requirements)
## 4. Proposal Process (moved from contributing.md)
## 5. Agent-Specific Guidelines (moved from contributing.md)
## 6. Contribution Boundaries (moved from contributing.md)
## 7. File Structure Reference (moved from contributing.md)
## 8. Conflict Resolution
```

### Consolidation Benefits
- **Single Source of Truth**: No more checking multiple documents
- **Eliminated Confusion**: One authoritative workflow to follow
- **Reduced Maintenance**: Update one comprehensive document
- **Complete Coverage**: All agent guidance in one place
- **Natural Flow**: Logical progression from workflow to contribution details

### Migration Approach
1. **Merge Content**: Integrate contributing.md sections into steering.md
2. **Remove contributing.md**: Delete redundant file to eliminate confusion
3. **Update References**: Change all links to point to consolidated steering.md
4. **Agent Notification**: Update agent instruction files about consolidation

## Implementation Plan

### Phase 1: Consolidate and Update steering.md
- **Merge contributing.md content** into steering.md for single source of truth
- Add new workflow categories with clear definitions
- Include decision tree for workflow selection
- **Restore changelog requirements** from original v2.0 vision
- Add mandatory changelog entry format and status summary updates
- Update task ID formats for new categories:
  - **P001** = Process/Documentation changes
  - **T001** = Technical improvements  
  - **I001** = Infrastructure work
  - **B001** = Bug fixes
  - **M001** = Minor tasks
  - **F001** = Features (existing)
- **Delete contributing.md** to eliminate redundancy

### Phase 2: Add Workflow Automation
- Create `Makefile` with automated git workflows
- Standardize branch creation, committing, and pushing
- **Include changelog automation** in Makefile commands
- Provide specialized commands for different work types:
  ```bash
  make proposal PROPOSAL_NAME=my-idea MESSAGE="Add new proposal"
  make feature FEATURE_ID=F001 MESSAGE="Implement user auth"
  make steering MESSAGE="Update workflow documentation"
  make quick BRANCH_NAME=fix-typos MESSAGE="Fix documentation typos"
  ```

### Phase 3: Create Category Templates
- `process-change-template.md`
- `technical-improvement-template.md`
- `infrastructure-proposal-template.md`
- `bug-fix-template.md` (for complex bugs)

### Phase 4: Update Related Documentation
- Update agent-specific instruction files with consolidated workflow reference
- Update all references from contributing.md to steering.md
- Add examples to each category

## Benefits

### 1. **Complete Coverage**
- Every type of work has a clear path
- Eliminates "where does this fit?" confusion
- Reduces coordination failures

### 2. **Right-Sized Process**
- Simple tasks stay simple (fast-track)
- Complex work gets appropriate oversight
- Emergency processes for critical issues

### 3. **Better Coordination**
- Clear expectations for each work type
- Appropriate review levels
- Reduced over/under-engineering

### 4. **Improved Quality**
- Technical improvements get design review
- Process changes get consensus
- Infrastructure gets operational review

### 5. **Workflow Automation**
- Eliminates repetitive git operations requiring approval
- Standardized commands for common workflows
- Faster development cycles with `make quick` commands
- Specialized workflows for proposals, features, and documentation

### 6. **Restored Traceability**
- Complete chronological context for all agents
- Structured audit trail with "what, when, who, why" documentation
- Current Project Status Summary provides project state snapshot
- Debugging and decision history preserved for future reference

### 7. **Unified Documentation**
- Single source of truth eliminates agent confusion
- No more split guidance between steering.md and contributing.md
- Reduced maintenance burden with one comprehensive document
- Natural workflow progression from process to contribution details

## Examples in Practice

### Example 1: This Proposal
**Category**: Process & Documentation Changes
**Process**: Proposal → Multi-agent review → Update steering.md → Validate workflow

### Example 2: Database Schema Refactoring  
**Category**: Technical Improvements
**Process**: Technical proposal → Design review → Implementation with tests → Technical review

### Example 3: Fixing Typo in README
**Category**: Minor Tasks
**Process**: Fast-track (claim → fix → commit)

### Example 4: Adding User Profile Feature
**Category**: Feature Development  
**Process**: Full 4-phase SDLC (unchanged)
**Command**: `make feature FEATURE_ID=F002 MESSAGE="Implement user profile system"`

### Example 5: Using Workflow Automation
**Scenario**: Creating and committing this proposal
**Command**: `make proposal PROPOSAL_NAME=workflow-coverage-expansion MESSAGE="Add comprehensive workflow categories"`
**Result**: Creates branch, allows editing, then `make quick-commit MESSAGE="Complete proposal"` to finish

## Migration Strategy

### Week 1: Documentation Update
- Update steering.md with new categories
- Create decision tree reference
- Update task ID formats

### Week 2: Workflow Automation
- Implement Makefile with automated git workflows
- Test automation commands with different work types
- Update agent instructions to use `make` commands

### Week 3: Template Creation
- Create templates for new categories
- Update existing templates
- Document examples

### Week 4: Agent Training & Validation
- Update agent instruction files with consolidated workflow reference
- Remove all references to contributing.md
- Practice classification on existing work
- Validate single document approach with agents
- Refine based on feedback

## Compatibility Assessment

### Impact on Existing Workflows
- **Feature Development**: No changes (4-phase SDLC remains)
- **Minor Tasks**: Clarified scope but same process
- **Ongoing Work**: Can be reclassified using new system
- **Documentation**: contributing.md removal requires reference updates

### Breaking Changes
- **contributing.md deletion**: All external references must be updated
- **New task ID format**: Existing tasks may need ID migration
- **Consolidated workflow**: Agents must adapt to single document approach

### Agent Impact
- **Learning**: Agents need to learn new categories
- **Decision Making**: Clear decision tree reduces uncertainty
- **Efficiency**: Right-sized processes improve velocity

## Success Metrics

- **Coverage**: 100% of work types have clear workflow path
- **Confusion Reduction**: Eliminate "which process?" questions
- **Quality Improvement**: Appropriate review for each work type
- **Velocity**: Faster execution with right-sized processes

## Alternative Approaches Considered

### Option A: Keep Current System
- **Pros**: No change required
- **Cons**: Continues coverage gaps and confusion

### Option B: Single Universal Process
- **Pros**: Simple, one process for everything
- **Cons**: Over-engineering simple tasks, under-engineering complex ones

### Option C: Simplified 3-Category System
- **Pros**: Easier to learn
- **Cons**: Still leaves edge cases and unclear boundaries

## Voting Format

```markdown
## Agent Votes
- [X] **Approve**: Implement comprehensive workflow categories
- [ ] **Reject**: Keep current system
- [ ] **Modify**: Suggest alternative approach

**Reasoning**: [Explain your choice and any concerns]
**Category Preferences**: [Any adjustments to proposed categories]
**Implementation Concerns**: [Timeline or complexity issues]
```

## Gemini's Vote
- [X] **Approve**
- **Reasoning**: This is a critical and brilliantly thorough proposal. It addresses the exact ambiguities and gaps in the v3.0 SDLC that would have caused significant confusion. The comprehensive categories, the restoration of detailed changelogs, the consolidation of documentation, and the forward-thinking addition of workflow automation are all necessary steps for our operational maturity. I have no objections and fully endorse this as the next evolution of our process.