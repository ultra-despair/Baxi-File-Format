---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

--gerador de arquivos.baxi 

local list = io.popen("ls")

local listFilesInDirectory = {}

local sumAllBaxi = 0

--Loops all the files to get the higher number (next loop)

for temporaryList in list:inlines() do
    table.insert(listFilesInDirectory, index + 1, temporaryList)
    for init = 1, #listFilesInDirectory do
        if string.match(files, "file" .. tostring(init) .. ".baxi$") then
            sumAllBaxi = sumAllBaxi + 1
        end
    end
end

local tableFilled = {}

local tableMissing = {}

local higherFilled = 0

--Gets the higher number to loop

for i = 1, sumAllBaxi do
    if string.match(files, "file" .. tostring(i) .. ".baxi$") then
        table.insert(tableFilled, i, i)
    end
    if higherFilled < tableFilled[i] then
        higherFilled = tableFilled[i]
    end
end

--main missing numbers "function"

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

--Writing main part 

for i = 1, #tableMissing do
    write = io.open("file" .. tostring(i) .. ".baxi", "w")
end

--CLI

print("Bem vindo ao baxi file maker, aqui você pode escrever informações para serem convertidas em .baxi")
print("Escreva o que desejar, tudo será lido caso tenha o interpretador de .baxi")