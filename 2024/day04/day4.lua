local helpers = require "adventofcode2024.2024.lib.helpers"

local file = helpers.readFile("adventofcode2024\\2024\\day04\\input.txt")

local input = helpers.splitString(file, "\n")

local word = "XMAS"

local directions = {
    { 0,  1 },
    { 0,  -1 },
    { 1,  0 },
    { -1, 0 },
    { 1,  1 },
    { -1, -1 },
    { 1,  -1 },
    { -1, 1 }
}

local function inGrid(row, col)
    return row >= 1 and row <= #input and col >= 1 and col <= #input[1]
end

local function searchWord(grid, word, dirs)
    local totalWords = 0

    for r = 1, #grid do
        for c = 1, #grid[1] do
            for _, dir in ipairs(dirs) do
                local found = true
                for i = 0, #word - 1 do
                    local row = r + i * dir[1]
                    local col = c + i * dir[2]
                    if not inGrid(row, col) or grid[row]:sub(col, col) ~= word:sub(i + 1, i + 1) then
                        found = false
                        break
                    end
                end
                if found then
                    totalWords = totalWords + 1
                end
            end
        end
    end

    return totalWords
end

local function checkDiag(grid, r, c)
    local tl = grid[r - 1]:sub(c - 1, c - 1)
    local tr = grid[r - 1]:sub(c + 1, c + 1)
    local bl = grid[r + 1]:sub(c - 1, c - 1)
    local br = grid[r + 1]:sub(c + 1, c + 1)

    if (tl == "M" and tr == "S" and bl == "M" and br == "S") or
        (tl == "S" and tr == "M" and bl == "S" and br == "M") or
        (tl == "M" and tr == "M" and bl == "S" and br == "S") or
        (tl == "S" and tr == "S" and bl == "M" and br == "M") then
        return true
    end
    return false
end

local function searchX(grid)
    local totalWords = 0
    for r = 2, #grid - 1 do
        for c = 2, #grid[1] - 1 do
            if grid[r]:sub(c, c) == "A" then
                if checkDiag(grid, r, c) then totalWords = totalWords + 1 end
            end
        end
    end
    return totalWords
end

local results = searchWord(input, word, directions)

local results2 = searchX(input)

print(results)
print(results2)
