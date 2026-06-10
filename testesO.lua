--Baxi generator main script

local list = io.popen("ls")

local listFilesInDirectory = {}

local sumAllBaxi = 0

local indexList = 0 --only exists for the loop below

--Loops all the files to get the higher number (next loop)

for temporaryList in list:lines() do
    table.insert(listFilesInDirectory, indexList + 1, temporaryList)
    indexList = indexList + 1
end

for init = 1, #listFilesInDirectory do
    for initRun = 1, #listFilesInDirectory do
        if string.match(listFilesInDirectory[init], "file" .. tostring(initRun) .. ".baxi$") then
            sumAllBaxi = sumAllBaxi + 1
        end
    end
end

--main tables

local tableFilled = {}

local tableMissing = {}

local higherFilled = 0 --the higher value from tableFilled

local sumRun = sumAllBaxi --a copy from sumAllBaxi because you cant use the same variable in two loops aparently

--Gets the higher number to loop

for i = 1, sumAllBaxi do
    for initialRun = 1, sumRun do
        if string.match(listFilesInDirectory[i], "file" .. tostring(initialRun) .. ".baxi$") then
            table.insert(tableFilled, i, initialRun)
            if higherFilled < tableFilled[i] then
                higherFilled = tableFilled[i]
            end
        end
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

if #tableMissing == 0 then
    writeMax = io.open("file" .. tostring(higherFilled + 1) .. ".baxi", "w")
else
    for initWrite = 1, #tableMissing do
        writeMinimum = io.open("file".. tostring(tableMissing[initWrite]) .. ".baxi", "w")
    end
end

--CLI

print("Bem vindo ao baxi file maker, aqui você pode escrever informações para serem convertidas em .baxi")
print("Escreva o que desejar, tudo será lido caso tenha o interpretador de .baxi")