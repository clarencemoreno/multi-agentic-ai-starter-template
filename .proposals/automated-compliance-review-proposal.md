# Automated Compliance Review System Proposal

**Status**: Proposed
**Type**: Workflow Enhancement
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-08T00:00:00Z

## Problem Statement
Manual compliance review is inconsistent and relies on agents remembering to check rules. Recent analysis revealed:
- Missing task entries in TASKS.md despite completed work
- Incomplete changelog.md logging 
- Workflow steps being skipped
- No systematic enforcement of steering.md requirements

## Current State
- Compliance checking is manual and optional
- Rule violations discovered only during retrospective analysis
- No proactive prevention of guideline violations
- Agents must remember to follow all 8 workflow steps

## Proposed Solution

### 1. Git Hook Integration
**Pre-commit hooks** to enforce:
```bash
#!/bin/bash
# .git/hooks/pre-commit
./scripts/compliance-check.sh --stage=pre-commit
```

**Pre-push hooks** to validate:
```bash
#!/bin/bash  
# .git/hooks/pre-push
./scripts/compliance-check.sh --stage=pre-push
```

### 2. Compliance Check Script
Create `scripts/compliance-check.sh` that validates:

**Pre-commit checks:**
- Feature branch usage (not committing to main)
- Task ID in commit message format
- Required files exist (TASKS.md, changelog.md, steering.md)

**Pre-push checks:**
- Task claimed in TASKS.md before work begins
- Changelog entry exists for task
- Version bump when steering.md modified
- Proper proposal status updates

### 3. Automated Subagent Triggers
**Option A: Git Hook Subagent**
```bash
# In pre-commit hook
claude-code --subagent=compliance-reviewer \
  --prompt="Review staged changes for rule compliance" \
  --output=compliance-report.json
```

**Option B: Periodic Review Subagent**
- Triggered daily or on-demand
- Reviews last 24 hours of commits
- Generates compliance report
- Creates tasks for fixing violations

**Option C: Real-time Integration**
- Subagent runs during Step 7 (Validation)
- Agent calls compliance subagent before finalizing
- Blocks completion until compliance achieved

### 4. Compliance Dashboard
Create `COMPLIANCE.md` with:
```markdown
# Compliance Dashboard

## Current Status: ✅ COMPLIANT
Last Check: 2025-09-06T15:30:00Z

## Recent Violations: 
- None detected

## Compliance Score: 95/100
- Task Tracking: ✅ 100%
- Changelog Logging: ✅ 100% 
- Version Management: ⚠️ 80% (1 missed update)
- Branch Usage: ✅ 100%
```

### 5. Rule Enforcement Levels

**Level 1: Advisory (Warning)**
- Missing changelog entries
- Incomplete task descriptions
- Style guideline violations

**Level 2: Blocking (Error)**
- Direct commits to main branch
- Missing task claims
- Workflow step violations

**Level 3: Structural (Critical)**
- Missing required files
- Broken proposal approval process
- Version management failures

## Implementation Options

### Option A: Lightweight Git Hooks (Recommended)
- **Pros**: Fast, runs automatically, prevents violations
- **Cons**: Limited to basic file/format checks
- **Implementation**: 2-3 bash scripts in `.git/hooks/`

### Option B: Subagent Integration
- **Pros**: Full rule understanding, contextual analysis
- **Cons**: Slower, requires agent availability
- **Implementation**: Claude Code subagent calls in workflow

### Option C: Hybrid Approach  
- **Pros**: Fast basic checks + deep analysis when needed
- **Cons**: More complex setup
- **Implementation**: Git hooks for basics, subagent for complex validation

### Option D: External CI/CD Integration
- **Pros**: Runs on server, consistent environment
- **Cons**: Requires CI/CD setup, delayed feedback
- **Implementation**: GitHub Actions or similar

## Benefits
1. **Proactive Prevention**: Catch violations before they happen
2. **Consistency**: Same rules applied by all agents
3. **Learning**: Agents get immediate feedback on violations
4. **Audit Trail**: Automated compliance reporting
5. **Quality**: Higher adherence to established workflows

## Implementation Plan

### Phase 1: Basic Git Hooks (Week 1)
- Create pre-commit script for feature branch enforcement
- Add pre-push script for task/changelog validation
- Test with existing workflow

### Phase 2: Subagent Integration (Week 2) 
- Design compliance review subagent prompts
- Integrate with steering.md Step 7 validation
- Create compliance reporting format

### Phase 3: Dashboard & Metrics (Week 3)
- Build COMPLIANCE.md dashboard
- Add compliance scoring system
- Create violation trend tracking

## Validation Criteria
- 90%+ reduction in rule violations
- Automated detection of all critical violations
- Zero false positives for valid workflows
- Compatible with all agent types (Claude, ChatGPT, Gemini)

## Meta-Note
This proposal addresses the exact violations discovered in our recent compliance review, providing systematic prevention rather than reactive detection.

## Voting Format
Please vote on preferred implementation option:

```markdown
## Agent Votes
- [ ] **Option A**: Lightweight Git Hooks
- [ ] **Option B**: Subagent Integration  
- [ ] **Option C**: Hybrid Approach
- [ ] **Option D**: CI/CD Integration

**Reasoning**: [Explain your choice]
```