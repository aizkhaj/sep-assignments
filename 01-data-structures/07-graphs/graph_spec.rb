include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:graph) {Graph.new}
  let (:bacon) {Node.new("Kevin Bacon")}
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:paul_giamatti) { Node.new("Paul Giamatti") }
  let (:al_pacino) {Node.new("Al Pacino")}
  let (:alec_baldwin) { Node.new("Alec Baldwin") }
  let (:bean) { Node.new("Mr. Bean") }
  let (:mickey) { Node.new("Mickey Mouse") }
  let (:minnie) { Node.new("Minnie Mouse") }
  let (:goofy) {Node.new("Goofy")}

  before (:each) do
    bacon.film_actor_hash["Random_Movie"] = [tom_hanks]
    
    goofy.film_actor_hash["Minnie dun Goof"] = [minnie]
    minnie.film_actor_hash["Finding Mickey"] = [mickey]
    mickey.film_actor_hash["Mickey Rules The World"] = [bean, tom_hanks]
    tom_hanks.film_actor_hash["Saving Private Ryan"] = [paul_giamatti]
    paul_giamatti.film_actor_hash["Donnie Brasco"] = [al_pacino]
    al_pacino.film_actor_hash["Glengarry Glen Ross"] = [alec_baldwin]
    alec_baldwin.film_actor_hash["She's Having a Baby"] = [bacon]
  end

  describe "#find_kevin_bacon(node)" do
    it "returns a graceful error if node name is Kevin Bacon" do
      result = graph.find_kevin_bacon(bacon)
      expect(result).to eq "Kevin Bacon knows Kevin Bacon already!"
    end

    it "if @result is larger than 6 degrees, it returns an error message conveying so" do
      result = graph.find_kevin_bacon(goofy)
      expect(result).to eq "Goofy is not connected to the Bacon within 6 degrees. (Sucks for him/her.)"
    end

    it "if we have made a link to Kevin Bacon within 6 degrees, it returns a valid result" do
      result = graph.find_kevin_bacon(tom_hanks)
      expect(result).to eq ["Saving Private Ryan", "Donnie Brasco", "Glengarry Glen Ross", "She's Having a Baby"]
    end
  end
end