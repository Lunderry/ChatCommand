--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
--
local Command = require(script.Command)
--
local InitializationServer = require(script.InitializationServer)
local InitializationClient = require(script.InitializationClient)

local module = {}

function module.Init(): ()
	if not RunService:IsStudio() then
		return
	end

	task.defer(function()
		if RunService:IsServer() then
			InitializationServer()
		else
			InitializationClient()
		end
	end)
end

--set is the parameters that need the callback
---@param name string
---@param set table {"string" | "number"}
---@param callback function (...any) -> ()
function module.AddCommand(name: string, set: { "string" | "number" }, callback: (...any) -> ()): ()
	if RunService:IsServer() then
		local CommandRemote = ReplicatedStorage:WaitForChild("_CommandRemote") :: RemoteEvent
		CommandRemote:FireAllClients(name, set)
	end

	Command[name] = callback
end
return module
