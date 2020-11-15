---
title: System overview
category: Introduction
layout: doc
order: 100
toc: true
---

The system consists of the following components:

| Component         | Techs          | Run Mode    |  Env      |    Description                         |
|-------------------|----------------|-------------|-----------|----------------------------------------|
|Web app: users     | React<br>Redux | CSR         | All       |Web application for a subscriber to manage his subscription details. |
|Web app: admins    | React<br>Redux | CSR         | All       | Web application for admins to manage subscribers and locations. Mostly based on CRUD. |
|Backend (API)      | Ruby on Rails  | Docker      | All       | Ruby on Rails API-only application. |
|Database           | PostgreSQL + POSTGIS | -     | All       | Database |
|Database provider  | AWS RDS        | SaaS        | Prod      | Database service on AWS. Used only in production. |
|AWS Cognito        | AWS Cognito | SaaS           | All       | Uses 2 pools separately for admins and subscribers. Authentication service. |
|Web server         | NGINX       | -              | Prod      | |
|SSL                | Let's Encrypt | -            | Prod      | |

![System overview](/assets/images/system_overview.png)
