require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new(fake_new_journey)}
  let(:fake_new_journey) {double(:journey_class)}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  describe "#initialize" do
    it 'should initialize with one argument' do
      expect(journey_log.journey_class).to eq fake_new_journey
    end
    it 'should create an empty array' do
      expect(journey_log.journey_history).to eq []
    end
  end

  describe "#start" do
    it { is_expected.to respond_to(:start).with(1).argument }
    end

    it 'should start a journey with an entry station' do
    expect(journey_log.start(entry_station)).to eq entry_station
    end
end
