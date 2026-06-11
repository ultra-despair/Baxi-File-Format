---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

--[[

    ler em linhas 1
    detectar quantas linhas sao dentro de outra 1
    transformar em string/variavel/tabela 0

    poder chamar com base no numero da linha

]]

local infoTable = {}

local breakTable = {} --save the line of the break 

local valuesTables = {} --saves the values by lines

local loopUtils = {}

local testBaxi = io.open("file1.baxi", "r")

baxinterpreter = {
    readInLines = function (file)
        --add fileOpen = io.open(file), "r")
        loopUtils.tableCount = 0 --for infoTable
        loopUtils.removeNils = 0
        for interpreterLine in file:lines() do
            loopUtils.tableCount = loopUtils.tableCount + 1
            table.insert(infoTable, loopUtils.tableCount, interpreterLine)
        end
        for start = 1, #infoTable do
            if infoTable[start] ~= "" then
                valuesTables[start] = infoTable[start]
            end
        end
        repeat
            loopUtils.removeNils = loopUtils.removeNils + 1 
            if valuesTables[loopUtils.removeNils] == nil then
                table.remove(valuesTables, loopUtils.removeNils)
            end
        until loopUtils.removeNils == #valuesTables
        --debug 
        print("Infotable")
        for i = 1, #infoTable do
            print(infoTable[i])
        end
        print("\nValuestable")
        for i = 1, #valuesTables do
            --if valuesTables[i] ~= nil then
                print(valuesTables[i])
            --end
        end
    end
}

baxinterpreter.readInLines(testBaxi)