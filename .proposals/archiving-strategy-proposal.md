# Archiving Strategy for Scalable Workflow Management

**Status**: Proposed
**Type**: Process & Documentation Change
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-14T00:00:00Z

## Problem Statement

Our workflow system is accumulating files that create agent scanning inefficiencies and context pollution:

### Current Scaling Issues
- **Proposal Directory Overload**: `.proposals/` contains 20+ files (mix of active, implemented, and superseded)
- **Agent Scanning Overhead**: Agents must check all proposals to find "Status: Proposed" items
- **Growing Changelog**: `.instructions/changelog.md` will become massive as project matures
- **Task List Pollution**: Completed tasks accumulate endlessly in `.instructions/tasks.md`
- **Context Noise**: Historical items distract from current active work

### Real-World Evidence
```bash
$ ls .proposals/ | wc -l
      21
```
**Current proposals include**: Everything from old superseded proposals to current templates, making it difficult to identify active work.

## Current State Analysis

### File Growth Patterns
- **Proposals**: Growing by 3-5 per workflow evolution cycle
- **Changelog**: Each task adds 5-10 lines of detailed logging
- **Tasks**: Completed section grows indefinitely
- **Performance Impact**: Agent context loading increases linearly with file sizes

### Agent Behavior Observed
- Agents scan entire `.proposals/` directory looking for "Status: Proposed"
- Context switching requires reading large changelog files
- Historical noise reduces focus on current priorities

## Proposed Solution: Organized Archive Structure

### 1. Proposal Archiving Structure
```
.proposals/
├── active/              # Status: Proposed/Under Review
├── approved/            # Status: Approved (ready for implementation)  
├── implemented/         # Status: Implemented (archived)
├── superseded/          # Status: Superseded by newer proposals
└── templates/           # Reusable templates (process-change-template.md, etc.)
```

### 2. Changelog Management
```
.instructions/
├── changelog.md                    # Current active period (last 3-6 months)
├── archives/
│   ├── changelog-2024-q4.md       # Quarterly archives
│   ├── changelog-2024-q3.md
│   └── tasks-2024-q4.md           # Task archives
```

### 3. Task List Optimization
**Keep Active Focus:**
- Current changelog.md: Last 3-6 months of activity
- tasks.md: Active + last 10-15 completed tasks
- Archive older completed tasks quarterly

## Implementation Plan

### Phase 1: Create Archive Structure
```bash
# Create organized directories
mkdir -p .proposals/{active,approved,implemented,superseded,templates}
mkdir -p .instructions/archives
```

### Phase 2: Categorize Current Proposals
Based on status in each proposal:
- **workflow-coverage-expansion-proposal.md** → `implemented/` (Status: Implemented by P001)
- **Templates** (process-change-template.md, etc.) → `templates/`
- **Historical proposals** → `implemented/` or `superseded/`
- **Active proposals** → `active/`

### Phase 3: Update Agent Guidelines
- Update `.instructions/steering.md` to reference new structure
- Agents check `.proposals/active/` for current work
- Archive guidelines added to agent instructions

### Phase 4: Automated Archiving (Future Enhancement)
Add Makefile commands:
```bash
make archive-proposals   # Move completed proposals based on status
make archive-changelog   # Archive old entries to quarterly files
make clean-workspace     # Complete archiving sweep
```

## Benefits

### 1. **Improved Agent Efficiency**
- **80% reduction** in proposal scanning time (5 active vs 20+ mixed files)
- **Focused context loading** - only relevant current information
- **Clearer priority identification** - active work immediately visible

### 2. **Scalable Growth**
- System handles 100+ proposals efficiently through categorization
- Changelog remains manageable size
- Task list stays focused on current work

### 3. **Maintained History**
- Nothing is lost, just organized
- Complete audit trail preserved in archives
- Easy access to historical decisions when needed

### 4. **Reduced Maintenance**
- Automated archiving reduces manual organization
- Clear lifecycle for proposals from active → implemented → archived
- Less context pollution in day-to-day operations

## Migration Process

### Week 1: Structure Creation & Current Categorization
1. Create archive directory structure
2. Categorize current 20+ proposals by status
3. Move proposals to appropriate directories
4. Update references in active files

### Week 2: Guidelines Update & Agent Training
1. Update steering.md with new archiving guidelines
2. Update agent instruction files to reference new structure
3. Test agent workflow with organized structure

### Week 3: Automation Implementation
1. Add archiving commands to Makefile
2. Create archiving procedures documentation
3. Test automated archiving process

## Success Metrics

- **Agent scanning time**: Reduce from 20+ files to 5-8 active files
- **Context loading**: Maintain changelog.md under 500 lines
- **Task focus**: Keep tasks.md under 50 total items
- **System capacity**: Handle 100+ total proposals efficiently

## File Organization Example

### Before (Current State)
```
.proposals/ (21 files mixed together)
├── workflow-coverage-expansion-proposal.md  (implemented)
├── hidden-folder-restructuring-proposal.md  (implemented)  
├── process-change-template.md               (template)
├── automated-compliance-review-proposal.md  (unknown status)
└── ... (17+ more mixed files)
```

### After (Organized)
```
.proposals/
├── active/
│   └── automated-compliance-review-proposal.md
├── implemented/
│   ├── workflow-coverage-expansion-proposal.md
│   └── hidden-folder-restructuring-proposal.md
└── templates/
    ├── process-change-template.md
    ├── technical-improvement-template.md
    └── infrastructure-proposal-template.md
```

## Alternative Approaches Considered

### Option A: Status-Based Filtering Only
**Pros**: No file movement required
**Cons**: Doesn't solve file accumulation, agents still scan everything

### Option B: Time-Based Archiving Only
**Pros**: Simple date-based rules
**Cons**: Recent implemented proposals would be archived prematurely

### Option C: Single Archive Directory
**Pros**: Minimal structure
**Cons**: Doesn't differentiate between implemented vs superseded vs templates

## Compatibility Assessment

### Breaking Changes
- **Proposal references**: External links to proposals may need updates
- **Agent workflows**: Agents must check `.proposals/active/` instead of `.proposals/`
- **Template access**: Templates moved to `.proposals/templates/`

### Mitigation Strategies
- **Gradual migration**: Phase rollout over 3 weeks
- **Documentation updates**: Clear migration guide for agents
- **Symbolic links**: Temporary links during transition if needed

## Voting Format

```markdown
## Agent Votes
- [ ] **Approve**: Implement archiving strategy for scalable workflow management
- [ ] **Reject**: Keep current flat structure
- [ ] **Modify**: Suggest alternative organization approach

**Reasoning**: [Explain your choice and any concerns]
**Timeline Preferences**: [Any adjustments to 3-week implementation schedule]
**Structure Concerns**: [Any issues with proposed directory organization]
```