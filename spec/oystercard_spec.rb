require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe "#initialize" do
    it 'has a balance of 0' do
      expect(oystercard.balance).to eq 0
    end
    it 'should initialize with an empty list of journeys' do
      expect(oystercard.journeys).to eq []
    end
  end

  describe "#top_up" do
    it 'adds money to the balance' do
      expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10
    end

    it "raises an error when maximum balance is exceeded" do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect{oystercard.top_up(1)}.to raise_error "Cannot top up card. Max deposit (#{max_balance}) exceeded. Try lower amount."
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(oystercard.entry_station).to be nil
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      oystercard.top_up(5)
      oystercard.touch_in(:entry_station)
      expect(oystercard.entry_station).to be :entry_station
    end

    it 'passes entry station to journey' do
      oystercard.top_up(5)
      oystercard.touch_in(:entry_station)
      expect(oystercard.journey.entry_station).to eq :entry_station
    end

    it 'checks minimum balance on touch in' do
      message = "Cannot start journey. Minimum balance required is £#{Oystercard::MIN_BALANCE}. Top up."
      expect{ oystercard.touch_in(:entry_station) }.to raise_error message
    end

    it 'should return entry station' do
      expect(oystercard).to respond_to(:entry_station)
  end
end

  describe '#touch_out' do

    before do
      oystercard.top_up(10)
      oystercard.touch_in(:entry_station)
      oystercard.touch_out(:exit_station)
    end

    it 'can touch out' do
      expect(oystercard).not_to be_in_journey
    end

    # it 'stores the journey in a journeys array' do
    #   expect(oystercard.journeys).to include journey
    # end

    it 'should forget entry station' do
      expect(oystercard.entry_station).to be_nil
    end
  end
end
