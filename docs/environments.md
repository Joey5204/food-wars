# Environments

Food Wars uses two separate private Roblox experiences. Code is identical in both;
`src/shared/Environment.luau` decides what is allowed based on the **universe ID**.

> Places in the same experience share DataStores. A second place is NOT isolation.
> Isolation requires a separate experience (universe).

## IDs

Both identities were read from Studio. The owner approved development and requested setup of the open production place (step 2.01).

| Environment | Experience name | Universe ID | Start place ID | Owner (user/group) |
|-------------|-----------------|-------------|----------------|--------------------|
| development | PannPlayzRB's Place | 115957608 | 2336388589 | User 95240076 |
| production  | Production (for players) | 10769611414 | 98518974577739 | User 95240076 |

Universe IDs are not secrets, but never commit API keys, cloud tokens or `.env` files.

How to find the IDs: open the experience on create.roblox.com -> Creations. The universe ID
is in the experience's URL / "Copy Universe ID" menu item, and the place ID is under the
experience's Places tab.

After filling the table, copy both universe IDs into `UNIVERSE_IDS` in
`src/shared/Environment.luau`, commit, and press Play. The Output window should then show
`env development` instead of `env unknown`.

## Rules (step 2.02)

1. **Studio API access: development only.**
   In the development experience: Game Settings -> Security -> turn ON
   "Enable Studio Access to API Services" (needed to test DataStores from Studio).
   In the production experience: leave it OFF.
2. **Never point test code at production data.** Any persistence code must check
   `Environment.canUseProductionData()` before opening a production store, and
   mock/test adapters must refuse to run when `Environment.isProduction()` is true.
3. **Dev-only tools** (test resets, mock storage, debug commands) are gated by
   `Environment.allowsDevTools()`. They must be excluded from production builds.
4. **Unknown universes fail safe.** Any universe not listed above resolves to `unknown`,
   which is allowed neither production data nor dev tools.
5. **Product IDs** (game passes, developer products) are environment-specific server
   configuration. Do not reuse production IDs in development.

## Changing this file

Update the table and `src/shared/Environment.luau` in the same commit.
