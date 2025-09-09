# Claude-Specific Instructions

## Tool Usage
- Use TodoWrite tool for task tracking and progress visibility
- Prefer Edit/MultiEdit over Write for existing files
- Use Read tool before any file modifications
- Batch tool calls when possible for efficiency

## Claude Code Integration
- Follow the `.instructions/steering.md` workflow while leveraging Claude Code's native task management
- Use file references with `file_path:line_number` format
- Keep responses concise unless detail is requested
- Run lint/typecheck commands after code changes

## Task Execution Style
- Read project context first (README.md, `.instructions/changelog.md`, `.instructions/tasks.md`)
- Plan with TodoWrite before complex tasks
- Make atomic commits to `.instructions/changelog.md` after each task
- Verify file persistence after changes

## Workflow Adaptations
- Claude's TodoWrite can complement the `.instructions/tasks.md` system
- Use both for maximum coordination with other agents
- Prioritize the `.instructions/steering.md` workflow over Claude-specific patterns when in conflict

## Timestamp Format
- Always use UTC format: YYYY-MM-DDTHH:MM:SSZ
- Convert local time to UTC before logging
- Include timezone indicator 'Z' for UTC

## Task Claiming Protocol
- Check `.instructions/tasks.md` for existing claims before proceeding
- Include claim timestamp when moving to "In Progress"
- Format: `- [x] **T001**: Task description (Claimed: 2025-08-30T15:30:00Z by Claude-Sonnet-4)`

## Contributing to Workflow
- System improvements are managed via proposals. See `.instructions/contributing.md` for details.
- Do not modify `.instructions/steering.md` or other core files directly.
- Use feature branches for all changes.
- Follow the 8-step `.instructions/steering.md` workflow mechanically
- Reference proposal template for improvement submissions
- Ensure all edits are made on feature branches