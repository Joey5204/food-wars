# Food Wars Team Build Manual

## What we are building

Food Wars is a Roblox game where players build a food-themed home base, collect resources, improve their buildings and cards, and raid other bases. This manual is our practical workflow: finish a small playable stage, test it, then move on.

Our first goal is a working home base. Our next goal is one enjoyable raid against a computer-controlled base. Raids against saved player bases come after those foundations work.

This workflow is a proposed working plan. The team can change gameplay choices as we test. Use the technical manual as background when needed; this document is the team's everyday guide.

## Who does what

| Owner | Responsibilities |
| --- | --- |
| Pann or the nominated project lead | Choose priorities, settle gameplay decisions, approve completed stages, and authorize releases. |
| Team members | Design food characters, buildings, maps, menus, sounds, and effects; playtest and report problems. Assign one owner to each task. |
| Codex | Prepare and maintain code, implement game systems, connect artwork to gameplay, run available checks, investigate bugs, and explain decisions that need team input. |

Codex can also help make placeholder models and interface drafts. The team chooses the final look and feel. Account sign-ins and platform approvals may still need the account owner.

## How we work each session

1. Choose one small task with a clear outcome.
2. Check the latest shared project before starting.
3. Agree who owns the task and which scripts, models, or screens it affects.
4. Build and test it. Use simple placeholder artwork when final artwork is not ready.
5. Review the result together. Record problems and any gameplay choices we changed.
6. Ask Codex to commit and push the finished changes when ready.
7. Update the checklist and choose the next task.

Give Codex a request like: "Build farm placement. Players should be able to preview a farm, rotate it, confirm placement, and cancel. Make sure they cannot overlap buildings or edit someone else's plot."

When reporting a bug, include what you did, what you expected, and what happened. A screenshot or short video helps when the problem is visual.

## Stage 1 Get the team ready

**Goal:** Everyone can open the project and test the same starting game.

- [ ] Choose the owner of the Roblox experience and who is allowed to publish releases.
- [ ] Give team members access to the shared GitHub repository and Roblox experience as needed.
- [ ] Finish connecting repository scripts to Roblox Studio.
- [ ] Confirm the game starts without errors and two test players can join.
- [ ] Agree where models, maps, and interface artwork are edited and backed up.
- [ ] Keep development testing separate from the eventual live game.
- [ ] Start a short shared task list and decision log.

**Team decides:** Who owns gameplay, artwork, testing, and releases. People may cover more than one role.

**Codex handles:** Code setup, startup checks, and instructions for running the project.

**Ready to move on when:** Everyone knows how to open and test the project, and one small code change appears correctly in Studio.

## Stage 2 Agree on the first version

**Goal:** Know what a player does and what we are building first.

- [ ] Write a short description of the main loop: build, collect, improve, raid, and return home.
- [ ] Choose how attackers move and how players deploy them.
- [ ] Choose how a raid is won, lost, or ended by the timer.
- [ ] Choose starting buildings, resources, and beginner protection.
- [ ] Decide what players can lose during a raid.
- [ ] Choose a simple visual direction and names for the first buildings and food characters.
- [ ] Record agreed choices and mark undecided choices clearly.

**Suggested starting scope:** One Core, one farm, one attacker, one tower, and one computer-controlled enemy base. Expand the roster after the loop is enjoyable.

**Suggested combat choice to review:** Attackers follow a fixed path, players control deployment timing, and towers attack passing units. This remains a proposal until the team agrees.

**Team decides:** The rules and the kind of experience players should have.

**Codex handles:** Explaining the practical tradeoffs and turning agreed rules into working behavior.

**Ready to move on when:** We can explain a complete play session, including a win, a loss, a timeout, and a player leaving halfway through.

## Stage 3 Give every player a home

**Goal:** Each player joins and receives their own usable plot.

- [ ] Create a simple home area and placeholder plots.
- [ ] Give joining players an available plot.
- [ ] Place a starter Food Core on each player's plot.
- [ ] Set up a comfortable home camera and basic movement or navigation.
- [ ] Show a simple home screen with the player's coins and basic buttons.
- [ ] Make sure players cannot change another player's base.

**Team work:** Design the rough plot layout and choose the intended camera feel.

**Codex handles:** Plot assignment, ownership, startup behavior, and camera controls.

**Test:** Join with two players, confirm different plots, leave, and confirm the freed plot can be used again.

**Ready to move on when:** Two players can use separate bases without interfering with each other.

## Stage 4 Make the home base useful

**Goal:** Players can place a farm, earn coins, and upgrade something.

- [ ] Add building selection, preview, rotation, confirmation, and cancellation.
- [ ] Reject overlapping buildings and placement outside the plot.
- [ ] Make one farm produce coins.
- [ ] Let players collect the farm's coins.
- [ ] Add one timed building upgrade with a visible cost and timer.
- [ ] Show clear messages when an action is unavailable or too expensive.
- [ ] Save buildings, coins, and upgrade progress.
- [ ] Restore progress correctly when a player returns, including time spent offline.

**Team work:** Choose building appearance, prices, production speed, and clear button labels. Begin with provisional values.

**Codex handles:** Placement, resource production, upgrades, saving, and recovery from interrupted actions.

**Test:** Place, collect, upgrade, leave, and rejoin. Try repeated clicks, full storage, and insufficient coins.

**Ready to move on when:** The complete home loop works and progress survives rejoining without duplicated or missing rewards.

## Stage 5 Build one enjoyable raid

**Goal:** A player can fight a computer-controlled base and return home with a clear result.

- [ ] Build one enemy base with a valid route and a Food Core.
- [ ] Add one attacker and one defensive tower.
- [ ] Let the player deploy attackers using a simple raid interface.
- [ ] Add movement, attacks, health displays, and a raid timer.
- [ ] Show win, loss, and reward results.
- [ ] Return the player safely to their home base.
- [ ] Make interrupted raids end or recover consistently.

**Team work:** Playtest whether raids are understandable and fun. Adjust pacing before adding many characters.

**Codex handles:** Combat behavior, deployment rules, results, rewards, and reconnect handling.

**Test:** Win, lose, run out of time, deploy everything, and disconnect during a raid. Confirm rewards happen only once.

**Ready to move on when:** The full raid loop works reliably and the team wants to play it again.

## Stage 6 Add cards and progression

**Goal:** Players have useful choices and reasons to keep playing.

- [ ] Add a card collection and a small attack deck.
- [ ] Add a few attackers and defenses with distinct roles.
- [ ] Add card upgrades using duplicates and coins, with Core-based limits.
- [ ] Add one gameplay-earned pack type and a clear reward reveal.
- [ ] Save card ownership, upgrades, deck choices, and pack results.
- [ ] Expand toward the launch roster only after each new character is tested.
- [ ] Add the remaining planned economic buildings when their purpose is clear.

**Team work:** Choose character identities, strengths, weaknesses, descriptions, and artwork.

**Codex handles:** Collection, decks, upgrades, earned packs, reward rules, and saving.

**Test:** Open a pack, upgrade a card, change a deck, and rejoin. Try repeating actions and disconnecting during a pack opening.

**Ready to move on when:** Players can understand their choices, and every available card has a useful, tested role.

## Stage 7 Raid saved player bases

**Goal:** Players can raid a saved version of another player's base, including while its owner is offline.

- [ ] Let players prepare and publish a valid defense layout.
- [ ] Offer suitable saved bases as raid targets.
- [ ] Run the raid against a separate copy of the defender's base.
- [ ] Apply agreed loot, rating, and protection rules.
- [ ] Keep the player's real home structures safe from permanent raid damage under the proposed rules.
- [ ] Give defenders a readable report when they return.
- [ ] Handle disconnects and simultaneous raids without duplicate rewards or losses.

**Team work:** Decide fair target selection, beginner protection, loot limits, and report wording.

**Codex handles:** Saved defense copies, matchmaking, raid results, rewards, shields, and recovery.

**Test:** Raid an offline player, raid an outdated saved layout, and interrupt a raid. Confirm both players' final balances and reports are correct.

**Ready to move on when:** Raids feel fair and both players' progress remains correct through interruptions.

## Stage 8 Make the game easy to learn and use

**Goal:** A new player can complete the main loop without a teammate explaining it.

- [ ] Add a short tutorial: place, collect, upgrade, choose cards, and raid.
- [ ] Add clear progress goals and rating leagues.
- [ ] Add agreed event bonuses without making them mandatory to raid.
- [ ] Replace the most visible placeholder artwork.
- [ ] Add essential sounds, effects, and readable menus.
- [ ] Test touch controls and small screens.
- [ ] Fix confusing instructions, slow interactions, and unclear errors.

**Team work:** Watch new testers play before giving hints. Record where they get stuck.

**Codex handles:** Tutorial behavior, progression, interface integration, and technical fixes.

**Ready to move on when:** A new tester completes the main loop independently and understands what to do next.

## Stage 9 Prepare a small release

**Goal:** Release a stable version to a limited audience and learn from real play.

- [ ] Confirm what is included in the first release.
- [ ] Test saving, purchases if included, rewards, raids, and reconnects carefully.
- [ ] Check performance with several players and on a lower-powered device.
- [ ] Fix problems that lose progress, duplicate rewards, block play, or crash the game.
- [ ] Prepare the game name, description, icon, and screenshots.
- [ ] Prepare a backup and a plan for restoring a working version.
- [ ] Get the project lead's approval before publishing.
- [ ] Invite a small test audience and collect feedback.

**Team work:** Approve the release, organize testers, and prioritize feedback.

**Codex handles:** Technical checks, bug fixes, release preparation, and implementation of approved changes.

**Ready to expand when:** The game runs reliably, progress is safe, and testers understand and enjoy the core loop.

## Features to schedule separately

Purchases and trading need their own design and testing stages before inclusion. Start with earned rewards; add purchases after the basic economy is stable. Trading can wait until after the first release.

Clans, wars, seasons, subscriptions, detailed replays, mastery cosmetics, and extra social systems are later projects. Add them when the released game and player feedback justify the work.

## Definition of a finished task

- [ ] The agreed behavior works in the game.
- [ ] Relevant failure cases and multiplayer behavior have been checked.
- [ ] A teammate has reviewed or playtested the result.
- [ ] Players receive understandable feedback.
- [ ] Any changed gameplay decision is recorded.
- [ ] The work is saved and, when requested, committed and pushed.

## Our immediate next task

Confirm the Studio sync and two-player startup, then settle the minimum rules from Stage 2. After that, build Stage 3: each joining player gets their own plot and starter Core.

The repository currently contains startup scripts and a shared version module. That establishes a starting point; it does not yet prove that gameplay, saving, or combat are complete.
