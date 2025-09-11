# Multi-Agent Development Workflow Makefile
# Automates common git operations for faster development

# Default values
BRANCH_PREFIX ?= feature
MESSAGE ?= "Update files"
BRANCH_NAME ?= $(shell date +"%Y%m%d-%H%M%S")-update

# Colors for output
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[1;33m
BLUE = \033[0;34m
NC = \033[0m # No Color

.PHONY: help status branch commit push pr quick-commit quick-branch clean

help: ## Show this help message
	@echo "$(BLUE)Multi-Agent Development Workflow$(NC)"
	@echo "Usage: make [target] [variables]"
	@echo ""
	@echo "$(YELLOW)Quick Commands:$(NC)"
	@echo "  make quick           Create branch, commit, and push in one command"
	@echo "  make quick-commit    Add all, commit with message, and push current branch"
	@echo ""
	@echo "$(YELLOW)Individual Commands:$(NC)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(YELLOW)Variables:$(NC)"
	@echo "  BRANCH_PREFIX    Branch prefix (default: feature)"
	@echo "  BRANCH_NAME      Branch name (default: timestamp-update)"
	@echo "  MESSAGE          Commit message (default: 'Update files')"
	@echo "  FILES            Specific files to add (default: all changes)"
	@echo ""
	@echo "$(YELLOW)Examples:$(NC)"
	@echo "  make quick BRANCH_NAME=steering-v3 MESSAGE='Implement steering v3.0'"
	@echo "  make quick-commit MESSAGE='Fix typos in documentation'"
	@echo "  make branch BRANCH_NAME=new-feature"
	@echo "  make commit MESSAGE='Add new proposal' FILES='.proposals/new.md'"

status: ## Show git status and current branch
	@echo "$(BLUE)Current Status:$(NC)"
	@git status --short
	@echo ""
	@echo "$(BLUE)Current Branch:$(NC) $(shell git branch --show-current)"
	@echo "$(BLUE)Recent Commits:$(NC)"
	@git log --oneline -3

branch: ## Create and switch to new branch
	@echo "$(YELLOW)Creating branch: $(BRANCH_PREFIX)/$(BRANCH_NAME)$(NC)"
	@git checkout -b $(BRANCH_PREFIX)/$(BRANCH_NAME)
	@echo "$(GREEN)✓ Created and switched to branch: $(BRANCH_PREFIX)/$(BRANCH_NAME)$(NC)"

commit: ## Add files and commit with message
ifdef FILES
	@echo "$(YELLOW)Adding specific files: $(FILES)$(NC)"
	@git add $(FILES)
else
	@echo "$(YELLOW)Adding all changes$(NC)"
	@git add .
endif
	@echo "$(YELLOW)Committing with message: $(MESSAGE)$(NC)"
	@git commit -m "$(MESSAGE)"
	@echo "$(GREEN)✓ Committed changes$(NC)"

push: ## Push current branch to origin
	@echo "$(YELLOW)Pushing branch to origin$(NC)"
	@CURRENT_BRANCH=$$(git branch --show-current); \
	git push -u origin $$CURRENT_BRANCH
	@echo "$(GREEN)✓ Pushed to origin$(NC)"

pr: ## Show PR creation URL
	@CURRENT_BRANCH=$$(git branch --show-current); \
	echo "$(BLUE)Create PR at:$(NC)"; \
	echo "https://github.com/clarencemoreno/multi-agentic-ai-starter-template/pull/new/$$CURRENT_BRANCH"

quick: branch commit push pr ## Create branch, commit, and push in one command
	@echo "$(GREEN)✓ Quick workflow complete!$(NC)"

quick-commit: commit push ## Add all, commit, and push current branch
	@echo "$(GREEN)✓ Quick commit complete!$(NC)"

quick-branch: branch ## Create branch and show status
	@make status

clean: ## Clean up merged branches (interactive)
	@echo "$(YELLOW)Merged branches that can be deleted:$(NC)"
	@git branch --merged | grep -v "\*\|main\|master" || echo "No merged branches to clean"
	@echo ""
	@echo "$(BLUE)To delete merged branches, run:$(NC)"
	@echo "git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d"

# Advanced workflow for proposal creation
proposal: ## Create branch for new proposal (requires PROPOSAL_NAME)
ifndef PROPOSAL_NAME
	@echo "$(RED)Error: PROPOSAL_NAME is required$(NC)"
	@echo "Usage: make proposal PROPOSAL_NAME=my-new-proposal MESSAGE='Add my proposal'"
	@exit 1
endif
	@make branch BRANCH_NAME=$(PROPOSAL_NAME)-proposal
	@echo "$(BLUE)Ready to create proposal in .proposals/$(PROPOSAL_NAME)-proposal.md$(NC)"

# Advanced workflow for feature implementation  
feature: ## Create branch for feature implementation (requires FEATURE_ID)
ifndef FEATURE_ID
	@echo "$(RED)Error: FEATURE_ID is required$(NC)"
	@echo "Usage: make feature FEATURE_ID=F001 MESSAGE='Implement user auth'"
	@exit 1
endif
	@make branch BRANCH_NAME=$(FEATURE_ID)-implementation
	@echo "$(BLUE)Ready to implement feature $(FEATURE_ID)$(NC)"

# Workflow for steering document updates
steering: ## Create branch for steering.md updates
	@make branch BRANCH_NAME=steering-update MESSAGE="Update steering.md workflow"
	@echo "$(BLUE)Ready to update .instructions/steering.md$(NC)"

# Check if we're in a git repository
check-git:
	@if [ ! -d .git ]; then \
		echo "$(RED)Error: Not in a git repository$(NC)"; \
		exit 1; \
	fi

# Add git check to all git-related targets
branch commit push quick quick-commit: check-git

# Show git log with pretty format
log: ## Show formatted git log
	@git log --oneline --graph --decorate --all -10

# Show current branch info
info: ## Show detailed branch information
	@echo "$(BLUE)Branch Information:$(NC)"
	@echo "Current: $(shell git branch --show-current)"
	@echo "Remote: $(shell git config --get branch.$(shell git branch --show-current).remote 2>/dev/null || echo 'Not set')"
	@echo "Tracking: $(shell git config --get branch.$(shell git branch --show-current).merge 2>/dev/null || echo 'Not set')"
	@echo ""
	@echo "$(BLUE)Uncommitted Changes:$(NC)"
	@git diff --stat
	@echo ""
	@echo "$(BLUE)Untracked Files:$(NC)"
	@git ls-files --others --exclude-standard