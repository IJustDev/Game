entitymanager = {}

projectiles = {}

function entitymanager:load()
end

function entitymanager:draw()
    for i=1,table.getn(projectiles) do
        projectile.draw(projectiles[i])
    end
end

function entitymanager:update()
    for i=1,table.getn(projectiles) do
        projectile.update(projectiles[i])
    end
end
