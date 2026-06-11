---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

local infoTable = {}

local breakTable = {} --save the line of the break 

local valuesTables = {} --saves the values by lines

local loopUtils = {} --utils for loop temporary variables

baxinterpreter = {
    readInLines = function (file)
        fileOpen = io.open(file, "r")
        loopUtils.tableCount = 0 --for infoTable
        loopUtils.removeNils = 0
        for interpreterLine in fileOpen:lines() do
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
                table.insert(breakTable, #breakTable + 1, loopUtils.removeNils)
            end
        until loopUtils.removeNils == #valuesTables
    end,
    callLine = function (lineFromBaxi, specifiedLine)
        loopUtils.findLine = 0
        if lineFromBaxi == 1 then
            for start = 1, #breakTable do
                if start ~= breakTable[1] then
                    return valuesTables[specifiedLine]
                end
            end
        else
            loopUtils.findLine = lineFromBaxi + 1
            for index = 1, #infoTable do
                if loopUtils.findLine ~= breakTable[index + 1] then
                    return valuesTables[specifiedLine + breakTable[index] - 1]
                end
                loopUtils.findLine = loopUtils.findLine + 1
            end
        end
    end
}