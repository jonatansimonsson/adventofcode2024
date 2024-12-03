local aoc = {}


function aoc.readFile(fileName)
    fileName = fileName or "input.txt"
    local file = assert(io.open(fileName, "r"))
    if file then
        return file:read("*a")
    end
end

return aoc
