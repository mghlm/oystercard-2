require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

describe "#initialize" do
  it 'starts a journey' do
    expect(journey.current_trip).to eq ({})
  end
end

describe "#start" do
  it "records entry station" do
    expect(journey.entry_station).to eq nil
  end
end

describe "end" do
  it "records exit station" do
    expect(journey.end(exit_station)).to eq exit_station
  end
end



end
