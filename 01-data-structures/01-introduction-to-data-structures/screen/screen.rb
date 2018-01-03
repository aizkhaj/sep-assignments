require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = inbounds(width, height)
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    return @matrix[x][y]
  end

  private

  def inbounds(x, y)
    arr = []
    for i in 0..x do
      arr.push(Array.new(0,y))
    end
    return arr
  end
end