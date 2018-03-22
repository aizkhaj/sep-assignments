include RSpec

require_relative 'tsp_greed'

RSpec.describe Greedy, type: Class do
  let (:greedy) {Greedy.new}
  # City.new(city_name)
  let (:a) {City.new('a')}
  let (:b) {City.new('b')}
  let (:c) {City.new('c')}
  let (:d) {City.new('d')}
  
  before :each do
    # Establish neighbors 
    a.neighbors = [Neighbor.new(b, 25), Neighbor.new(c, 40)]
    b.neighbors = [Neighbor.new(d, 35), Neighbor.new(c, 60)]
    c.neighbors = [Neighbor.new(b, 60), Neighbor.new(a, 40)]
    d.neighbors = [Neighbor.new(c, 30), Neighbor.new(a, 50)]
  end

  describe '#nearest_neighbor_path' do
    it 'returns a correct tour' do
      result = greedy.nearest_neighbor_path(a)
      expect(result).to eq ["a", "b", "d", "c"]
    end

    it 'returns a correct tour again' do
      result = greedy.nearest_neighbor_path(b)
      expect(result).to eq ["b", "d", "c", "a"]
    end
  end
end