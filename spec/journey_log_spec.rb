require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new(fake_new_journey)}
  let(:fake_new_journey) {double(:journey_class)}

  describe "#initialize" do
    it 'should initialize with one argument' do
      expect(journey_log.journey_class).to eq fake_new_journey
    end
  end
end
