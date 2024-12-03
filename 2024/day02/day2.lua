local helpers = require "adventofcode2024.2024.lib.helpers"

local function isSafe(report)
    for i, v in ipairs(report) do
        report[i] = tonumber(v)
    end
    local desc = report[1] > report[2]
    for j = 1, #report - 1 do
        if report[j] < report[j + 1] == desc then
            return false
        end
        local diff = math.abs(report[j] - report[j + 1])
        if diff < 1 or diff > 3 then
            return false
        end
    end
    return true
end

local input = helpers.readFile("adventofcode2024\\2024\\day02\\input.txt")

input = helpers.splitString(input, "\n")
--print(table.concat(input, "\n"))

local safeReports = 0

for _, i in ipairs(input) do
    local report = helpers.splitString(i, " ")
    if isSafe(report) then safeReports = safeReports + 1 end
end

print(safeReports)

local safeReports2 = 0

for _, i in ipairs(input) do
    local report2 = helpers.splitString(i, " ")
    if isSafe(report2) then
        safeReports2 = safeReports2 + 1
    else
        for j = 1, #report2 do
            local fail = table.remove(report2, j)
            if isSafe(report2) then
                safeReports2 = safeReports2 + 1
                break
            end
            table.insert(report2, j, fail)
        end
    end
end

print(safeReports2)
