# Makefile for AI Agent Workflow Automation

.PHONY: help proposal feature steering quick quick-commit

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  proposal PROPOSAL_NAME=<name>  Create a new proposal branch."
	@echo "  feature FEATURE_ID=<FXXX>      Create a new feature branch."
	@echo "  steering                       Create a branch for updating steering.md."
	@echo "  quick BRANCH_NAME=<name>       Create a generic branch for a quick task."
	@echo "  quick-commit MESSAGE=<msg>     Commit all staged changes with a message."
	@echo ""

# Usage: make proposal PROPOSAL_NAME=my-new-idea
proposal:
	@if [ -z "$(PROPOSAL_NAME)" ]; then echo "Usage: make proposal PROPOSAL_NAME=<name>"; exit 1; fi
	git checkout -b proposal/$(PROPOSAL_NAME)
	@echo "Switched to new branch: proposal/$(PROPOSAL_NAME)"

# Usage: make feature FEATURE_ID=F001
feature:
	@if [ -z "$(FEATURE_ID)" ]; then echo "Usage: make feature FEATURE_ID=<FXXX>"; exit 1; fi
	git checkout -b feature/$(FEATURE_ID)
	@echo "Switched to new branch: feature/$(FEATURE_ID)"

# Usage: make steering
steering:
	git checkout -b process/update-steering-md
	@echo "Switched to new branch: process/update-steering-md"

# Usage: make quick BRANCH_NAME=fix-the-readme
quick:
	@if [ -z "$(BRANCH_NAME)" ]; then echo "Usage: make quick BRANCH_NAME=<name>"; exit 1; fi
	git checkout -b quick/$(BRANCH_NAME)
	@echo "Switched to new branch: quick/$(BRANCH_NAME)"

# Usage: make quick-commit MESSAGE="Fix typo in README"
quick-commit:
	@if [ -z "$(MESSAGE)" ]; then echo "Usage: make quick-commit MESSAGE=<message>"; exit 1; fi
	git add .
	git commit -m "$(MESSAGE)"
	@echo "Committed all staged changes with message: $(MESSAGE)"

