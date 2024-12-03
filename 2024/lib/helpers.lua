local aoc = {}


function aoc.readFile(fileName)
    fileName = fileName or "input.txt"
    local file = assert(io.open(fileName, "r"))
    if file then
        return file:read("*a")
    end
end

function aoc.splitString(s, sep)
    local t = {}
    for line in string.gmatch(s, "([^" .. sep .. "]+)") do
        table.insert(t, line)
    end
    return t
end

return aoc
