local speed = 10 

function newProjectile(startX, startY, direction)
    projectile = {}
    projectile.startX = startX
    projectile.startY = startY
    projectile.x = startX
    projectile.y = startY
    projectile.direction = direction
    return projectile 
end

function updateProjectile(projectile)
    if projectile.direction == "w" then
        projectile.y = projectile.y - speed
    elseif projectile.direction == "s" then
        projectile.y = projectile.y + speed
    elseif projectile.direction == "d" then
        projectile.x = projectile.x + speed
    elseif projectile.direction == "a" then
        projectile.x = projectile.x - speed
    end
end

function drawProjectile(projectile)
    love.graphics.rectangle("fill", projectile.x, projectile.y, 8, 8)
end
