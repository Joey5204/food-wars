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

## Gate G2 closeout (owner actions)

Fill the Result column only after the check has actually been done. Do not mark Gate G2 complete until every row passes.

| # | Check | How | Result / date / initials |
| --- | --- | --- | --- |
| 1 | Both experiences are private | create.roblox.com -> each experience -> Settings; confirm not public | PASS — 2026-10-14 — Pann (owner confirmed row 1 finished). |
| 2 | Production Studio API access is off | Production experience -> Game Settings -> Security; "Enable Studio Access to API Services" off | PASS — 2026-10-14 — Pann (owner confirmed row 2 finished). |
| 3 | Production place has no DevTools or DevTests | Open production place; Explorer must have no `ServerScriptService.DevTools` and no `ServerStorage.DevTests`; save and publish the cleaned place | |
| 4 | Fresh checkout verifies | Clone into an empty folder; follow `first-run.md`; `scripts/verify.ps1` prints `OK: verification passed.` | |
| 5 | Dev sync and startup | `rojo serve dev.project.json`; connect Studio to the dev place; Play; Output shows server and client lines with `env development` | PASS — 2026-10-14 — Pann (owner-supplied Output); evidence below. |
| 6 | Two clients join | Studio Test -> Clients and Servers, 2 players, Start; no red errors; startup lines on the server and both clients | PASS — 2026-10-14 — Pann (owner-supplied server and two client outputs; confirmed successful joins in response to the no-red-errors question). |
| 7 | Development-only persistence | Dev DataStore probe passed per the notes above; confirm no writes occurred in production | |
| 8 | Private dev publish tested in the Roblox application (2.08) | Publish; join from the application; F9 console shows `env development`; add a row to `release-log.md` | |
| 9 | Asset owners named and a real place snapshot saved | See `assets.md` | |
| 10 | Section 1 / Gate G1 documents exist | Decision log and game rules exist and are approved, as G2 depends on G1 | |

Gate G2 sign-off: ______________________ date: __________

## Owner-reported development startup — 14 October 2026

Pann supplied the following Studio Output after the development startup instructions. Both server and client report the registered development universe/place and expected versions. The supplied excerpt contains no errors. Codex recorded this evidence without running tests.

```text
00:53:01.373 [FoodWars][Dev] Tools ready; setup tests run only on an approved tester's request — Server — DevMain:40
00:53:01.373 [FoodWars][Server] env development (universe 115957608, place 2336388589) | code 0.1.0 | schema 1 | balance 1 — Server — ServerMain:7
00:53:01.522 [FoodWars][Client] env development (universe 115957608, place 2336388589) | code 0.1.0 | schema 1 | balance 1 — Client — ClientMain:10
```

This excerpt supports closeout row 5 only. The separate two-client evidence below supports row 6. Neither startup test establishes a published application test or a persistence result. Gate G2 sign-off remains pending the other closeout rows.

## Owner-reported two-client startup — 14 October 2026

Pann supplied the server output and separately identified Client 1 and Client 2 output from the requested two-client test:

```text
Server:
00:55:54.727 [FoodWars][Dev] Tools ready; setup tests run only on an approved tester's request — Server — DevMain:40
00:55:54.727 [FoodWars][Server] env development (universe 115957608, place 2336388589) | code 0.1.0 | schema 1 | balance 1 — Server — ServerMain:7
Client 1:
00:56:37.859 [FoodWars][Client] env development (universe 115957608, place 2336388589) | code 0.1.0 | schema 1 | balance 1 — Client — ClientMain:10
Client 2:
00:57:39.818 [FoodWars][Client] env development (universe 115957608, place 2336388589) | code 0.1.0 | schema 1 | balance 1 — Client — ClientMain:10
```

All three startup messages report the expected development environment and versions. The supplied excerpts contain no errors. When asked whether both players joined successfully with no red errors in any window, Pann replied, "yes it joined successfully". Row 6 is recorded as PASS based on that owner confirmation and the supplied startup output. Codex recorded owner-supplied evidence without running tests. Gate G2 sign-off remains pending the other closeout rows.
