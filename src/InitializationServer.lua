--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--
local Command = require(script.Parent.Command)
--
local CommandRemote = Instance.new("RemoteEvent", ReplicatedStorage)
CommandRemote.Name = "_CommandRemote"
--
local function _initialization(): ()
	CommandRemote.OnServerEvent:Connect(function(_, name: string, set: { string | number })
		Command[name](table.unpack(set))
	end)
end

return _initialization
