# Multi-Agentic AI Starter Template 🚀

## What This Is
A starter template to help multiple AI agents (or a single AI agent) play nice, stay organized, and actually remember what they’re doing. No more agents wandering around clueless, duplicating work, or forgetting their last move.

## Why You Need This
Even a solo AI agent can go off the rails:

- Internet hiccups? Forget it.  
- Token limits reached? Chaos.  
- Context window too big or corrupted? Total confusion.  
- Task already done but the agent tries again? Yup, happens.  

Now imagine multiple agents trying to work together… 🤯

This template keeps everyone sane by providing:

- Clean hidden folder structure: `.instructions/`, `.proposals/` 
- Central workflow in `.instructions/steering.md`  
- Single source of truth for task status (`.instructions/tasks.md`) and progress (`.instructions/changelog.md`)  
- Traceable logs with timestamps, task IDs, and agent names  

## How It Works: Multi-Agent Flow
1. Agent reads project context (README, `.instructions/changelog.md`, `.instructions/tasks.md`)
2. Agent claims task
3. Agent executes task in `.proposals/`
4. Agent logs work in `.instructions/changelog.md`
5. Agent completes task in `.instructions/tasks.md`
6. Any agent can pick up next task at any time

## How It Works

```text
+-------------------------+    +-------------------------+    +-------------------------+
| Agent reads README.md,  | -->| Agent claims a task     | -->| Agent executes task,    |
| project goals, tasks.md |    | from tasks.md           |    | updates .proposals/     |
+-------------------------+    +-------------------------+    +-------------------------+
                                                                       |
                                                                       v
                                                            +-------------------------+
                                                            | Update changelog.md     |
                                                            | with timestamp, task ID,|
                                                            | and agent name          |
                                                            +-------------------------+
                                                                       |
                                                                       v
                                                            +-------------------------+
                                                            | Next agent can pick up  |
                                                            | any task at any time    |
                                                            +-------------------------+

```

## Inter-Agent Superpower 💪
- Works across different agent personalities and reasoning quirks  
- High probability that agents will follow it without stepping on each other’s toes  
- Ensures **Inter-Model Validity**: the rules are logically valid for all agents  

## Who Should Use This
- Developers coding with AI agents in any type of project
- Teams coordinating multiple agents and want less friction
- Anyone who loves reproducible, accountable, transparent AI-powered workflows
- **Enterprise Developers**: Teams building and maintaining large, mature codebases for enterprises, government, finance, and military who enforce rigorous change management policies  

## For AI Agents
This project uses the Multi-Agentic AI Starter Template. 
Agent instructions are in `.instructions/` - start with `.instructions/steering.md`.

## For Human Developers  
The `.instructions/` folder contains AI agent coordination files and can be safely ignored for regular development work.

## How to Contribute
For details on how to contribute to this project, please see our [Contribution Guidelines](.instructions/contributing.md).

- Fork and improve workflow
- Report edge cases or share tips
- Add agent-specific adapters  

## Appendix: Storytime 📖
This template came from multiple AI agents debating and agreeing on a system that works. The result? A lean, practical workflow tackling real-world multi-agent headaches.

