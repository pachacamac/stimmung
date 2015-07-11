require_relative "../lib/stimmung"

describe Stimmung do

  describe '#initialize' do 
    let(:stimmung) {Stimmung.new(File.join(File.dirname(__FILE__), '..', 'lib', 'emoticons.txt'))}

    it "can load other dictionaries" do
      expect(stimmung.words.size).to eq(54)
    end
  end

  describe '#score' do
    let(:stimmung) {Stimmung.new}

    it "returns a score of 0.9037 when passed 'hervorragender test, ausgezeichnete stimmung'" do
      expect(stimmung.score('hervorragender test, ausgezeichnete stimmung')).to eq(0.9037)
    end

    it "returns a score of -0.0228 when passed 'irgendein relativ langweiliger neutraler text'" do
      expect(stimmung.score('irgendein relativ langweiliger neutraler text')).to eq(-0.0228)
    end

    it "returns a score of -0.9388000000000001 when passed 'ich hasse dummes beschissenes wetter'" do
      expect(stimmung.score('ich hasse dummes beschissenes wetter')).to eq(-0.9388000000000001)
    end


    context 'when passed a string containing non-letter characters' do
      it 'strips out those characters' do
        expect(stimmung.score('Das; ist? sehr+ traurig!?!')).to eq(stimmung.score('Das ist sehr traurig'))
      end

      it "doesn't remove emoticons, though" do
        expect(stimmung.score(';)')).to eq(1.0)
      end

      it "can distinguish between punctuation and emoticons" do
        expect(stimmung.score('Was macht ein Hacker am See? Piraten!! :D')).to eq(1.004)
      end

    end
  end
end
