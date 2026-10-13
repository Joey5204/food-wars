# Release log

No development or production publish has been verified during this setup.

For every publish record:

| Date | Environment | Universe / place | Git commit | Roblox place version | Schema | Balance | Tester and result |
| --- | --- | --- | --- | --- | --- | --- | --- |

Record unpublished local checks in `section-2-checklist.md`, not as releases. Include the asset snapshot reference when artwork changes. Verify the destination and get the lead's approval before publishing.

## First development publish (step 2.08): row to add after it happens

Do not add this row until the publish and Roblox application test have actually been done.
Values already known are filled in; replace every `<...>`.

```
| <YYYY-MM-DD> | development | 115957608 / 2336388589 | <git rev-parse --short HEAD, run immediately before publishing> | <version number from create.roblox.com -> experience -> Version History> | 1 | 1 | <name>: joined from the Roblox application; F9 console showed server and client lines with "env development" and code 0.1.0 - <pass/fail> |
```

Notes:
- Commit and push first, so the hash in the log matches what was published.
- If the Version module changes later, update the schema and balance columns to match.
- A production publish gets its own row, with universe 10769611414 / place 98518974577739.
