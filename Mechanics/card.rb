module Mechanics
  class Card
    attr_accessor :rank, :suit
    #card = Card.new('k', 'Spade', 'Black')
    def initialize(rank, suit)
      @rank = rank
      @suit = suit
      @color = (suit =='Spades' || suit == 'Clubs') ? 'Black' : 'Red'
    end
  end

  class Deck
    attr_accessor :cards

    def initialize
      @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
      @suits = %w(Spades Diamonds Clubs Hearts)
      @cards = []
      generate_deck
    end

    def self.find_card(card)
      %w(A 2 3 4 5 6 7 8 9 10 J Q K).index(card.rank)
    end

    def generate_deck
      @suits.each do |suit|
        @ranks.each do |rank|
          @cards << Card.new(rank, suit)
        end
      end
    end
  end
end



