---@diagnostic disable: trailing-space, lowercase-global, undefined-field, undefined-global

local baxiLoopCount = 0

local list = io.popen("ls")

local tableFilled = {
    0
}

local tableMissing = {
    0
}

for i = 1, #list do
    for temporaryFiles in list:inlines() do
        if string.match(temporaryFiles, "file" .. tostring(i) .. ".baxi$") and i == 1 then
            --table.insert(tableFilled, i)
            --if i == 1 and temporaryFiles == "file" .. tostring(i) .. ".baxi" then
                table.insert(tableMissing, 1)
                print("file1.baxi not found, creating...")
            --[[else
                table.insert(tableMissing, i)
                print("file found: looking for others...")
            end]]
            --[[for k, v in ipairs(tableFilled) do
                if tableFilled[k] == tableMissing[#tableMissing] and tableFilled[k] <= tableMissing[#tableMissing] then
                    table.remove(tableMissing, k)
                    print("Duplicated index: deleting from table")
                end
            end]]
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
end
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

for files in list:inlines() do
    baxiLoopCount = 1 + baxiLoopCount
    if string.match(files, "file" .. tostring(baxiLoopCount) .. ".baxi$") then
        print("\"file " .. baxiLoopCount .. ".baxi\" already exists looking for next ...")
    else
        write = io.open("file" .. tostring(baxiLoopCount) .. ".baxi", "w")
    end
end

print("Bem vindo ao baxi file maker, aqui você pode escrever informações para serem convertidas em .baxi")
print("Escreva o que desejar, tudo será lido caso tenha o interpretador de .baxi")