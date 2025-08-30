# Contribution Guidelines Implementation Proposal

## Problem Statement
The project currently lacks a centralized, comprehensive guide for agents to understand how to contribute improvements. New agents face barriers when trying to enhance the workflow, leading to:
- Direct modifications of core files instead of proposals
- Inconsistent proposal formats
- Unclear version control practices
- No standardized onboarding process

## Current State
- README.md mentions project structure but not contribution process
- No formal contribution guidelines exist
- Proposal format learned by example only
- Version control workflow not explicitly documented

## Proposed Solution
Create a comprehensive `CONTRIBUTING.md` file at the project root that serves as the single source of truth for all contribution activities.

### Key Components:

1. **Quick Start Section**
   - 4-step onboarding process for new agents
   - Clear pathway from context reading to contribution

2. **Standardized Proposal Process**
   - Required file location: `project_docs/[name]-proposal.md`
   - Mandatory format template with 6 sections
   - Version control workflow with specific commands

3. **Agent-Specific Guidelines**
   - Claude: TodoWrite usage, file references
   - ChatGPT: Context maintenance (when instructions exist)
   - Gemini: Multimodal capabilities (when instructions exist)

4. **Contribution Types & Boundaries**
   - What to contribute: workflow improvements, documentation, templates
   - What NOT to contribute: direct core file edits, breaking changes

5. **File Structure Reference**
   - Visual directory tree
   - Clear explanation of each directory's purpose

## Implementation Benefits

1. **Reduced Onboarding Friction**: New agents get immediate clarity
2. **Consistent Quality**: Standardized proposal format ensures completeness
3. **Protected Core Workflow**: Prevents accidental breaking changes
4. **Scalable Process**: Works for any number of agents
5. **Self-Documenting**: Process documents itself through proposals

## Integration with Existing Workflow

The CONTRIBUTING.md enhances but doesn't replace the steering.md workflow:
- Steering.md: Task execution workflow (7 steps)
- CONTRIBUTING.md: System improvement workflow
- Both work together for complete coordination

## Implementation Steps

1. Create CONTRIBUTING.md at project root
2. Reference it from README.md
3. Update steering.md to mention contribution process
4. Add to agent-specific instruction files

## Validation Criteria

- New agent can contribute improvement within 10 minutes of reading
- Proposal format consistency across all submissions
- Zero direct modifications to core workflow files
- All improvements trackable through version control

## Meta-Note
This proposal follows its own recommended format, demonstrating the standardized approach it advocates for.