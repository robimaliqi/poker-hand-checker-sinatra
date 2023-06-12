require "spec_helper"
require_relative "../../lib/hand_validation"

RSpec.describe PokerHand do
  include PokerHand
  describe ".straight_flush?" do
    it "returns true if the hand has a straight flush (example input)" do
      actual = straight_flush?(["10H", "JH", "QH", "KH", "AH"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns true if the hand has a straight flush (another variation)" do
      actual = straight_flush?(["QH", "JH", "10H", "9H", "8H"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns true if the hand has a straight flush (another variation(1))" do
      actual = straight_flush?(["8D", "7D", "6D", "5D", "4D"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns false if the hand does not have straight flush" do
      actual = straight_flush?(["QH", "3D", "8C", "4C", "5D"])
      expected = false
      expect(actual).to eq expected
    end
  end
end