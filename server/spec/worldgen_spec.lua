require "../world"
require "../chunk"

describe('Chunk tests', function()
    it('generateChunk should return a map of perlin noise values', function()
        local w = world:new()
        local chunk = w:generateChunkAt(0, 0)
        local chunkSize = table.getn(chunk:getBlocks())
        assert(chunkSize == 16, 'Chunk size should be 16')
    end)

    it('world should generate chunk when it is not existant', function()
        local w = world:new()
        w:initializeChunks()
        local x, y = 30050, 200
        local chunk = w:getChunkAt(w:fromPlayerToChunkCoordinate(x, y))
        assert(chunk ~= nil, 'Chunk should be generated')
    end)
    it('world should generate chunks around one chunk', function()
        local w = world:new()
        w:initializeChunks()
        local x, y = 2000, 3000
        local chunks = w:getChunksNearby(x, y, 1)
        assert(table.getn(chunks) == 9, 'Amount of chunks nearby should be 9')
    end)

    it('world should continiously create chunks', function()
        local w = world:new()
        w:initializeChunks()
        local x, y = 0, 0
        local chunkAmount = table.getn(w:getChunks())
        assert(chunkAmount == 3)
        assert(table.getn(w:getChunks()[1]) == 3)
        assert(table.getn(w:getChunks()[2]) == 3)
        assert(table.getn(w:getChunks()[3]) == 3)
    end)

end)
