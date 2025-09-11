# Multi-Agent Workflow Migration Checklist

**Purpose**: Guide for migrating multi-agent coordination system to existing projects
**Target Audience**: AI Agents setting up workflow system in existing repositories
**Source Repository**: [multi-agentic-ai-starter-template](https://github.com/clarencemoreno/multi-agentic-ai-starter-template)

---

## Pre-Migration Assessment

### 1. Repository Analysis
- [ ] **Repository Type**: [Web app / API / CLI tool / Library / Other: ___]
- [ ] **Primary Language**: [JavaScript/Python/Go/Rust/Other: ___]
- [ ] **Existing CI/CD**: [GitHub Actions / GitLab CI / CircleCI / Other: ___]
- [ ] **Team Size**: [Solo / 2-3 people / 4+ people]
- [ ] **Development Activity**: [Active daily / Weekly / Monthly / Legacy]

### 2. Existing Structure Check
- [ ] **Git Repository**: Confirm `.git/` exists and is functional
- [ ] **Branch Protection**: Check if main/master has protection rules
- [ ] **Existing Documentation**: Note current README.md, CONTRIBUTING.md
- [ ] **Hidden Folders**: Check for existing `.github/`, `.vscode/`, etc.

### 3. Compatibility Assessment
- [ ] **File Conflicts**: Ensure no existing `.instructions/` or `.proposals/` folders
- [ ] **Makefile Conflicts**: Check if Makefile already exists
- [ ] **README Structure**: Assess how to integrate agent instructions

---

## Migration Steps

### Phase 1: Core Workflow Setup (15 minutes)

#### Step 1: Copy Essential Directories
```bash
# From multi-agentic-ai-starter-template to target repo
cp -r .instructions/ /path/to/target/repo/
cp -r .proposals/templates/ /path/to/target/repo/.proposals/
```

**Files to copy**:
- [ ] `.instructions/steering.md` (core workflow)
- [ ] `.instructions/claude.md` (agent-specific instructions)
- [ ] `.instructions/chatgpt.md` (agent-specific instructions)  
- [ ] `.instructions/gemini.md` (agent-specific instructions)
- [ ] `.proposals/templates/` (all template files)

#### Step 2: Initialize Project-Specific Files
- [ ] **Create `.instructions/tasks.md`**:
  ```markdown
  # Project Task List
  
  ## Current Priority Tasks
  - [ ] **M001**: Setup multi-agent workflow (In Progress: [Agent Name])
  
  ## Completed Tasks
  - [x] **M000**: Repository migration setup (Completed: [Timestamp] by [Agent])
  ```

- [ ] **Create `.instructions/changelog.md`**:
  ```markdown
  # Project Changelog
  
  ## Current Project Status Summary
  Multi-agent workflow system successfully migrated from starter template.
  Ready for collaborative development with steering.md v4.0 workflow.
  
  ## Detailed Changelog
  
  ### 2025-09-[DD] - Workflow Migration
  - Timestamp: [YYYY-MM-DDTHH:MM:SSZ]
  - Model: [Agent Name + Version]
  - Task ID: M000
  - Category: Process & Documentation Change
  - Summary: Migrated multi-agent coordination system to existing project
  - Changes:
    - CREATED: .instructions/ - Complete workflow coordination system
    - CREATED: .proposals/templates/ - Proposal templates for future work
    - MODIFIED: README.md - Added agent coordination section
  ```

#### Step 3: Copy Automation Tools
- [ ] **Copy Makefile** (if no existing Makefile):
  ```bash
  cp Makefile /path/to/target/repo/
  ```
- [ ] **Merge with existing Makefile** (if Makefile exists):
  - Add workflow automation targets
  - Preserve existing build/test targets
  - Ensure no target name conflicts

### Phase 2: Documentation Integration (10 minutes)

#### Step 4: Update README.md
Add agent coordination section to existing README.md:

```markdown
## For AI Agents

This project uses multi-agent coordination. **Read `.instructions/steering.md` first** for the complete workflow.

### Quick Start for Agents
1. **Sync Context**: Read `.instructions/tasks.md` for current work
2. **Choose Category**: Follow 6-category workflow in `.instructions/steering.md`
3. **Use Feature Branches**: All changes require proper branching
4. **Log Everything**: Update `.instructions/changelog.md` after each task

### Agent-Specific Instructions
- **Claude**: See `.instructions/claude.md`
- **ChatGPT**: See `.instructions/chatgpt.md`  
- **Gemini**: See `.instructions/gemini.md`

### Workflow Tools
- Use `make proposal PROPOSAL_NAME=<name>` for new proposals
- Use `make feature FEATURE_ID=<FXXX>` for feature development
- Use `make quick BRANCH_NAME=<name>` for quick tasks

---

## For Human Developers

[Existing human-focused documentation remains here]
```

**Integration checklist**:
- [ ] Preserve existing README content
- [ ] Add agent section at appropriate location
- [ ] Maintain consistent formatting
- [ ] Update any conflicting information

#### Step 5: Project-Specific Adaptations

**Language/Framework Adaptations**:
- [ ] **JavaScript/Node.js**: Update references to `package.json`, `npm run test`
- [ ] **Python**: Update references to `requirements.txt`, `pytest`, `pip`
- [ ] **Go**: Update references to `go.mod`, `go test`
- [ ] **Rust**: Update references to `Cargo.toml`, `cargo test`
- [ ] **Other**: Document language-specific commands in `.instructions/[agent].md`

**Project Structure Adaptations**:
- [ ] Update file paths in templates to match project structure
- [ ] Modify example implementations in steering.md if needed
- [ ] Add project-specific workflow considerations

### Phase 3: Testing & Validation (10 minutes)

#### Step 6: Workflow Verification
- [ ] **Git Operations**: Test branch creation with `make quick BRANCH_NAME=test`
- [ ] **File Access**: Confirm all `.instructions/` files are readable
- [ ] **Template Access**: Verify `.proposals/templates/` are accessible
- [ ] **Makefile Functions**: Test each make target

#### Step 7: Agent Onboarding Test
Run through agent workflow:
- [ ] Read `.instructions/steering.md` completely
- [ ] Identify a simple task (Category 6: Minor Task)
- [ ] Create feature branch using Makefile
- [ ] Make small test change
- [ ] Update `.instructions/changelog.md`
- [ ] Commit and push using workflow

#### Step 8: Multi-Agent Readiness
- [ ] **Task Claiming**: Test task claiming format in `.instructions/tasks.md`
- [ ] **Proposal System**: Create test proposal using template
- [ ] **Coordination**: Verify multiple agents can read same files
- [ ] **Conflict Prevention**: Confirm branching strategy works

---

## Post-Migration Setup

### Project-Specific Configuration

#### Development Commands Integration
Update `.instructions/[agent].md` files with project-specific commands:

```markdown
## Project-Specific Commands
- **Build**: [npm run build / cargo build / go build / make build]
- **Test**: [npm test / pytest / go test / cargo test]
- **Lint**: [npm run lint / flake8 / golangci-lint / cargo clippy]
- **Format**: [prettier / black / gofmt / cargo fmt]
- **Dev Server**: [npm run dev / python manage.py runserver / go run main.go]
```

#### CI/CD Integration
- [ ] **GitHub Actions**: Update workflows to recognize `.instructions/` changes
- [ ] **Branch Protection**: Configure protection for branches with workflow files
- [ ] **PR Templates**: Consider integrating with proposal process
- [ ] **Automated Checks**: Set up validation for changelog/task updates

### Team Coordination

#### Human Developer Onboarding
- [ ] **Team Communication**: Notify human developers about agent coordination system
- [ ] **Branch Awareness**: Explain agent feature branch naming conventions
- [ ] **Review Process**: Clarify human vs. agent review responsibilities
- [ ] **Documentation Updates**: Ensure human-focused docs remain current

#### Monitoring & Metrics
- [ ] **Agent Activity**: Track which agents are contributing
- [ ] **Workflow Effectiveness**: Monitor task completion rates
- [ ] **Conflict Resolution**: Document coordination issues and solutions
- [ ] **Process Evolution**: Plan for workflow refinements based on usage

---

## Troubleshooting

### Common Issues

#### Permission Problems
- **Symptom**: Cannot create `.instructions/` folders
- **Solution**: Check repository write permissions, ensure agent has access

#### File Conflicts
- **Symptom**: Existing files conflict with migration
- **Solution**: Backup existing files, merge manually, document changes

#### Branch Protection Issues
- **Symptom**: Cannot push to protected branches
- **Solution**: Use feature branches, configure protection to allow workflow branches

#### Template Path Issues
- **Symptom**: Agents cannot find proposal templates
- **Solution**: Verify `.proposals/templates/` path, check file permissions

### Rollback Plan
If migration causes issues:
1. **Backup**: Ensure original repository state is backed up
2. **Remove**: Delete `.instructions/` and `.proposals/` folders
3. **Restore**: Restore original README.md and Makefile
4. **Document**: Record what went wrong for future improvement

---

## Success Criteria

### Technical Validation
- [ ] All agents can read `.instructions/steering.md`
- [ ] Makefile automation works for branch/commit operations
- [ ] Proposal templates are accessible and functional
- [ ] Changelog and task tracking work correctly

### Workflow Validation
- [ ] Agents successfully complete Category 6 (Minor Task) workflow
- [ ] Feature branch creation and management works
- [ ] Multi-agent coordination prevents conflicts
- [ ] Documentation updates integrate smoothly

### Project Integration
- [ ] Existing development workflow unaffected
- [ ] Human developers understand agent presence
- [ ] CI/CD continues to function properly
- [ ] Project-specific commands documented and working

---

## Migration Complete ✅

**Date**: [YYYY-MM-DD]  
**Migrated By**: [Agent Name]  
**Project**: [Project Name/URL]  
**Workflow Version**: v4.0  

**Next Steps**:
1. Begin normal development using the 6-category workflow
2. Create first real proposal for project improvements
3. Test multi-agent coordination on actual features
4. Refine project-specific adaptations as needed

**Contact**: Reference original multi-agentic-ai-starter-template repository for updates and improvements to the workflow system.