local helpers = require "adventofcode2024.2024.lib.helpers"

local input = helpers.readFile("adventofcode2024\\2024\\day02\\input.txt")

input = helpers.splitString(input, "\n")
--print(table.concat(input, "\n"))

local safeReports = 0

for _, i in ipairs(input) do
    local report = helpers.splitString(i, " ")
    for k, v in ipairs(report) do
        report[k] = tonumber(v)
    end
    local safe = false
    local desc = report[1] > report[2]
    for j = 1, #report - 1 do
        if report[j] < report[j + 1] == desc then
            safe = false
            break
        end
        local diff = math.abs(report[j] - report[j + 1])
        if diff < 1 or diff > 3 then
            safe = false
            break
        end
        safe = true
    end
    if safe then safeReports = safeReports + 1 end
end

print(safeReports)
