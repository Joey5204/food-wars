# Testing instructions for the team

Pann and the team run testing. Codex implements changes and supplies instructions; it does not run tests unless explicitly asked. Testing is deferred at the owner's request. Previously observed results remain historical evidence, not verification of later edits.

## Code checks

From the repository root on Windows:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

Expected final message: `OK: verification passed.` If it fails, send Codex the error output. On macOS/Linux use `bash scripts/verify.sh`.

## Development startup

1. Open the approved development experience (place 2336388589).
2. Run `rojo serve dev.project.json`, using Rokit's executable path if needed.
3. Connect the Studio Rojo plugin to localhost:34872 and accept the intended code changes.
4. Press Play and open Output.
5. Look for server/client lines reporting `env development`, universe 115957608, code 0.1.0, schema 1, and balance 1.
6. Stop. Setup tests no longer run automatically.

## Optional mock tests and reset

While playing development as approved owner user 95240076:

- Send `/fw-test-setup` in chat to run mock isolation, failure recovery, and reset-permission tests. Look for the passing message in Output.
- Send `/fw-reset-mock` to reset your session mock record. It never deletes a real Roblox save.

These commands are restricted to allowlisted users in the configured development universe. Studio's simulated players may use negative IDs, so the chat commands are denied for them. To run just the mock tests in a local server session, execute `require(game.ServerStorage.DevTests.SetupTests).run()` from the server Command Bar. Do not add simulated IDs to the permanent reset allowlist.

## Two players

Use Studio's Server & Clients testing mode, choose two clients, and start. Confirm both clients join and each produces its client startup line with no errors. Stop all clients afterward. This check is deferred; it has not passed yet.

## Published application

Publish the intended reviewed version to the private development place. Join it in the Roblox application as an authorized account. Confirm it loads and record the commit/place version and result in `release-log.md`. A Studio playtest does not replace this check.

## Production preparation

Use `default.project.json` for production, never `dev.project.json`. Confirm `ServerScriptService.DevTools` and `ServerStorage.DevTests` are absent before publishing. Confirm production universe 10769611414 is recognized and Studio API access is off. Do not probe production saves during setup.

## Fresh checkout and recovery

After the setup is committed, clone to a new folder and follow `first-run.md`. Separately save a place snapshot, open a local copy, reconnect the correct reviewed code, and confirm the assets restore as described in `assets.md`. Record these results when performed.
