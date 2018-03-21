include RSpec

require_relative 'tsp_greed'

RSpec.describe Greedy, type: Class do
  let (:greedy) {Greedy.new}
  # City.new(city_name)
  let (:c1) {City.new('a')}
  let (:c2) {City.new('b')}
  let (:c3) {City.new('c')}
  let (:c4) {City.new('d')}
  
  before :each do
    # Establish neighbors 
    c1.neighbors = [Neighbor.new(c2, 25), Neighbor.new(c3, 40)]
    c2.neighbors = [Neighbor.new(c4, 35), Neighbor.new(c3, 60)]
    c3.neighbors = [Neighbor.new(c2, 60), Neighbor.new(c1, 40)]
    c4.neighbors = [Neighbor.new(c3,30), Neighbor.new(c1,50)]
  end

  describe '#nearest_neighbor_path' do
    it 'returns a correct tour' do
      result = greedy.nearest_neighbor_path(c1)
      expect(result).to eq ["a", "b", "d", "c"]
    end
  end
  # tour should be: ["a", "b", "d", "c"]
end