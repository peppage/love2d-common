-- General image class that holds all the fields for an image.

Image = {}
Image.__index = Image

function Image.new(filename, scaleX, scaleY)
  local inst = {}
  setmetatable(inst, Image)

  inst.filename = filename
  inst.drawable = love.graphics.newImage(filename)
  inst.scaleX = scaleX
  inst.scaleY = scaleY
  inst.width = inst.drawable:getWidth()
  inst.height = inst.drawable:getHeight()
  inst.scaledWidth = scaleX * inst.drawable:getWidth()
  inst.scaledHeight = scaleY * inst.drawable:getHeight()
  return inst
end
