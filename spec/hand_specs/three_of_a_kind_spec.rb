require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".three_of_kind?" do
  it "returns true if the hand has three of a kind (example input)" do
    actual = three_of_kind?(["2H", "2D", "2C", "KC", "QD"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has three of a kind (another variation)" do
    actual = three_of_kind?(["7H", "7D", "7C", "4C", "5D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if the hand does not have three of a kind" do
    actual = three_of_kind?(["QH", "3D", "8C", "4C", "5D"])
    expected = false
    expect(actual).to eq expected
  end

  # REGRESSION TESTING 

  it "returns true if the hand has three of a kind (another variation with letters on faces)" do
    actual = three_of_kind?(["KH", "KD", "KC", "4C", "5D"])
    expected = true
    expect(actual).to eq expected
  end
end