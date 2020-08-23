entitymanager = {}

projectiles = {}

function entitymanager:load()
end

function entitymanager:draw()
    for i=1,table.getn(projectiles) do
        drawProjectile(projectiles[i])
    end
end

function entitymanager:update()
    for i=1,table.getn(projectiles) do
        updateProjectile(projectiles[i])
    end
end
