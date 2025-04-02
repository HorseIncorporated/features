# Coder DevContainer Feature

This Feature installs Aider and configures optional firewalling and environment variables for AI coding agents.

## Using in your devcontainer

After publishing to GHCR, add something like this to your `.devcontainer/devcontainer.json`:

```json
{
  "image": "mcr.microsoft.com/devcontainers/python:3.11-bullseye",
  "features": {
    "ghcr.io/HorseIncorporated/features/coder:1": {
       "OPENAI_API_KEY": "${{ env.OPENAI_API_KEY }}",
       "ANTHROPIC_API_KEY": "${{ env.ANTHROPIC_API_KEY }}",
       "FIREWALL_ENABLED": "${{ env.FIREWALL_ENABLED }}"
    }
  }
}

Usage guide

# 1. Create/Start the container
devcontainer up --workspace-folder .

# 2. Run Claude Code commands inside your container
devcontainer exec --workspace-folder . \
  "claude -p \"add a duck and your github username to README.md. commit to a new branch and create a pull request.\" --dangerously-skip-permissions"

Note:
	•	If FIREWALL_ENABLED is set to true, you will only be able to access certain allowed domains (GitHub, npm registry, etc.).
	•	Don’t forget to mark the GitHub Container Registry package as public if you want others to use this Feature.

---

## Next Steps Reminder

1. **Push** all of these files to your new `HorseIncorporated/features` repository on GitHub.
2. **Make the GHCR images public** so that your devcontainer can pull them without auth (if desired).
3. **Add** a reference to this new Feature in your `HorseIncorporated/workspace` repo’s `devcontainer.json` (as shown in the sample snippet above).
4. **Run** or watch your GitHub Actions for:
   - `issue-hello.yml`: triggers on new issues.
   - `publish-feature.yml`: runs on push to `main` to build/publish the Feature.
5. **Optionally**: Turn on additional shell or code linting (e.g. `shellcheck`) by uncommenting lines in the scripts as you see fit.
