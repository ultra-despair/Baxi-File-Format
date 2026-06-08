---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

--gerador de arquivos.baxi

local baxiLoopCount = 0

local list = io.popen("ls")

--[[anotar todos os arquivos do dir filtrar apenas oa que quero, e se o tamanho do diretorio for maior 
ou igual ao tamanho da lista padrao ai anote todos os arquivos]]

local listFilesInDirectory = {}

local sumAllBaxi = 0

local index = 0

for temporaryList in list:inlines() do
    table.insert(listFilesInDirectory, index + 1, temporaryList)
    for init = 1, #listFilesInDirectory do
        if string.match(files, "file" .. tostring(init) .. ".baxi$") then
            sumAllBaxi = sumAllBaxi + 1
        end
    end
end

local tableFilled = {
    0
}

local tableMissing = {
    0
}

local higherFilled = 0

--[[
    1, 2, 3, 4, 5 indices
    8, 2, 6, 3, 9 filled
    1, 4 missing e se indice for ~= de valor  
]]
--[[
    L1: 5
]]
for i = 1, sumAllBaxi do
    if string.match(files, "file" .. tostring(i) .. ".baxi$") then
        table.insert(tableFilled, i, i)
    end
    if higherFilled < tableFilled[i] then
        higherFilled = tableFilled[i]
    end
end
for index = 1, higherFilled do
    if tableFilled[index] > index then
        table.insert(tableMissing, index, index)
        for k, v in ipairs(tableMissing) do
            if tableFilled[index] == v then
                table.remove(tableMissing, k)
            end
        end
    elseif tableFilled[index] == nil then
        table.insert(tableMissing, index, index)
    end
    if tableMissing[1] == 0 then
        table.remove(tableMissing, tableMissing[1])
    end
end
--[[for i = 1, #list do
    for temporaryFiles in list:inlines() do
        if string.match(temporaryFiles, "file" .. tostring(i) .. ".baxi$") and i == 1 then
            --table.insert(tableFilled, i)
            --if i == 1 and temporaryFiles == "file" .. tostring(i) .. ".baxi" then
                table.insert(tableMissing, 1)
                print("file1.baxi not found, creating...")
            else
                table.insert(tableMissing, i)
                print("file found: looking for others...")
            end
            for k, v in ipairs(tableFilled) do
                if tableFilled[k] == tableMissing[#tableMissing] and tableFilled[k] <= tableMissing[#tableMissing] then
                    table.remove(tableMissing, k)
                    print("Duplicated index: deleting from table")
                end
            end
        elseif string.match(temporaryFiles, "file" .. tostring(i) .. ".baxi$") and i ~= 1 then
            table.insert(tableFilled, i)
            table.insert(tableMissing, i)
            for k, v in ipairs(tableFilled) do
                if tableFilled[k] == tableMissing[#tableMissing] then
                    table.remove(tableMissing, v)
                    print("Duplicated index: deleting from table")
                end
            end
            if #tableMissing == 0 then
                table.remove(tableMissing, #tableMissing)
            end
            if #tableFilled == 0 then
                table.remove(tableFilled, #tableFilled)
            end
        end
    end
end]]
--primeiro colocar tudo na tabela, depois organizar
        --[[
            1, 2, 3, 4, 5
            2, 7, 4, 9, 3   filled
            1, 2            missing


            iniciando do menor para o maior elemento da lista
                se a string combinar com o nome e estiver com prefixos (indice) e sufixos
                    se indice for 1 e valor for diferente de 1 entao
                        insira na tabela 1
                        print("file01.baxi not found, creating...")
                    se nao for o caso e indice for diferente do valor entao
                        insira na tabela indice
                        print("file found: looking for others")

                        loopP: 2
                        loopS: 1

                    percorra a tabela original
                        se valor original for igual a tabela[#tabela] e valor original for menor= que o tamanho da tabela
                            remova tabela original[indiceS]
                            print("Duplicated index: deleting from table")

            1, 2, 3, 4, 5
            2, 7, 4, 9, 3   filled
            1, 2            missing

        ]]
        
--ve as linhas do list 

--[[for files in list:inlines() do
    baxiLoopCount = 1 + baxiLoopCount
    if string.match(files, "file" .. tostring(baxiLoopCount) .. ".baxi$") then
        print("\"file " .. baxiLoopCount .. ".baxi\" already exists looking for next ...")
    else
        write = io.open("file" .. tostring(baxiLoopCount) .. ".baxi", "w")
    end
end]]

for i = 1, #tableMissing do
    write = io.open("file" .. tostring(i) .. ".baxi", "w")
end

print("Bem vindo ao baxi file maker, aqui você pode escrever informações para serem convertidas em .baxi")
print("Escreva o que desejar, tudo será lido caso tenha o interpretador de .baxi")