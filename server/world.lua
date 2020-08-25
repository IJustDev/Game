world = {}

function world:new()
    o = {}
    o.chunks = {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function world:generate()
end

function world:save()
end

function world:load()
end

function world:generate_chunk()
    table.insert(self.chunks, chunk:new())
end
