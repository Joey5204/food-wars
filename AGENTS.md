# Food Wars project instructions

## Sync at the start of a chat

Before beginning repository work in a new chat:

1. Inspect the working directory, Git status, current branch, and remotes.
2. Confirm origin is https://github.com/Joey5204/food-wars.git (or its equivalent SSH URL).
3. Fetch origin to check for team updates. Use the normal permission process if network or protected Git access requires escalation.
4. If the working tree is clean and the current branch has an upstream, run git pull --ff-only to incorporate that branch's updates.
5. If there are local changes, no upstream, or diverged history, preserve all work and report the situation. Do not automatically stash, reset, discard changes, switch branches, or resolve conflicts just to sync.
6. If fetching fails, report that the latest GitHub state could not be verified; do not claim the checkout is current.

This is a startup check, not a background sync service. Do not repeatedly pull while implementing a task. Do not commit or push unless the user requests it.

## Roblox workflow

Treat repository scripts as the source of truth for Rojo-managed code. Keep development testing separate from the shared place when branches differ. Read default.project.json and rokit.toml before changing mappings or tool versions.

## Testing preference

The user handles testing. Do not run tests, playtests, verification scripts, formatting checks, type checks, or persistence probes unless the user explicitly asks to run them. Provide concise testing instructions with each change instead. Do not claim that untested changes passed checks. Do not automatically run setup tests at server startup. Reading files and checking the target experience before editing are still allowed.
