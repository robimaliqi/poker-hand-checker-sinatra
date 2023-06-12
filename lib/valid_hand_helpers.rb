module ValidHandsHelper

  def one_pair?(processed_hand)
    ranks = processed_hand.map { |card| card[0...-1] }
    counts = Hash.new(0)

    ranks[0...-1].each { |number| counts[number] += 1 }

    counts.values.any? { |count| count == 2 }
  end

  def two_pair?(processed_hand)
    ranks = processed_hand.map { |card| card[0...-1] } # Extract face values from each card
    face_counts = face_values.group_by { |value| value }.transform_values(&:count) # Count occurrences of each face value

    return face_counts.values.count(2) == 2 && face_counts.values.count(1) == 1
  end
  
  def three_of_kind?(processed_hand)
    ranks = processed_hand.map { |card| card[0...-1] } # Extract face values from each card
    face_counts = face_values.group_by { |value| value }.transform_values(&:count) # Count occurrences of each face value

    return face_counts.values.include?(3)
  end

  def straight?(processed_hand)
    card_values = processed_hand.map { |card| card[0..-2] } # Extract the card values from each element in the hand

    sorted_values = card_values.map { |value| value.gsub(/[JQKA]/, 'J' => '11', 'Q' => '12', 'K' => '13', 'A' => '14').to_i }.sort
    # Convert face cards to numeric values, sort the values in ascending order

    consecutive_values = sorted_values.each_cons(2).all? { |a, b| b == a + 1 }
    # Check if each value is one less than the next value

    # Special case: Ace can be considered as both the highest and lowest value in a straight
    ace_low_straight = sorted_values == [2, 3, 4, 5, 14]
    
    consecutive_values || ace_low_straight # If consecutive values or ace-low straight, it's a straight
  end

  def flush?(processed_hand)
    suits = processed_hand.map { |card| card[-1] } # Extract the last character (suit) from each card
    suits.uniq.length == 1 # Check if there is only one unique suit in the hand
  end

  def full_house?(processed_hand)
    # Count the occurrences of each card rank
    ranks = processed_hand.map { |card| card[0..-2] } # Extract the rank of each card
    rank_counts = card_ranks.tally

    # Check if there are two distinct ranks with counts 3 and 2
    rank_counts.values.sort == [2, 3]
  end

  def four_of_a_kind?(processed_hand)
    ranks = processed_hand.map { |card| card[0..-2] } # Extract the ranks from the cards
    
    # Count the occurrence of each rank in the hand
    rank_counts = Hash.new(0)
    ranks.each { |rank| rank_counts[rank] += 1 }
    
    # Check if any rank appears four times
    rank_counts.any? { |_, count| count == 4 }
  end

  def straight_flush?(processed_hand)
    ranks = processed_hand.map { |card| card[0..-2] }
    suits = processed_hand.map { |card| card[-1] }

    sorted_ranks = ranks.sort_by { |rank| rank_value(rank) }
    consecutive_ranks = sorted_ranks.map { |rank| rank_value(rank) }.each_cons(2).all? { |a, b| b == a + 1 }

    same_suit = suits.uniq.length == 1

    consecutive_ranks && same_suit
  end

  def rank_value(rank)
    case rank
    when "A" then 14
    when "K" then 13
    when "Q" then 12
    when "J" then 11
    else rank.to_i
    end
  end

  def five_of_a_kind?(processed_hand)
    card_counts = Hash.new(0)

    # Count the occurrences of each card value
    processed_hand.each do |card|
      card_value = card.chop
      card_counts[card_value] += 1
    end

    # Check if any card value has a count of 4 and the fifth card is "JKR"
    card_counts.values.include?(4) && processed_hand.include?("JKR")
  end
end
