require_relative './valid_hand_helpers'

# VALID_HANDS = {in 
#   "2H 2D 2C KC QD" => "three of a kind",
#   "2H 5H 7D 8C 9S" => "high card",
#   "AH 2D 3C 4C 5D" => "straight",
#   "2H 3H 2D 3C 3D" => "full house",
#   "2H 7H 2D 3C 3D" => "two pair",
#   "2H 7H 7D 7C 7S" => "four of a kind",
#   "10H JH QH KH AH" => "straight flush",
#   "4H 4S KS 5D 10S" => "one pair",
#   "3H 3S KS 6D 10S" => "one pair",
# }

module  PokerHand
  include ValidHandsHelper
  # method to check any of the 5 pairs have the same rank

  # condition for meeting one pair, you would have to take 
  # the hand and split it and get 5. Check wether any of the
  #  of the array elemenets repeated again in the pair

  def is_valid?(hand)
    # should be 5 pairs,
    step_1 = hand.split(' ')

    # checks if the right amount of cards are entered and for any duplicates
    return step_1.length == 5 && step_1.uniq.length == 5

    # first condition is met
    # Now the second condition wherein the first character should be convertible to an integer,
    # and the second is not
    step_1.each do |individual_hand|
    # the first a number value; the second a letter value
      (individual_hand[0].to_i > 0) && (individual_hand[-1].count("a-zA-Z") > 0)
    end
    # if this evaluates to false then we should get an early return
  end

  def process(hand)
    is_valid?(hand) # => this is the guard that checks that gives an early return if the hand is invalid
  end

  def prepared_(hand)
    hand.split(" ")
  end

  def hand_validation(hand)

    if !is_valid?(hand)
      "Invalid hand"
    else
      prepared = prepared_(hand)
      if full_house?(prepared)
        "Full House"
      elsif straight_flush?(prepared)
        "Straight Flush"
      elsif three_of_kind?(prepared)
        "Three of a Kind"
      elsif straight?(prepared)
        "Straight"
      elsif two_pair?(prepared)
        "Two Pair"
      elsif four_of_a_kind?(prepared)
        "Four of a Kind"
      elsif one_pair?(prepared)
        "One pair"
      else 
        "High Card"
      end
    end

    # if the hand passes the is_valid? condition then we will check if it matches each hand 
    # and return the relevant hand, hand to change the sequence of some methods in the if else
    # statement so certain tests pass.

  end
end