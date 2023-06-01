require "spec_helper"
require_relative "../../lib/hand_validation"

RSpec.describe PokerHand do
  include PokerHand
  describe ".hand_validation" do
    it "returns Three of Kind if this hand is entered" do
      expect(hand_validation("2H 2D 2C KC QD")).to eq "Three of a Kind"
    end

    it "returns High Card the given hand is invalid" do
      expect(hand_validation("2H 5H 7D 8C 9S")).to eq "High Card"
    end  
    
    it "return Straight if this hand is entered" do
      expect(hand_validation("AH 2D 3C 4C 5D")).to eq "Straight"
    end  

    it "returns Full House if the given hand is entered" do
      expect(hand_validation("2H 3H 2D 3C 3D")).to eq "Full House"
    end 

    it "returns Two Pair if this hand is entered" do
      expect(hand_validation("2H 7H 2D 3C 3D")).to eq "Two Pair"
    end  

    it "returns Four of a Kind if this hand is entered" do
      expect(hand_validation("2H 7H 7D 7C 7S ")).to eq "Four of a Kind"
    end  

    it "returns Straight Flush if this hand is entered" do
      expect(hand_validation("10H JH QH KH AH")).to eq "Straight Flush"
    end  

    it "returns One pair if this hand is entered" do
      expect(hand_validation("4H 4S KS 5D 10S")).to eq "One pair"
    end  

    it "returns Invalid Hand if this hand is entered" do
      expect(hand_validation("QC 10C 7C 6C QC")).to eq "Invalid hand"
    end  

    it "returns Invalid Hand if the if this hand is entered" do
      expect(hand_validation("JH QH KH")).to eq "Invalid hand"
    end  

    it "returns Invalid Hand if another duplicate hand is entered" do
      expect(hand_validation("8C 10C 7C 8C QC")).to eq "Invalid hand"
    end  
  end
end