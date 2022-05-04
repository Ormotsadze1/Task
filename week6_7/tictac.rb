# frozen_string_literal: true

class TicTacToeService
  class AttributeError < StandardError; end
  NUMBERS = '1-9'
  TRAYS = (1..9).freeze

  def initialize
    @board = TRAYS.to_a
    @switched = false
  end

  def call
    display_board
    playing_game
  end

  private

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def first_player
    puts 'First player(X) your turn(Choose a free slot)'
    @number_one = gets.chomp.to_i
  end

  def check_first
    if @board[@number_one - 1].is_a? Integer
      @board[@number_one - 1] = 'X'
      @switched = true
    end
  end

  def second_player
    puts 'Second player(O) your turn(Choose a free slot)'
    @number_two = gets.chomp.to_i
  end

  def check_second
    if @board[@number_two - 1].is_a? Integer
      @board[@number_two - 1] = 'O'
      @switched = true
    end
  end

  def consider_the_first
    loop do
      @switched = false
      first_player
      check_first
      break if @switched == true
    end
    display_board
  end

  def consider_the_second
    loop do
      @switched = false
      second_player
      check_second
      break if @switched == true
    end
    display_board
  end

  def full?
    @board.join('').count(NUMBERS).zero?
  end

  def winning_combination
    @result = if @board[0] == @board[1] && @board[0] == @board[2]
                "Winner is #{@board[0]}"
              elsif @board[3] == @board[4] && @board[3] == @board[5]
                "Winner is #{@board[3]}"
              elsif @board[6] == @board[7] && @board[6] == @board[8]
                "Winner is #{@board[6]}"
              elsif @board[0] == @board[3] && @board[0] == @board[6]
                "Winner is #{@board[0]}"
              elsif @board[1] == @board[4] && @board[1] == @board[7]
                "Winner is #{@board[1]}"
              elsif @board[2] == @board[5] && @board[0] == @board[8]
                "Winner is #{@board[2]}"
              elsif @board[0] == @board[4] && @board[0] == @board[8]
                "Winner is #{@board[0]}"
              elsif @board[6] == @board[4] && @board[6] == @board[2]
                "Winner is #{@board[6]}"
              else
                'Result is draw'
              end
    @result
  end

  def playing_game
    loop do
      consider_the_first
      winning_combination
      break if full? || @result.include?('Winner')

      consider_the_second
      winning_combination
      break if @result.include?('Winner')
    end
    puts '', @result
  end
end

puts TicTacToeService.new.call

