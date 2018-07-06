
g_appid = {123, 456, 111, 222}
appid_dont_savedb = {[0]=0x231, [1]=0x6}

function isNeedSaveDB(appid, msgtype, subtype)
    find = 0
    for k, v in pairs(g_appid) do
        if appid == v and appid_dont_savedb[0] == 0x231 then
            find = 1
            break
        end
    end
    if find == 1 then
        --print("find:", appid, msgtype, subtype)
        return 0
    else
        --print("not find", appid, msgtype, subtype)
        return 1
    end
end

function example2(num, str)
    print(num, str)
    if num > 0 then
        return true
    end
    return false

end

--isNeedSaveDB(123, 0x231, 0x6)

