--!strict
local module = {}

function module.div(msg: string): { string }
	msg = string.sub(msg, 2, #msg)

	local t: {any} = { "" }
	local count = 1

	for i = 1, #msg do
		local str = string.sub(msg, i, i)

		if str == " " then
			count += 1
			t[count] = ""
			continue
		end

		t[count] ..= str
	end

	for i, v in t do
		if tonumber(v) then
			t[i] = tonumber(v)
		end
	end

	return t
end

return module
