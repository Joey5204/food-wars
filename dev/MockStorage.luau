--!strict
-- In-memory test storage only. This module never calls DataStoreService.
local Environment = require(game:GetService("ReplicatedStorage").Shared.Environment)

export type Record = { [string]: any }
export type Store = {
	Read: (string) -> Record?,
	Write: (string, Record) -> (),
	Reset: (string) -> (),
	FailNextWrite: () -> (),
}

local function copy(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local result: { [any]: any } = {}
	for key, child in pairs(value) do
		result[key] = copy(child)
	end
	return result
end

local MockStorage = {}

function MockStorage.new(): Store
	assert(Environment.allowsDevTools(), "Mock storage requires a local or development environment")
	local records: { [string]: Record } = {}
	local failNextWrite = false
	return {
		Read = function(key: string): Record?
			local record = records[key]
			return if record then copy(record) else nil
		end,
		Write = function(key: string, record: Record)
			if failNextWrite then
				failNextWrite = false
				error("Injected mock storage write failure")
			end
			records[key] = copy(record)
		end,
		Reset = function(key: string)
			records[key] = nil
		end,
		FailNextWrite = function()
			failNextWrite = true
		end,
	}
end

return MockStorage
