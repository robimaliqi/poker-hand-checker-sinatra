require "spec_helper"
require_relative "../../lib/hand_validation"

RSpec.describe PokerHand do
  include PokerHand
  describe ".four_of_a_kind?" do
    it "returns true if the hand has a four of a kind (example input)" do
      actual = four_of_a_kind?(["2H", "7H", "7D", "7C", "7S"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns true if the hand has a four of a kind (another variation)" do
      actual = four_of_a_kind?(["4H", "4D", "4C", "4C", "9D"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns true if the hand has a four of a kind (another variation(1))" do
      actual = four_of_a_kind?(["10H", "10D", "10C", "10C", "QD"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns false if the hand does not have four of a kind" do
      actual = four_of_a_kind?(["QH", "3D", "8C", "4C", "5D"])
      expected = false
      expect(actual).to eq expected
    end
  end
end