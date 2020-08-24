function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in  string.gmatch(inputstr, "%S+") do
        table.insert(t, str)
    end
    return t
end

function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

function indexOfPlayer(entity)
    for i=1, table.getn(all_players) do
        if all_players[i].entity == entity then
            return i
        end
    end
    return -1
end


function indexOf(t, query)
    local index={}
    for k,v in pairs(t) do
        index[v]=k
    end
    return index[query]
end
