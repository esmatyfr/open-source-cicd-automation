# Sources for chatgpt
Alıntılar

medium.com
How to Use CI/CD for Software Development in 2024? | by Tazeen Fatima | Tech Lead Hub | Medium
Continuous Integration (CI):

medium.com
How to Use CI/CD for Software Development in 2024? | by Tazeen Fatima | Tech Lead Hub | Medium
and deployed.

medium.com
How to Use CI/CD for Software Development in 2024? | by Tazeen Fatima | Tech Lead Hub | Medium
CD is an extension of CI, focusing on automating the entire software release process. While CI ensures that the codebase is continuously integrated, CD takes it a step further by automating the delivery of the integrated code to production or staging environments. The goal is to make deployments reliable, repeatable, and low-risk, allowing teams to release new features, updates, and bug fixes at any time with confidence.

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
Conclusion

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
First of all, let’s agree that automation is one of the fundamentals of successful DevOps. One way to achieve it for your projects would be to implement CI/CD pipelines that meet the demands of modern software development. On a side note, many organizations that switched to DevOps had a breakthrough in terms of bridging the gap between development and operations. Now, since CI/CD is a key part of DevOps, let’s break it down!

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
No 1 – Early and frequent commits

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
Break down your CI/CD pipeline into smaller, independent stages that can run in parallel. This speeds up feedback loops. Implement a “fail fast” approach, where faster tests like unit and security scans run early in the pipeline to catch issues immediately, preventing wasted time on longer builds that are destined to fail.

blog.codacy.com
CI/CD Pipeline Security Best Practices
* Integrate Static Application Security Testing (SAST) : A 44 scans an application's source code, byte code, or binaries to identify security vulnerabilities without running your application.

jit.io
7 CI/CD Security Best Practices to Focus on | Jit
# 2. Integrate SAST and SCA into Every Pull Request

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
Build each package only once

medium.com
From 2024 to 2025: Reflecting on CI/CD best practices | by Nixys | Medium
One of the key recommendations is to use multi-stage build of a Docker image. This approach allows you to significantly reduce the size of the final image, as only the necessary code and libraries are included in the final image, while temporary and auxiliary files remain at the build stage.

medium.com
From 2024 to 2025: Reflecting on CI/CD best practices | by Nixys | Medium
2. Build via Kaniko

medium.com
From 2024 to 2025: Reflecting on CI/CD best practices | by Nixys | Medium
3. Tags and protected branches usage in GitLab

medium.com
From 2024 to 2025: Reflecting on CI/CD best practices | by Nixys | Medium
4. Repository creation with CI templates

medium.com
From 2024 to 2025: Reflecting on CI/CD best practices | by Nixys | Medium
5. Flexible rules usage for pipeline triggers

docs.github.com
Building and testing .NET - GitHub Docs
To use a preinstalled version of the .NET Core SDK on a GitHub-hosted runner, use the `setup-dotnet` action. This action finds a specific version of .NET from the tools cache on each runner, and adds the necessary binaries to `PATH`. These changes will persist for the remainder of the job.

docs.github.com
Building and testing Node.js - GitHub Docs
The easiest way to specify a Node.js version is by using the `setup-node` action provided by GitHub. For more information see, setup-node.

gitprotect.io
Exploring Best Practices and Modern Trends in CI/CD - Blog | GitProtect.io
No 9 – Adopt backup and DR practices

blog.codacy.com
CI/CD Pipeline Security Best Practices
* Secure build environments: Use container isolation and network segmentation to protect against unauthorized access and reduce the attack surface.

northflank.com
GitHub Actions vs Jenkins (2026): Which CI/CD tool is right for you? | Blog — Northflank
Groovy (or via UI jobs) Extensibility Reusable Actions from Marketplace (version-pinned, community- maintained)1800+ plugins (powerful but fragile, often outdated or unsupported)

northflank.com
GitHub Actions vs Jenkins (2026): Which CI/CD tool is right for you? | Blog — Northflank
Feature GitHub Actions Jenkins Setup Zero config inside GitHub repos (no separate installation)Manual installation, agent setup, plugin dependencies Hosting GitHub-hosted runners (or BYO self-hosted)Self-hosted by default (cloud/on-prem) Config style YAML workflows inside `.github/workflows ``Jenkinsfile` written in Groovy (or via UI jobs) Extensibility Reusable Actions from Marketplace (version-pinned, community- maintained)1800+ plugins (powerful but fragile, often outdated or unsupported)

dev.to
Jenkins vs. GitHub Actions vs. GitLab CI - DEV Community
* Extensive Plugin Ecosystem: Over 1,800 plugins enable support for almost any CI/CD need. * Flexibility: Highly customizable pipelines, suitable for complex workflows. * Open-Source: No cost for the tool itself; you pay only for hosting infrastructure. * Scalability: Works well in distributed and large-scale environments with multiple build agents.

dev.to
Jenkins vs. GitHub Actions vs. GitLab CI - DEV Community
# Strengths:

docs.github.com
Workflow syntax for GitHub Actions - GitHub Docs
jobs: my-job: name: My Job runs-on: ubuntu-latest steps: - name: Print a greeting env: MY_VAR: Hi there! My name is FIRST_NAME: Mona

dev.to
Jenkins vs. GitHub Actions vs. GitLab CI - DEV Community
Comparison Table

docs.github.com
Workflow syntax for GitHub Actions - GitHub Docs
A job contains a sequence of tasks called `steps`. Steps can run commands, run setup tasks, or run an action in your repository, a public repository, or an action published in a Docker registry. Not all steps run actions, but all actions run as a step. Each step runs in its own process in the runner environment and has access to the workspace and filesystem. Because steps run in their own process, changes to environment variables are not preserved between steps. GitHub provides built-in steps to set up and complete a job.

docs.github.com
Workflow syntax for GitHub Actions - GitHub Docs
jobs.<job_id>.env

blacksmith.sh
Best Practices for Managing Secrets in GitHub Actions | Blacksmith
GitHub provides three distinct levels of secret management:

blacksmith.sh
Best Practices for Managing Secrets in GitHub Actions | Blacksmith
1. Repository Secrets: Repository secrets are specific to a single repository and are available to all workflows within that repository. These are ideal for project-specific credentials like deployment keys or service-specific API tokens. Only repository owners and collaborators with appropriate permissions

blacksmith.sh
Best Practices for Managing Secrets in GitHub Actions | Blacksmith
How secrets work in GitHub Actions

blacksmith.sh
Best Practices for Managing Secrets in GitHub Actions | Blacksmith
Rotate GitHub Actions secrets regularly (30-90 days), use OIDC over long-lived tokens, implement environment-based access controls with approval workflows, avoid hardcoded secrets, and use descriptive naming conventions, or supply chain attackers will own your deployment pipeline.

jit.io
7 CI/CD Security Best Practices to Focus on | Jit
# 1. Scan for Hardcoded Secrets

docs.github.com
Secure use reference - GitHub Docs
# Restricting permissions for tokens

docs.github.com
Secure use reference - GitHub Docs
# Using workflow templates for code scanning

docs.github.com
Secure use reference - GitHub Docs
Using Dependabot version updates to keep actions up to date

docs.github.com
Secure use reference - GitHub Docs
* Pin actions to a full-length commit SHA

docs.github.com
Secure use reference - GitHub Docs
This means that a compromise of a single action within a workflow can be very significant, as that compromised action would have access to all secrets configured on your repository, and may be able to use the `GITHUB_TOKEN` to write to the repository. Consequently, there is significant risk in sourcing actions from third-party repositories on GitHub. For information on some of the steps an attacker could take, see Secure use reference.

docs.github.com
Secure use reference - GitHub Docs
Self-hosted runners for GitHub do not have guarantees around running in ephemeral clean virtual machines, and can be persistently compromised by untrusted code in a workflow.

docs.github.com
Secure use reference - GitHub Docs
systems that automatically destroy the self-hosted runner after each job execution. However, this approach might not be as effective as intended, as there is no way to guarantee that a self-hosted runner only runs one job. Some jobs will use secrets as command-line arguments which can be seen by another job

docs.github.com
Secure use reference - GitHub Docs
When a self-hosted runner is defined at the organization or enterprise level, GitHub can schedule workflows from multiple repositories onto the same runner. Consequently, a security compromise of these environments can result in a wide impact. To help reduce the scope of a compromise, you can create boundaries by

docs.github.com
Secure use reference - GitHub Docs
Using CODEOWNERS to monitor changes

jit.io
7 CI/CD Security Best Practices to Focus on | Jit
one of the most critical choke points in modern software delivery.

jit.io
7 CI/CD Security Best Practices to Focus on | Jit
# 3. Use Dependency Graphs
