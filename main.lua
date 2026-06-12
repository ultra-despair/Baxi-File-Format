---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

--Baxi generator main script

local list = io.popen("ls")

local listFilesInDirectory = {}

local sumAllBaxi = 0

local indexList = 0 --only exists for the loop below

local mainWrite = 1

local executeProgramInLoop = 1

local missingCount = 1

local higherCount = 1

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

for i = 1, sumAllBaxi do
    for initialRun = 1, #listFilesInDirectory do
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

function openFile()
    if #tableMissing == 0 then
        writeMax = io.open("file" .. tostring(higherFilled + higherCount) .. ".baxi", "w")
        higherCount = higherCount + 1
        io.output(writeMax)
    else
        writeMinimum = io.open("file".. tostring(tableMissing[missingCount]) .. ".baxi", "w")
        missingCount = missingCount + 1
        io.output(writeMinimum)
    end
end

function writeInFile()
    while mainWrite == 1 do
        userInput = io.read()
        if userInput == "" then
            io.write("\n")
        elseif userInput == "\\close" then
            mainWrite = 0
            io.close()
        else
            io.write(userInput .. "\n")
        end
    end

    if #tableMissing == 0 then
        print("\nFile wrote! Check the file: file" .. higherFilled + higherCount - 1 .. ".baxi")
    else
        print("File wrote! Check the file: file" .. missingCount .. ".baxi")
    end

    print("You want to create another file?")

    continue = io.read()

    if continue == "no" or continue == "No" or continue == "" then
        executeProgramInLoop = 0
    else
        mainWrite = 1
        print("")
    end
end

--CLI

print([[Bem vindo ao baxi file maker, aqui você pode escrever informações para serem convertidas em .baxi
Para melhor uso de uma olhada no README.md pois lá está bem explicado suas propriedades]])

print([[Welcome to baxi file maker, here um can write code to convert in .baxi file. 
To use the full power of the software read the README.md)]])

while executeProgramInLoop == 1 do
    openFile()
    writeInFile()
end