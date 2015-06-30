require_relative "../lib/stimmung"

describe Stimmung do

  before :each do
    @stimmung = Stimmung.new
  end

  describe "#score" do

    it "returns a score of 0.9037 when passed 'hervorragender test, ausgezeichnete stimmung'" do
      expect(@stimmung.score('hervorragender test, ausgezeichnete stimmung')).to eq(0.9037)
    end

    it "returns a score of -0.0228 when passed 'irgendein relativ langweiliger neutraler text'" do
      expect(@stimmung.score('irgendein relativ langweiliger neutraler text')).to eq(-0.0228)
    end

    it "returns a score of -0.9388000000000001 when passed 'ich hasse dummes beschissenes wetter'" do
      expect(@stimmung.score('ich hasse dummes beschissenes wetter')).to eq(-0.9388000000000001)
    end

  end

end
