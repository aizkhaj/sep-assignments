require_relative 'node'

class Graph
  def initialize
    @result = []
  end

  def find_kevin_bacon(node)
    # find the Bacon.

    # if the node passed in is Kevin Bacon himself, then return an error message.
    if node.name == "Kevin Bacon"
      return "Kevin Bacon knows Kevin Bacon already!"
    end

    # within each node's hash, access the array of actors
    node.film_actor_hash.each do |movie, actors|
      # in actors array, do the following with each actor
      actors.each do |actor|
        # if we come across Kevin Bacon, end the loop and then return @result 
        if actor.name == "Kevin Bacon"
          @result.push(movie)
          return @result
        else
          @result.push(movie) unless @result.include?(movie)
          # look within next hash of the actor in question, if we don't find KB.
          find_kevin_bacon(actor)
        end
      end

      # if more than 6 entries in our results array:
      if @result.length > 6
        return "#{node.name} is not connected to the Bacon within 6 degrees. (Sucks for him/her.)"
      else
        return @result
      end
    end
  end
end