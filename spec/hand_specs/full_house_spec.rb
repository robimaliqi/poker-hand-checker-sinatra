require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".full_house?" do
  it "returns true if the hand has a full house (example input)" do
    actual = full_house?(["2H", "3H", "2D", "3C", "3D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a full house (another variation)" do
    actual = full_house?(["4H", "4D", "4C", "9C", "9D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a full house (another variation(1))" do
    actual = full_house?(["10H", "10D", "10C", "QC", "QD"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if the hand does not have full house" do
    actual = full_house?(["QH", "3D", "8C", "4C", "5D"])
    expected = false
    expect(actual).to eq expected
  end
end