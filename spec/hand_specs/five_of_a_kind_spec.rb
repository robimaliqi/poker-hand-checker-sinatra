require "spec_helper"
require_relative "../../lib/hand_validation"

describe ".five_of_a_kind?" do
  it "returns true if the hand has a five of a kind (example input)" do
    actual = five_of_a_kind?(["AH", "AD", "AC", "AS", "JKR"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a five of a kind (another variation)" do
    actual = five_of_a_kind?(["QH", "QD", "QC", "QS", "JKR"])
    expected = true
    expect(actual).to eq expected
  end

  it "returns true if the hand has a five of a kind (another variation(1))" do
    actual = five_of_a_kind?(["7H", "7D", "7C", "7S", "JKR"])
    expected = true
    expect(actual).to eq expected
  end
end