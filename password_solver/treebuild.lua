local wordlist = {
"about",
"after",
"again",
"below",
"could",
"every",
"first",
"found",
"great",
"house",
"large",
"learn",
"never",
"other",
"place",
"plant",
"point",
"right",
"small",
"sound",
"spell",
"still",
"study",
"their",
"there",
"these",
"thing",
"think",
"three",
"water",
"where",
"which",
"world",
"would",
"write"
}

local wordtree = {}

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return "\"" .. tostring(o) .. "\""
    end
 end

function merge(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            merge(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
    return t1
end

local function makeTable(char, word)
    local tbl = {}
    tbl[char] = word or {}
    return tbl
end

local function solve(current, word)
    word = word or current

print("cureent: " .. current)
print("word: " .. word)

local tbl = {}

    if ( current:len() == 1 ) then
        tbl[current] = word
    else
        tbl[current:sub(1,1)] = solve(current:sub(2, #current), word)
    end

    return tbl
end

for _, v in pairs(wordlist) do
    local word = v
    local solved = solve(word)
    wordtree = merge(wordtree, solved)
end

print(dump(wordtree))

    --local function solve(input, solution)
    --     local tree = solution
    --     print("Tiefe: " .. depth)
    --         depth = depth + 1
    --         for i = 1, #input do
    --             local char = input:lower():sub(i, i)
    --     print("Zeichen: " .. char)

    --             if ( solution[char] ~= nil ) then
    --     print("Zeichen vorhanden...")
    --                 if (type(solution[char]) == "string") then
    --                     errorI("word clash")
    --                 end
    --             else
    --                 solution[char] = {}
    --             end

    --     print("Nächste Ebene")
    --                     local tree = solve(inputs[depth], solution[char])
    --                 end
    --             end
    --         end
    --     print("Vorherige Ebene")
    --             depth = depth - 1
    --     end
