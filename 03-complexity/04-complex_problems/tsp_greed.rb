# implement nearest neighbor (greedy method) for traveling salesman problem in ruby.

def tsp_greed(graph_of_cities, current_city)
  while current_city.visited == false
    neighbor_cities = current_city.neighbors
    next_city = neighbor_cities[0]
    
    for current_neighbor in neighbor_cities
      if current_neighbor.distance < next_city.distance
        next_city = current_neighbor
      end
    end
    current_city.visited = true
    current_city = next_city
  end
end