--!strict
-- Identifies which experience (universe) this code is running in.
--
-- Fill in the universe IDs below after creating the two experiences
-- (see docs/environments.md). Use the UNIVERSE ID (game.GameId), not a place ID:
-- places in the same experience share DataStores, so a place ID cannot isolate data.
--
-- Anything that is not recognised is treated as "unknown", which is NOT allowed
-- to touch production data. That makes a missing or mistyped ID fail safe.

export type EnvironmentName = "local" | "development" | "production" | "unknown"

local UNIVERSE_IDS = {
	development = 115957608, -- PannPlayzRB's Place, approved development experience
	production = 10769611414, -- Production (for players)
}

local Environment = {}

function Environment.getUniverseId(): number
	return game.GameId
end

function Environment.getPlaceId(): number
	return game.PlaceId
end

function Environment.get(): EnvironmentName
	local universeId = game.GameId
	-- An unpublished place has GameId 0.
	if universeId == 0 then
		return "local"
	end
	if UNIVERSE_IDS.development ~= 0 and universeId == UNIVERSE_IDS.development then
		return "development"
	end
	if UNIVERSE_IDS.production ~= 0 and universeId == UNIVERSE_IDS.production then
		return "production"
	end
	return "unknown"
end

function Environment.isProduction(): boolean
	return Environment.get() == "production"
end

-- Dev tools (test resets, mock storage, debug commands) are allowed here only.
function Environment.allowsDevTools(): boolean
	local name = Environment.get()
	return name == "local" or name == "development"
end

-- The persistence layer must check this before opening any production store.
function Environment.canUseProductionData(): boolean
	return Environment.get() == "production"
end

function Environment.describe(): string
	local name = Environment.get()
	local text = string.format("env %s (universe %d, place %d)", name, game.GameId, game.PlaceId)
	if name == "unknown" then
		text ..= " - add this universe ID to src/shared/Environment.luau"
	end
	return text
end

return Environment
