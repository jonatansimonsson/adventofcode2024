local helpers = require "adventofcode2024.2024.lib.helpers"

local file = helpers.readFile("adventofcode2024\\2024\\day03\\input.txt")
file = file .. "do()"

local total1 = 0
for n, n2 in string.gmatch(file, "mul%((%d+),(%d+)%)") do
    total1 = total1 + n * n2
end

print(total1)

local total2 = 0

local part2 = string.gsub(file, "don't%(%)(.-)do%(%)", "")

for n, n2 in string.gmatch(part2, "mul%((%d+),(%d+)%)") do
    total2 = total2 + n * n2
    --print(n, n2)
end

print(total2)
