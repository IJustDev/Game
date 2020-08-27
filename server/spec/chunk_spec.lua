require "../chunk"

describe('Chunk tests', function()

    it('should return string of serialized chunk', function()
        local c = chunk:new()
        c:generate()
        local serialized = c:serialize(20, 20)
        assert(string.len(serialized) >= 16*16*5)
        assert(string.len(serialized) <= 16*16*6)
    end)
    
end)

