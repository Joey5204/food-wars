# First run

## Tools

Install Git, Roblox Studio, and Rokit. VS Code is the recommended editor, but is optional.

Official installation references:
- Git: https://git-scm.com/downloads
- Roblox Studio: https://create.roblox.com/docs/studio/setup
- Rokit: https://github.com/rojo-rbx/rokit#installation
- Rojo and Studio plugin: https://rojo.space/docs/v7/getting-started/installation/

The repository pins Rojo 7.7.1, StyLua 2.6.0, and luau-lsp 1.70.1 in `rokit.toml`. The setup computer has Rokit 1.2.0. Do not independently upgrade pinned tools.

## Get the project

Clone https://github.com/Joey5204/food-wars.git into an empty folder and open that folder in your editor. Existing teammates pull the latest reviewed code before starting a task. Preserve unfinished changes before updating.

From the repository root on Windows:

```powershell
& "$env:USERPROFILE\.rokit\bin\rokit.exe" install
& "$env:USERPROFILE\.rokit\bin\rojo.exe" plugin install
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

Restart Studio after plugin installation. The execution-policy override applies only to this invocation, not to the machine's saved policy. The verification command downloads Roblox type definitions for the pinned language tool once, then checks formatting and types. Internet access is needed on its first run.

On macOS/Linux, after installing Rokit:

```sh
rokit install
rojo plugin install
bash scripts/verify.sh
```

## Connect Studio

Use a local test copy or the approved development experience from `environments.md`. Never sync a feature branch into a shared place while another person is syncing a different branch.

For development testing on Windows:

```powershell
& "$env:USERPROFILE\.rokit\bin\rojo.exe" serve dev.project.json
```

Leave the server running. In Studio, open the Rojo plugin and connect to `localhost:34872`. Read the proposed changes before accepting the first sync. This project owns the `Shared`, `Server`, `Client`, `DevTools`, and `DevTests` folders in their mapped services. Do not store artist work inside them.

Confirm `Shared.Environment`, `Shared.Version`, server/client startup scripts, and the development test folders appear. Change a comment in `Version.luau`, confirm that comment changes in Studio, then undo the comment. Edit mapped scripts in the repository, rather than in Studio.

When the team chooses to test, press Play. Output should show server and client startup lines with environment, code, schema, and balance versions. Setup tests run only when explicitly requested; see `testing.md`. Unrecognized published experiences report `unknown`, and development tools refuse to start there.

Stop and start again. Use Studio's local server test with two clients to check both clients start without errors. This is a required manual check; a one-client playtest is not a substitute.

Testing is currently deferred at the owner's request. Codex supplies these instructions and does not execute them unless asked.

## Saving and resetting during setup

The setup mock is in-memory only. It never reads or writes Roblox DataStores and deliberately loses data when the server stops. Gameplay persistence is not implemented yet.

`/fw-reset-mock` clears only the caller's session mock record. It is accepted only in development universe 115957608 and only for user IDs in `dev/DevConfig.luau`. The approved development experience owner, user 95240076, is allowed; no other testers are enabled. It never deletes a live save. Connect future test profiles to this store when the persistence stage is built.

## Production builds

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1 -Environment production
```

The command creates `build` automatically and runs no tests. For a development file, use `-Environment development`. `default.project.json` excludes `dev/` and `tests/` entirely. This output contains code, not the team's full map and artwork. Integrate it with the approved asset snapshot before publishing. A place previously synced with `dev.project.json` may retain development folders; remove them before using it as production.

Record each private development publish in `release-log.md`, and test the published version in the Roblox application. Roblox account settings, audience permissions, and publishing approval must be confirmed by the experience owner.

## Restore artwork

Follow `assets.md`. Start from the selected local place snapshot, verify its experience destination, then reconnect Rojo to restore reviewed code. Stop other editors before restoring a shared place. Do not use an old place snapshot's scripts as the current source of truth.

## Clean checkout test

After these changes are committed, clone into a new folder and follow these instructions from the top. Record the commit, tool check result, one-client and two-client results, and published application result in `section-2-checklist.md`. Until those checks are recorded, the section gate remains pending.
