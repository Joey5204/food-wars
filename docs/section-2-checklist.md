# Section 2 setup evidence

This file distinguishes implemented setup from verified account configuration and release checks.

The owner has deferred testing. Codex must not execute tests or checks unless asked; instructions are in `testing.md`. Earlier results below are historical and do not verify subsequent edits. Implementation is not the same as passing Gate G2.

| Step | Evidence / remaining check |
| --- | --- |
| 2.01 | Development: universe 115957608 / place 2336388589. Production: universe 10769611414 / place 98518974577739. Both registered with owner user 95240076. |
| 2.02 | After the owner enabled Studio API access, a development-only DataStore write, uncached read, and cleanup passed. Production API settings and experience privacy remain unverified. Real gameplay persistence is not implemented. |
| 2.03 | Source, asset, test, and documentation folders exist. Generated build/QA files ignored; asset policy documented. |
| 2.04 | Tools pinned in rokit.toml; installed executables detected. Wally is unnecessary until a dependency is selected. |
| 2.05 | Default production mapping and separate development test mapping exist. Asset ownership/restoration documented; actual backup and named asset owners pending. |
| 2.06 | Passed: temporary repository comment appeared in Studio's Version module through live sync, then was restored. |
| 2.07 | Formatting, development sourcemap, and strict type checks passed on 12 October 2026. Server/client startup correctly printed development environment and versions. Windows Unicode-path workaround and Git line-ending policy added. |
| 2.08 | Release log created. Private publish and Roblox application playtest pending. |
| 2.09 | Mock storage, failure injection, reset permission tests, and dev-only mock reset command implemented. Development owner 95240076 allowlisted; no other users enabled. Setup tests are now opt-in via /fw-test-setup. Excluded from default production build. |
| 2.10 | first-run.md created. Fresh checkout, asset restoration, and two-client checks pending. |

## Verification results

On 12 October 2026:

- Pinned local verification passed for src, dev, and tests.
- Verification also passed in an isolated copy of the completed setup, using cached pinned type definitions. This is a setup rehearsal, not a fresh Git checkout of uncommitted changes.
- Both development and production Rojo builds succeeded.
- Built XML verified that development test/reset modules are present in development and absent from production.
- Development universe and owner read from Studio; owner approved its use as development.
- Rojo development server started on localhost:34872.
- Studio subsequently had no place open, preventing runtime and sync checks.
- After the owner reconnected, live file sync passed and two successive one-player starts produced the expected server/client startup messages and passing mock/reset tests.
- Development-only DataStore probe failed before writing: Studio API access is disabled (403). No probe data was written. Two-client startup has not been tested.
- After API access was enabled, the repeated development-only probe passed: temporary record written, read with cache disabled, and removed successfully in FoodWars_SetupChecks_v1 / development. Only one client was present; two-client startup remains pending.
- Production IDs registered from the open place. Development sync server stopped; production mapping server started instead.
- Removed ServerScriptService.DevTools and ServerStorage.DevTests from the open production edit session, retaining detached objects in memory for undo. This cleanup has not been saved/published to Roblox.
- Automatic setup tests disabled and instructions supplied for owner-run testing. These later edits were not tested at the owner's request.

Remaining handover actions: commit/push when requested, save/publish the reviewed Studio changes, keep production Studio API access off, choose named asset owners, and save a real place snapshot. Fresh checkout, two-client, snapshot restoration, and application playtests are deferred to the team. Experience privacy and production API settings are unverified. Never mark Gate G2 complete solely because code exists.

Gate G2 requires a clean checkout, successful startup with environment and version, development-only persistence, and two clients joining without bootstrap errors. Mock-only checks do not prove durable development saving.
