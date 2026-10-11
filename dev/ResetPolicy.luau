--!strict
local ResetPolicy = {}

function ResetPolicy.canReset(
	environmentName: string,
	userId: number,
	allowedUsers: { [number]: boolean }
): boolean
	-- Unknown, production, and unpublished local places cannot use the chat reset.
	return environmentName == "development" and allowedUsers[userId] == true
end

return ResetPolicy
