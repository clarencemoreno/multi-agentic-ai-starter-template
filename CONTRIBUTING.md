# Contributing to Multi-Agentic AI Starter Template

## Quick Start for New Agents

1. **Read the context**: README.md → changelog.md → TASKS.md
2. **Follow the workflow**: instructions/steering.md (7-step process)
3. **Use your agent instructions**: instructions/[your-agent].md
4. **Propose improvements**: Use the process below

## How to Contribute Improvements

### 1. Identify What to Improve
Look for:
- Workflow confusion or ambiguity
- Missing instructions or templates
- Coordination issues between agents
- Documentation gaps

### 2. Create a Proposal
**File location**: `project_docs/[descriptive-name]-proposal.md`

**Required format**:
```markdown
# [Title] Proposal

## Problem Statement
What specific issue does this address?

## Current State
How does the current system work?

## Proposed Solution
Detailed description of your improvement

## Implementation
Step-by-step how to implement this

## Benefits
Expected improvements and impact

## Compatibility
How this affects existing workflow
```

### 3. Version Control Process
```bash
# Create feature branch
git checkout -b feature/proposal-[brief-description]

# Add your proposal
git add project_docs/[your-proposal].md

# Commit with clear message
git commit -m "Add [title] proposal

Brief description of what the proposal addresses

🤖 Generated with [Agent Name]"

# Push branch
git push -u origin feature/proposal-[brief-description]
```

### 4. Implementation Guidelines
- **Don't modify core files directly** (steering.md, TASKS.md format)
- **Create proposals first** for any workflow changes
- **Use feature branches** for all changes
- **Follow existing conventions** (file naming, format, structure)

## Types of Contributions

### Workflow Improvements
- Task coordination enhancements
- Conflict resolution mechanisms
- Timeline and scheduling improvements

### Documentation
- Agent-specific instruction updates
- Template creation
- Process clarification

### Templates & Tools
- Task templates
- Changelog formats
- Agent onboarding materials

## Agent-Specific Guidelines

### For Claude
- Use TodoWrite for task tracking
- Follow file reference format: `file_path:line_number`
- Read files before editing

### For ChatGPT
- Follow instructions/chatgpt.md (when created)
- Maintain conversation context

### For Gemini
- Follow instructions/gemini.md (when created)
- Leverage multimodal capabilities appropriately

## What NOT to Contribute

- **Direct modifications** to steering.md without proposals
- **Breaking changes** to existing file formats
- **Agent-specific code** in universal workflow
- **Overly complex** processes that hinder adoption

## Review Process

1. **Self-review**: Does this solve a real problem?
2. **Compatibility check**: Does this break existing workflow?
3. **Documentation**: Is the proposal clear and complete?
4. **Implementation**: Can other agents easily follow this?

## File Structure Reference

```
├── README.md                 # Project overview
├── CONTRIBUTING.md           # This file
├── TASKS.md                  # Central task tracking
├── changelog.md              # Project status log
├── instructions/
│   ├── steering.md           # Universal workflow (don't modify directly)
│   ├── claude.md             # Claude-specific instructions
│   ├── chatgpt.md            # ChatGPT-specific instructions
│   └── gemini.md             # Gemini-specific instructions
└── project_docs/
    ├── *.md                  # Working documents
    └── *-proposal.md         # Improvement proposals
```

## Examples of Good Proposals

- `flow-improvements-proposal.md` - Addresses specific coordination issues
- `workflow-branch-commit-proposal.md` - Fixes missing version control steps
- `agent-onboarding-contribution-proposal.md` - Solves onboarding gaps

## Questions?

If you're unsure about contributing:
1. Check existing proposals for similar ideas
2. Create a small proposal first to test the process
3. Focus on one specific improvement at a time

Remember: The goal is coordination between agents, not perfection. Small, clear improvements are better than complex overhauls.