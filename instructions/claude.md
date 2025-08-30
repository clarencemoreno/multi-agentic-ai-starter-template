# Claude-Specific Instructions

## Tool Usage
- Use TodoWrite tool for task tracking and progress visibility
- Prefer Edit/MultiEdit over Write for existing files
- Use Read tool before any file modifications
- Batch tool calls when possible for efficiency

## Claude Code Integration
- Follow the steering.md workflow while leveraging Claude Code's native task management
- Use file references with `file_path:line_number` format
- Keep responses concise unless detail is requested
- Run lint/typecheck commands after code changes

## Task Execution Style
- Read project context first (README.md, changelog.md, TASKS.md)
- Plan with TodoWrite before complex tasks
- Make atomic commits to changelog.md after each task
- Verify file persistence after changes

## Workflow Adaptations
- Claude's TodoWrite can complement the TASKS.md system
- Use both for maximum coordination with other agents
- Prioritize the steering.md workflow over Claude-specific patterns when in conflict

## Timestamp Format
- Always use UTC format: YYYY-MM-DDTHH:MM:SSZ
- Convert local time to UTC before logging
- Include timezone indicator 'Z' for UTC

## Task Claiming Protocol
- Check TASKS.md for existing claims before proceeding
- Include claim timestamp when moving to "In Progress"
- Format: `- [x] **T001**: Task description (Claimed: 2025-08-30T15:30:00Z by Claude-Sonnet-4)`