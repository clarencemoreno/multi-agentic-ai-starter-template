# Unified Coding Workflow Proposal

**Status**: Proposed
**Type**: Major Process Enhancement
**Reviewers Required**: Claude, ChatGPT, Gemini
**Review Deadline**: 2025-09-12T00:00:00Z

**Supersedes**: 
- Extended Coding Workflow Proposal (Gemini)
- Granular Task Breakdown Process Proposal (Claude)

## Problem Statement

Our current workflow has two critical gaps:

1. **Technical Design Gap**: No structured approach for technical planning before coding begins
2. **Task Coordination Gap**: High-level tasks are too coarse for effective multi-agent coordination

Existing proposals address these individually, but a unified approach would create a more powerful and cohesive coding workflow.

## Proposed Solution: Integrated 5-Phase Coding Workflow

### Phase 1: Concept Proposal (The "What" and "Why")
**Goal**: Establish business value and high-level scope

**Process**:
1. Create feature proposal in `.proposals/feature-[name]-proposal.md`
2. Include: problem statement, user value, success criteria
3. Multi-agent approval vote
4. **Output**: Approved feature concept

**Example**: "User Authentication System - Enable secure user registration and login"

### Phase 2: Technical Design (The "How")
**Goal**: Create comprehensive technical blueprint

**Process**:
1. Update approved proposal with "Technical Design" section
2. **Required Components**:
   - **System Architecture**: Component diagrams and data flow
   - **API Contracts**: Detailed endpoint specifications
   - **Data Models**: Database schemas and relationships  
   - **File Manifest**: New files to create, existing files to modify
   - **Testing Strategy**: Unit, integration, and E2E test requirements
   - **Dependency Analysis**: External libraries, services, infrastructure
   - **Performance Considerations**: Scalability and optimization requirements

3. Multi-agent technical review and approval
4. **Output**: Approved technical design document

### Phase 3: Task Breakdown (The "When" and "Who")
**Goal**: Decompose design into coordinated implementation tasks

**Process**:
1. Create implementation task breakdown using **3-tier structure**:

**Tier 1: Feature Task**
```markdown
- [ ] **F001**: User Authentication System (approved design)
```

**Tier 2: Implementation Tasks**
```markdown
- [ ] **F001-A**: Set up database schema and user model
- [ ] **F001-B**: Implement JWT token service and middleware
- [ ] **F001-C**: Build authentication API endpoints  
- [ ] **F001-D**: Create password reset functionality
- [ ] **F001-E**: Add frontend login/register components
- [ ] **F001-F**: Implement route protection system
- [ ] **F001-G**: Write comprehensive test suite
```

**Tier 3: Micro-Tasks (optional)**
```markdown
- [ ] **F001-A1**: Create User model with validation
- [ ] **F001-A2**: Set up migration scripts
- [ ] **F001-A3**: Add password hashing utilities
```

2. Each implementation task includes:
   - **Scope**: Specific deliverables and boundaries
   - **Dependencies**: Prerequisites from other tasks
   - **Acceptance Criteria**: Definition of done
   - **Time Estimate**: Expected effort level
   - **Files Affected**: Direct reference to technical design manifest

3. Add tasks to `.instructions/tasks.md` with enhanced structure
4. **Output**: Ready-to-claim implementation tasks

### Phase 4: Implementation (The "Build")
**Goal**: Execute coordinated parallel development

**Process**:
1. Create feature branch: `feature/F001-user-authentication`
2. Agents claim specific implementation tasks (F001-A, F001-B, etc.)
3. Implement according to approved technical design
4. Update `.instructions/tasks.md` with progress tracking
5. Cross-reference commits with task IDs and design sections
6. **Output**: Complete feature implementation with tests

### Phase 5: Integration & Review (The "Ship")
**Goal**: Quality assurance and deployment

**Process**:
1. Create Pull Request with comprehensive description:
   - Links to original proposal and technical design
   - Task completion checklist
   - Test coverage report
   - Performance impact assessment

2. **Multi-layer Review**:
   - **Design Conformance**: Does code match approved technical design?
   - **Task Completion**: Are all implementation tasks fulfilled?
   - **Code Quality**: Style, patterns, maintainability
   - **Test Coverage**: Unit, integration, E2E tests passing

3. Agent approval and merge to main
4. Update feature status and close related tasks
5. **Output**: Deployed feature ready for users

## Enhanced Task Management Structure

### Updated `.instructions/tasks.md` Format

```markdown
# Project Task List

## Feature Pipeline

### Phase 1: Concept Proposals
- [ ] **P010**: Payment Processing Integration (In Review)
- [ ] **P011**: Real-time Notifications System (Proposed)

### Phase 2: Technical Design
- [ ] **F009**: Dashboard Analytics (Design in Progress)

### Phase 3: Ready for Implementation  
- [ ] **F008**: Shopping Cart System (6 tasks ready)

## Active Implementation

### F001 - User Authentication System
**Status**: 4/7 tasks completed | **Branch**: feature/F001-user-authentication
- [x] **F001-A**: Database schema and user model (Completed: 2025-09-10T14:30:00Z by Claude)
- [x] **F001-B**: JWT token service and middleware (Completed: 2025-09-10T16:45:00Z by Gemini)
- [x] **F001-C**: Authentication API endpoints (Completed: 2025-09-11T09:15:00Z by ChatGPT)  
- [ ] **F001-D**: Password reset functionality (In Progress: Claude)
- [ ] **F001-E**: Frontend login/register components
- [ ] **F001-F**: Route protection system  
- [ ] **F001-G**: Comprehensive test suite

### F007 - Email Notification Service
**Status**: 2/4 tasks completed | **Branch**: feature/F007-email-notifications
- [x] **F007-A**: Email template system (Completed: 2025-09-09T11:20:00Z by ChatGPT)
- [x] **F007-B**: SMTP service integration (Completed: 2025-09-10T08:30:00Z by Gemini)
- [ ] **F007-C**: Queue management for bulk emails (In Progress: Claude)
- [ ] **F007-D**: Email analytics and tracking

## Completed Features
- [x] **F000**: Project Setup and Configuration (Completed: 2025-09-09T16:20:00Z)
- [x] **F005**: User Profile Management (Completed: 2025-09-08T14:15:00Z)
```

## Proposal Template Integration

### New Template: `coding-feature-proposal-template.md`

```markdown
# [Feature Name] Proposal

**Status**: Proposed
**Type**: Feature Implementation
**Priority**: [High/Medium/Low]
**Complexity**: [Small/Medium/Large]

## Phase 1: Concept Proposal

### Problem Statement
[What problem does this solve?]

### User Value  
[How does this benefit users?]

### Success Criteria
[How will we measure success?]

---

## Phase 2: Technical Design
*(To be completed after Phase 1 approval)*

### System Architecture
[Component diagrams and interaction flows]

### API Contracts
[Detailed endpoint specifications]

### Data Models
[Database schemas and relationships]

### File Manifest
[Files to create/modify with brief descriptions]

### Testing Strategy
[Unit, integration, E2E test requirements]

### Performance Considerations
[Scalability and optimization requirements]

---

## Phase 3: Task Breakdown
*(To be completed after Phase 2 approval)*

### Feature Task
- [ ] **F[XXX]**: [Feature Name] ([reference to this proposal])

### Implementation Tasks
[Generated from technical design]

### Dependencies
[Task prerequisites and ordering]

---

## Voting Format
[Standard multi-agent voting structure]
```

## Benefits of Unified Approach

### 1. **Comprehensive Planning**
- Technical rigor prevents architectural mistakes
- Task breakdown enables parallel execution  
- Clear handoff points between phases

### 2. **Enhanced Coordination**
- Multiple agents work on different implementation tasks
- Dependencies explicitly managed
- Progress visible at granular level

### 3. **Quality Assurance**
- Design review before implementation
- Task-level acceptance criteria
- Multi-layer code review process

### 4. **Scalability**
- Supports both simple features (few tasks) and complex systems (many tasks)
- Phase gates prevent scope creep
- Template-driven consistency

### 5. **Traceability**
- Clear path from user need → technical design → tasks → code → deployment
- All decisions documented and reviewable
- Integration with existing `.instructions/` workflow

## Workflow Integration

### Updated `.instructions/steering.md` Process

**Step 1 (Sync Context)**: Read feature pipeline, active implementation tasks, and technical designs
**Step 2 (Claim Task)**: Can claim feature concepts, design work, or implementation tasks  
**Step 3 (Execute)**: Follow phase-appropriate guidelines (proposal writing, technical design, coding)
**Step 4 (Log Work)**: Reference feature IDs, task IDs, and design sections
**Step 5 (Complete)**: Update phase status and hand off to next phase or mark feature complete

### Multi-Agent Coordination Patterns

1. **Sequential Phases**: Different agents can own different phases
2. **Parallel Implementation**: Multiple agents work on same feature's implementation tasks
3. **Specialized Roles**: Agents can focus on design vs. implementation vs. review
4. **Cross-Pollination**: Agents can contribute across phases for knowledge sharing

## Migration Strategy

### Phase 1: Template Creation (Week 1)
- Create `coding-feature-proposal-template.md`
- Update `.instructions/steering.md` with new workflow
- Document integration points with existing proposal system

### Phase 2: Pilot Features (Week 2-3)
- Apply unified workflow to 2-3 new features
- Refine templates based on experience  
- Train agents on new process

### Phase 3: Full Adoption (Week 4)
- Convert existing high-level tasks to new format
- Deprecate old proposal patterns for coding
- Optimize based on lessons learned

## Example: Complete Feature Lifecycle

### User Authentication System Example

**Phase 1 Proposal**:
```markdown
## Problem Statement
Users need secure authentication to access personalized features and protect their data.

## User Value
- Secure account creation and login
- Password reset capability  
- Role-based access control
```

**Phase 2 Technical Design**:
```markdown
## System Architecture
- User model with encrypted passwords
- JWT-based session management
- Middleware for route protection

## API Contracts
- POST /api/auth/register
- POST /api/auth/login
- POST /api/auth/logout
- GET /api/auth/me

## File Manifest
- `models/User.js` (create)
- `services/AuthService.js` (create)
- `middleware/authMiddleware.js` (create)
- `routes/auth.js` (create)
```

**Phase 3 Task Breakdown**:
```markdown
- [ ] **F001-A**: Set up User model and database schema
- [ ] **F001-B**: Implement JWT service and auth middleware
- [ ] **F001-C**: Build authentication API endpoints
- [ ] **F001-D**: Add password reset functionality
- [ ] **F001-E**: Create frontend login components
- [ ] **F001-F**: Implement route protection
- [ ] **F001-G**: Write comprehensive test suite
```

**Phase 4 Implementation**: Agents claim and complete tasks in parallel
**Phase 5 Review**: Code review against technical design and merge

## Success Metrics

- **Coordination Efficiency**: 70% reduction in task conflicts
- **Development Velocity**: 50% faster feature completion through parallel work
- **Code Quality**: 90% of features pass review on first attempt
- **Agent Satisfaction**: Clear, actionable tasks improve workflow experience

## Compatibility Assessment

### Strengths Leveraged
- **From Gemini's Proposal**: Technical design rigor, quality gates, unified process
- **From Claude's Proposal**: Granular coordination, parallel execution, progress tracking
- **From Existing System**: Multi-agent approval, proposal-driven development

### Risk Mitigation
- **Complexity Concern**: Templates and examples reduce learning curve
- **Overhead Concern**: Phases can be collapsed for simple features
- **Coordination Concern**: Explicit dependencies and handoffs prevent confusion

---

## Strong Objections & Concerns

### 1. **Potential Over-Engineering**
**Concern**: 5-phase process may be excessive for simple features
**Mitigation**: Allow phase compression (e.g., simple features can combine phases 1-2)
**Residual Risk**: Teams may default to full process even when unnecessary

### 2. **Increased Upfront Time Investment**  
**Concern**: Technical design phase adds significant time before any code is written
**Mitigation**: Front-loaded planning prevents costly refactoring and rework
**Residual Risk**: May discourage rapid prototyping and experimentation

### 3. **Agent Specialization vs. Generalization**
**Concern**: Complex workflow may lead to agents specializing in specific phases
**Mitigation**: Encourage cross-phase participation and knowledge sharing
**Residual Risk**: Could reduce overall team flexibility and learning

### 4. **Template Proliferation**
**Concern**: Multiple templates and formats may become unwieldy
**Mitigation**: Start with single comprehensive template, evolve based on usage
**Residual Risk**: Documentation overhead may offset productivity gains

### 5. **Handoff Coordination Complexity**
**Concern**: 5 phases create 4 handoff points where coordination can break down
**Mitigation**: Clear phase completion criteria and automated handoff triggers
**Residual Risk**: Multi-agent handoffs remain inherently challenging

### 6. **Scope Creep in Technical Design**
**Concern**: Detailed technical design phase may encourage over-specification
**Mitigation**: Focus on essential architecture, allow implementation flexibility
**Residual Risk**: Analysis paralysis during design phase

**Overall Assessment**: Despite these concerns, the benefits of structured coordination and quality gates outweigh the risks for complex multi-agent development scenarios.