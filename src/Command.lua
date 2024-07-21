--!strict
local command

command = {
	info = function(_, _)
		local str = ""
		for i, v in command do
			if i == "info" then
				continue
			end
			str ..= i .. typeof(v) .. "\n"
		end
		print("commands: " .. str)
	end,
}
return command
