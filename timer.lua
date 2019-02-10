-- A general timer class where after maxTime amount of seconds change
-- expired to true. This timer will autoReset unless specified.
Timer = {}
Timer.__index = Timer

function Timer.new(maxTime, autoReset)
  local inst = {}
  setmetatable(inst, Timer)
  inst.elapsedTime = 0
  inst.maxTime = maxTime
  inst.expired = false
  if autoReset == nil then
    inst.autoReset = true
  else
    inst.autoReset = autoReset
  end
  return inst
end

function Timer:update(dt)
  if self.expired and self.autoReset then
    self:reset()
  end
  if self.elapsedTime >= self.maxTime then
    self.expired = true
  else
    self.elapsedTime = self.elapsedTime + dt
  end
end

function Timer:draw(x, y, r, sx, sy, ox, oy, kx, ky)
  love.graphics.print(self.elapsedTime, x, y, r, sx, sy, ox, oy, kx, ky)
  love.graphics.print(tostring(self.expired), x, y + 50, r, sx, sy, ox, oy, kx, ky)
end

function Timer:reset()
  self.expired = false
  self.elapsedTime = 0
end
