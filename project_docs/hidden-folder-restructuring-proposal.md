# Hidden Folder Restructuring Proposal

**Status**: Proposed
**Type**: Major Structural Change
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-10T00:00:00Z

## Problem Statement
Current folder structure creates adoption friction for human developers:
- `instructions/` folder clutters root directory
- `TASKS.md`, `changelog.md` in root alongside project code
- Violates standard project conventions (most tools/configs use hidden folders)
- Makes template intrusive when added to existing codebases
- Creates visual noise that distracts from actual project files

## Current State
```
ROOT/
├── instructions/           # 👎 Visible, clutters root
│   ├── steering.md
│   ├── claude.md
│   ├── chatgpt.md
│   └── gemini.md
├── project_docs/          # 👎 Visible, could be hidden
├── TASKS.md               # 👎 In root, not project-related
├── changelog.md           # 👎 In root, not project-related  
├── CONTRIBUTING.md        # 👍 Standard location
└── README.md              # 👍 Standard location
```

## Proposed Solution

### New Structure: Hidden `.instructions/` Folder
```
ROOT/
├── .instructions/         # 👍 Hidden, non-intrusive
│   ├── steering.md        # Core workflow
│   ├── claude.md          # Agent-specific instructions
│   ├── chatgpt.md
│   ├── gemini.md
│   ├── tasks.md           # Moved from root
│   ├── changelog.md       # Moved from root
│   └── contributing.md    # Moved from root
├── .proposals/            # 👍 Hidden, renamed from project_docs/
└── README.md              # 👍 Mentions .instructions/ for agents
```

### Updated README.md Reference
```markdown
## For AI Agents
This project uses the Multi-Agentic AI Starter Template. 
Agent instructions are in `.instructions/` - start with `.instructions/steering.md`.

## For Human Developers  
The `.instructions/` folder contains AI agent coordination files and can be safely ignored for regular development work.
```

## Benefits

### 1. **Adoption Friendly**
- Clean root directory for human developers
- No visual clutter from AI-specific files
- Follows standard hidden folder conventions (`.git/`, `.github/`, `.vscode/`)
- Easy to add to existing codebases without disruption

### 2. **Industry Standard Pattern**
- Aligns with how other tools organize their files
- `.instructions/` follows same pattern as `.github/workflows/`
- Developers expect configuration in hidden folders

### 3. **Professional Appearance**
- Root directory shows only project-relevant files
- AI coordination infrastructure is present but unobtrusive
- Maintains focus on actual codebase

### 4. **Backward Compatibility**
- Agents can easily find `.instructions/steering.md`
- All workflow references update to new paths
- No functional changes to agent coordination

## Implementation Plan

### Phase 1: File Migration
```bash
# Create new structure
mkdir .instructions .proposals

# Move files
mv instructions/* .instructions/
mv TASKS.md .instructions/tasks.md
mv changelog.md .instructions/changelog.md
mv CONTRIBUTING.md .instructions/contributing.md
mv project_docs/* .proposals/

# Remove old directories
rmdir instructions project_docs
```

### Phase 2: Update All References
**Files requiring path updates:**
- `.instructions/steering.md` - Update all internal path references
- `.instructions/claude.md` - Update file paths in instructions
- `.instructions/chatgpt.md` - Update file paths in instructions  
- `.instructions/gemini.md` - Update file paths in instructions
- `README.md` - Update references to new structure

**Specific changes needed:**
- `README.md` → `.instructions/tasks.md`
- `changelog.md` → `.instructions/changelog.md`
- `CONTRIBUTING.md` → `.instructions/contributing.md`
- `project_docs/` → `.proposals/`

### Phase 3: Validation
- Test agent workflow with new paths
- Verify all inter-file references work
- Update any remaining hardcoded paths

## Breaking Changes & Mitigation

### What Breaks
- Any external tools referencing old paths
- Existing agent prompts with hardcoded paths
- Bookmarks/shortcuts to old locations

### Mitigation Strategies
1. **Agent Instructions**: Update all agent-specific files with new paths
2. **Documentation**: Clear migration guide in commit message
3. **Symlinks** (Optional): Temporary symlinks during transition
4. **Version Bump**: Major version bump (v1.4 → v2.0) to signal breaking change

## Compatibility Assessment

### Agent Impact
- **Claude**: Must update references in .instructions/claude.md
- **ChatGPT**: Must update references in .instructions/chatgpt.md  
- **Gemini**: Must update references in .instructions/gemini.md
- **All Agents**: Must update steering.md workflow paths

### Workflow Impact
- Step 1 (Sync Context): Read `.instructions/tasks.md` instead of `TASKS.md`
- Step 4 (Log Work): Append to `.instructions/changelog.md`
- Step 5 (Complete Task): Update `.instructions/tasks.md`
- All proposal workflows: Use `.proposals/` instead of `project_docs/`

## Migration Script
```bash
#!/bin/bash
# migrate-to-hidden-folders.sh

echo "Migrating to hidden folder structure..."

# Create new directories
mkdir -p .instructions .proposals

# Move instruction files
if [ -d "instructions" ]; then
    cp -r instructions/* .instructions/
    rm -rf instructions
fi

# Move root files to .instructions
[ -f "TASKS.md" ] && mv TASKS.md .instructions/tasks.md
[ -f "changelog.md" ] && mv changelog.md .instructions/changelog.md  
[ -f "CONTRIBUTING.md" ] && mv CONTRIBUTING.md .instructions/contributing.md

# Move project_docs to .proposals
if [ -d "project_docs" ]; then
    cp -r project_docs/* .proposals/
    rm -rf project_docs
fi

echo "Migration complete. Please update README.md and all path references."
```

## Validation Criteria
- All agent workflows function with new paths
- No broken internal references between files
- README.md clearly explains structure to both agents and humans
- Hidden folders don't appear in normal `ls` output
- All existing functionality preserved

## Alternative Considered

### Option B: Keep Current Structure
- **Pros**: No breaking changes, no migration needed
- **Cons**: Continues adoption friction, non-standard approach
- **Assessment**: Maintains status quo but hurts long-term adoption

### Option C: Partial Migration (Only .instructions/)
- Move only `instructions/` → `.instructions/`
- Keep `TASKS.md`, `changelog.md` in root
- **Assessment**: Inconsistent, doesn't fully solve adoption issue

## Meta-Note
This proposal prioritizes human developer experience and industry standards while maintaining all agent coordination functionality. The breaking changes are justified by significant adoption benefits.

## Voting Format
```markdown
## Agent Votes
- [ ] **Approve**: Implement hidden folder restructuring
- [ ] **Reject**: Keep current structure
- [ ] **Modify**: Suggest alternative approach

**Reasoning**: [Explain your choice and any concerns]
**Migration Concerns**: [Any specific issues with the proposed migration]
```