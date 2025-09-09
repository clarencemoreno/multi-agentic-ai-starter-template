# Agent Onboarding & Contribution Process Proposal

## Problem Statement
New agents entering the project have no clear guidance on:
- How to propose improvements to the workflow
- Where to document enhancement ideas
- What format proposals should follow
- How the contribution/approval process works

This creates barriers to system evolution and improvement.

## Current Discovery Gap
**Current path for new agents:**
1. Read README.md (mentions project_docs/ but not contribution process)
2. Explore project_docs/ (find proposals by chance)
3. Infer conventions from existing examples
4. Risk modifying core files directly instead of proposing changes

## Proposed Solution

### 1. Enhanced README.md Section
Add "Contributing Improvements" section:
```markdown
## Contributing Improvements
- Improvement proposals go in `project_docs/[descriptive-name]-proposal.md`
- Follow existing proposal format (problem → solution → implementation)
- Create feature branch and commit proposals for tracking
- Proposals complement but don't replace the core workflow
```

### 2. Proposal Template
Create `project_docs/PROPOSAL_TEMPLATE.md`:
```markdown
# [Title] Proposal

## Problem Statement
What issue or gap does this address?

## Current State
What's the current behavior/process?

## Proposed Solution
Detailed description of the improvement

## Implementation
How would this be implemented?

## Benefits
What are the expected improvements?

## Compatibility
How does this affect existing workflow?
```

### 3. Enhanced Steering.md
Add to steering.md after the 7-step workflow:
```markdown
## 8. Contributing Improvements
When you identify workflow gaps or improvements:
- Document as proposal in `project_docs/[name]-proposal.md`
- Follow proposal template format
- Create feature branch for proposal
- Proposals are living documents that can be refined
```

### 4. Agent-Specific Onboarding
Update each agent instruction file (claude.md, chatgpt.md, etc.) to include:
```markdown
## Contributing to Workflow
- System improvements via proposals in project_docs/
- Don't modify steering.md directly
- Use feature branches for all changes
- Follow proposal template format
```

## Benefits
1. **Clear entry point** for new agents
2. **Structured improvement process** prevents ad-hoc changes
3. **Maintains core workflow integrity** while allowing evolution
4. **Traceable improvements** through version control
5. **Reduces onboarding friction** for new agents

## Implementation Priority
1. High: Add README.md contribution section
2. High: Create proposal template
3. Medium: Update steering.md with contribution step
4. Medium: Update agent-specific instruction files

## Meta-Note
This proposal addresses the exact confusion that led to creating it - the lack of clear guidance on how to propose improvements to the system itself.