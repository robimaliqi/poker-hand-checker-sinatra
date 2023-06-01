require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".straight?" do
  it "returns true if the hand has a straight (example input)" do
    actual = straight?(["AH", "2D", "3C", "4C", "5D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a straight (another variation)" do
    actual = straight?(["10H", "9D", "8C", "7C", "6D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a straight (another variation(1))" do
    actual = straight?(["5H", "4D", "3C", "2C", "AD"])
    expected = true
    expect(actual).to eq expected
  end

# REGRESSION TESTING 

  it "returns true if the hand has a straight (another variation(2))" do
    actual = straight?(["AH", "KD", "QC", "JC", "10D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if the hand does not have straight" do
    actual = straight?(["QH", "3D", "8C", "4C", "5D"])
    expected = false
    expect(actual).to eq expected
  end
end