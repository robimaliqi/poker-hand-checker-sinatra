require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".two_pair?" do
  it "returns true if there are two pairs (example input)" do
    actual = two_pair?(["2H", "7H", "2D", "3C", "3D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if there are two pairs (another variation)" do
    actual = two_pair?(["4H", "7H", "4D", "8C", "8D"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if there are not two pairs with the same face" do
    actual = two_pair?(["1H", "3S", "KS", "6D", "10S"])
    expected = false
    expect(actual).to eq expected
  end

  # REGRESSION TESTING 

  it "returns true if there are two pairs with the same face (letters only)" do
    actual = two_pair?(["QH", "QS", "7S", "KD", "KS"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns false if there are not two pairs with the same face another variation" do
    actual = two_pair?(["QH", "QD", "QC", "7D", "QS"])
    expected = false
    expect(actual).to eq expected
  end
end
