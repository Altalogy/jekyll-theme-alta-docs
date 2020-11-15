## Planning - Step by step


### 1. Create Jekyll project

See more in Readme.md

1. Create a new Jekyll project
2. Switch to `jekyll-theme-alta-docs`


### 2. Basic setup

1. [Set up project's meta](02_projects_meta.md)
2. [Add the project overview](0901_project_overview.md)
3. [How to share documentation](03_how_to_share_documentation.md)


### 3. Project analysis

Add initial project's requirements, recommendations, preferences and constraints (mostly delivered by client), and then compose Epics & user stories.

1. [Requirements & recommendations](04_requirements_and_recommendations.md)
2. [Epics & User stories](05_epics_and_user_stories.md)


### 4. System

Create a folder: `_docs/0600_system`. Then continue with the following steps:

1. (Optional) [Project introduction](07_project_introduction.md)
2. [Techstack](08_techstack.md)
3. [Architecture](09_architecture.md)
4. [Infrastructure](10_infrastructure.md)
5. [Wireframes](11_wireframes.md)
6. [Add system overview to intro](12_add_system_overview_to_intro.md)
5. [Guidelines](13_add_guidelines.md)
6. [Development](14_add_development_instructions.md)
7. [Deployment](15_add_deployment_instructions.md)


### 5. Design

1. [How to add design](16_how_to_add_design.md)


### 5. Features

1. [How to add features](17_how_to_add_features.md)

### 6. Challenges

1. [How to add challenges](18_how_to_add_challenges.md)

### 7. Estimations

1. [Add Estimations & roadmap](19_add_estimations_and_roadmap.md)

### 8. Materials

1. [Add materials](20_add_materials.md)


### 9. Development setup

1. Convert features to the tasks.
2. Organize team kick-off before development


### 10. Manual

Add manual for the users (client) how to use application.
The recommended way is to do that along with developing features.
So the manual can be one of the acceptance/done criteria for the feature.
Manual can be located in `_docs/7000_manual/*` directory.


## Update docs in development

Documentation should be updated along with development, but the effort should be minimized.

1. Update any doc, especially features if documentation is different than development results.
2. Update the feature status.
3. Change the documentation version or feature version.
4. Update manual after feature development, if necessary.


## Recommended planning flow

1. [Recommended planning process](21_recommended_planning_process.md)
