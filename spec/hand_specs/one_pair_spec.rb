require "spec_helper"
require_relative "../../lib/hand_validation"

RSpec.describe PokerHand do
  include PokerHand
  describe ".one_pair?" do
    it "returns true if there are two same numbers (4)" do
      actual = one_pair?([ "4H", "4S","KS", "5D", "10S"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns true if there are two cards with the same face(letter instead of number)" do
      actual = one_pair?(["4H", "KS","KD", "5D", "10S"])
      expected = true
      expect(actual).to eq expected
    end

    it "returns false if there are not two of same numbers" do
      actual = one_pair?(["1H", "3S", "KS", "6D", "10S"])
      expected = false
      expect(actual).to eq expected
    end

    it "returns true if there are two same numbers (3)" do
      actual = one_pair?(["3H", "3S", "KS", "6D", "10S"])
      expected = true
      expect(actual).to eq expected
    end

    # REGRESSION TESTING 

    it "a hand with a different face(8)" do
      actual = one_pair?(["8H", "3S", "KS", "6D", "10S"])
      expected = false
      expect(actual).to eq expected
    end

    it "a pair with a face of 9's" do
      actual = one_pair?(["9H", "9S", "KS", "6D", "10S"])
      expected = true
      expect(actual).to eq expected
    end

    it "a hand with three 9 faces" do
      actual = one_pair?(["9H", "9S", "9S", "6D", "10S"])
      expected = false
      expect(actual).to eq expected
    end

    it "a handwith weird numbers" do
      actual = one_pair?(["1H", "10S", "0S", "6D", "5S"])
      expected = false
      expect(actual).to eq expected
    end
  end
end
