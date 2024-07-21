--!strict
local MensageManager = require(script.Manager)
local Command = require(script.Command)

local module = {}

function module.Added(plr: Player): ()
	plr.Chatted:Connect(function(msg)
		if string.sub(msg, 1, 1) ~= "!" then
			return
		end
		local packMsg = MensageManager.div(msg)

		local nameFunct = string.lower(packMsg[1])
		table.remove(packMsg, 1)

		if not Command[nameFunct] then
			warn("dont exist function", nameFunct)
			return
		end

		Command[nameFunct](plr, table.unpack(packMsg))
	end)
end

---variable from funct 1: plr, 2: ...
---@param t string
---@param func any
function module.AddCommand(t: string | {}, func: any): ()
	if type(t) == "table" then
		for i, v in t do
			Command[i] = v
		end
	else
		Command[t] = func
	end
end
return module
