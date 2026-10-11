# Visual assets and restoration

## Ownership

Repository code owns the Rojo-mapped script folders. Visual assets are initially place-managed in Studio. Keep map art in `Workspace/Map`, GUI art in `StarterGui/FoodWarsGui`, and private model templates in `ServerStorage/Assets`. These are conventions to use as assets are created, not claims that the folders already exist.

One assigned artist owns each model or screen at a time. The project lead coordinates shared place changes and publishes. Assign named team members in the task list before overlapping work; no artist roles have yet been confirmed.

Reusable models can be exported as `.rbxm` or `.rbxmx` into `assets/` and committed deliberately. Document each asset's creator, source, permission/license, and Roblox asset ID if uploaded. Do not add unreviewed scripts from marketplace models to the game.

## Snapshot routine

Before a substantial map change or release, save a local `.rbxl` place snapshot outside the repository, for example in a team backup folder. Name it with the date and reviewed code commit. Keep a matching entry in the release log. `.rbxl` snapshots are ignored by Git and are not backed up merely by pushing the repository.

The experience owner must choose the shared backup location and access policy. Until a real snapshot is saved and recorded, asset restoration is unverified.

## Restore

1. Stop shared editing and preserve current work before restoring.
2. Open the agreed snapshot as a local copy, leaving the shared place untouched.
3. Check the map, templates, and GUI; compare with the snapshot notes.
4. Connect Rojo using the reviewed code commit and correct project file.
5. Check startup and placement references before publishing to the intended experience.
6. Record the restore and have the lead approve replacement of the shared version.

Cloud place version history is another recovery source. Restoring a shared version while others edit can overwrite work, so coordinate first.
