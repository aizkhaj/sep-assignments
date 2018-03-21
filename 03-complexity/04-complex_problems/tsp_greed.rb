# implement nearest neighbor (greedy method) for traveling salesman problem in ruby.

class City
  attr_accessor :name
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize(name)
    @name = name
    @neighbors = nil
    @visited = false
  end
end

class Neighbor
  attr_accessor :city
  attr_accessor :distance
  attr_accessor :visited
  
  def initialize(city, distance)
    @city = city
    @distance = distance
  end
end

class Greedy
  def initialize
    @tour = []
  end
  
  def nearest_neighbor_path(current_city)
    while current_city.visited == false
      neighbor_cities = current_city.neighbors
      next_city = neighbor_cities[0]
      p next_city
      
      for current_neighbor in neighbor_cities
        if current_neighbor.distance < next_city.distance
          next_city = current_neighbor
        end
      end
      current_city.visited = true
      @tour << current_city.name
      current_city = next_city
    end
    return @tour
  end
end



#   def nearest_neighbor_path(current_city)
#     while current_city.visited == false
#       # p current_city.name
#       p current_city.neighbors
#       neighbor_cities = current_city.neighbors
#       next_city = neighbor_cities[0]
      
#       neighbor_cities.each do |neighbor|
#         if neighbor.distance < next_city.distance
#           next_city = neighbor
#           # @tour << next_city.name
#         end
#         break
#       end

#       # for current_neighbor in neighbor_cities
#       #   if current_neighbor.distance < next_city.distance
#       #     next_city = current_neighbor
#       #   end
#       # end
#       current_city.visited = true
#       @tour << current_city.name
#       # nearest_neighbor_path(next_city)
#     end
#     p @tour
#     return @tour
#   end
