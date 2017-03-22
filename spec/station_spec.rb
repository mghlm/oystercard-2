require 'station'

describe Station do
  subject(:station) {described_class.new("Old Street", 1)}

  describe "#initialize" do

    it "has a name" do
      expect(station.name).to eq("Old Street")
    end

    it "has a zone" do
      expect(station.zone).to eq(1)
    end

  end
end
