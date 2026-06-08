local tableFilled = {
    2, 3, 9, 4, 7, 1 --sem 1: 1, 5, 6, 8
                   --5, 8
}

local tableMissing = {}

local higherFilled = 9

for index = 1, higherFilled do
    if tableFilled[index] == nil then
        table.insert(tableMissing, #tableMissing + 1, index)
    elseif tableFilled[index] ~= index and tableFilled[index] >= 1 then
        table.insert(tableMissing, #tableMissing + 1, index)
    end
    for k, v in ipairs(tableFilled) do
        for key, values in ipairs(tableMissing) do
            if tableFilled[k] == tableMissing[key] then -- == 6[3]
                table.remove(tableMissing, key)
            end
        end
    end
end

print("Table Missing:")

for k, v in ipairs(tableMissing) do
    print(tableMissing[k])
end