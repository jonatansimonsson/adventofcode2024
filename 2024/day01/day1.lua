local function readFile(fileName)
	fileName = fileName or "input.txt"
	local file = assert(io.open(fileName, "r"))
	if file then
		return file:read("*a")
	end
end

local function splitString(str, sep)
	local t = {}
	for line in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(t, line)
	end
	return t
end

local input = readFile("adventofcode2024\\2024\\day01\\input.txt")
-- print(input)
local t = {}
for line in string.gmatch(input, "([^" .. "\n" .. "]+)") do
	table.insert(t, line)
end

--print(table.concat(t, "\n"))
local l1 = {}
local l2 = {}

for _, line in pairs(t) do
	local l = splitString(line, "%s")
	table.insert(l1, tonumber(l[1]))
	table.insert(l2, tonumber(l[2]))
end

--print(table.concat(l1, " "))
--print(table.concat(l2, " "))

local dist = 0
table.sort(l1)
table.sort(l2)

for i, id in pairs(l1) do
	dist = dist + math.abs(id - l2[i])
end

print(dist)

local sim = 0
for _, l1id in pairs(l1) do
	for _, l2id in pairs(l2) do
		if l1id == l2id then
			sim = sim + l1id
		end
	end
end

print(sim)
