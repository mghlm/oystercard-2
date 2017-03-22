require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  describe "#initialize" do
    it 'has a balance of 0' do
      expect(oystercard.balance).to eq 0
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
      expect(oystercard.in_journey).to be false
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      oystercard.top_up(5)
      oystercard.touch_in
      expect(oystercard.in_journey).to be true
    end

    it 'checks minimum balance on touch in' do
      message = "Cannot start journey. Minimum balance required is £#{Oystercard::MIN_BALANCE}. Top up."
      expect{ oystercard.touch_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    before do
      oystercard.top_up(10)
      oystercard.touch_in
      oystercard.touch_out
    end
    it 'can touch out' do
      expect(oystercard).not_to be_in_journey
    end

    it 'deducts minimum fare' do
      expect {oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MIN_FARE)
    end
  end
end
