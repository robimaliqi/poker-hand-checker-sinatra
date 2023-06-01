require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".flush?" do
  it "returns true if the hand has a flush" do
    actual = flush?(["KC", "10C", "7C", "3C", "9C"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a flush (another variation)" do
    actual = flush?(["AH", "JH", "9H", "6H", "4H"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a flush (another variation)" do
    actual = flush?(["7D", "2D", "9D", "6D", "4D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if the hand does not have flush" do
    actual = flush?(["QH", "3D", "8C", "4C", "5D"])
    expected = false
    expect(actual).to eq expected
  end
end