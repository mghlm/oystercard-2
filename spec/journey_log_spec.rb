require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:fake_new_journey) {double(:journey_class)}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}
  let(:fake_station) {double(:station)}

  describe "#initialize" do

    it 'should create an empty array' do
      expect(journey_log.journey_history).to eq []
    end
  end

  describe "#start" do
    it { is_expected.to respond_to(:start).with(1).argument }

    it 'should start a journey with an entry station' do
      expect(journey_log.start(entry_station)).to eq entry_station
    end
  end

  describe "#end" do
    it { is_expected.to respond_to(:end).with(1).argument}

    # it "should set exit station" do
    #   expect(journey_log.end(exit_station)).to include exit_station
    # end

    it "should set exit station" do
      journey_log.end([fake_station])
      expect(journey_log.journey_history).to include fake_station
    end

    it "should add journey to journey history after #end" do
      journey_log.end(exit_station)
      expect(journey_log.journey_history).to include exit_station
    end
  end
end
