require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  it { is_expected.to respond_to :complete? }

describe "#start" do
  it 'starts a journey' do
    expect(journey.entry_station).to eq nil
  end
  it "indicates if a journey is complete" do
  journey.start(entry_station)
  expect(journey.complete?).to be_falsy
  end
end

describe "#end" do
  it "records exit station" do
    expect(journey.end(exit_station)).to eq exit_station
  end
  it "indicates if a journey is complete" do
    journey.start(entry_station)
    journey.end(exit_station)
    expect(journey.complete?).to be_truthy
  end
 end

 describe '#fare' do
   it 'charges a penalty fare if no entry but exit' do
     journey.end(exit_station)
     expect(journey.fare).to eq Journey::PENALTY_FARE
   end
   it 'charges a penalty fare if entry but no exit' do
     journey.start(entry_station)
     expect(journey.fare).to eq Journey::PENALTY_FARE
  end
  it 'charges the minimum fare for a complete journey' do
    journey.start(entry_station)
    journey.end(exit_station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end
end

end
