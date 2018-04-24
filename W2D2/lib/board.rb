require 'pry'
require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @current_player = @player1
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |cup, idx|
      [6, 13].include?(idx) ? [] : [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    valid_pos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    raise ArgumentError.new, "Invalid starting cup" unless valid_pos.include?(start_pos)
    real_pos = parse_input(start_pos)
    raise ArgumentError.new, "That cup is already empty. Choose again!" if cups[real_pos].length == 0
    true
  end

  def make_move(start_pos, current_player_name)
    @current_player = current_player_name
    pos = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    pos.rotate!(start_pos + 1)
    until cups[start_pos].empty?
      if (pos[0] == 13 && current_player_name == @player1) || (pos[0] == 6 && current_player_name == @player2)
        pos.rotate!
      else
        cups[pos[0]] << cups[start_pos].shift
        pos.rotate! unless cups[start_pos].empty?
      end
    end
    render
    next_turn(pos[0])
  end

  def parse_input(input)
    input <= 6 ? input - 1 : input
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move return
    if (@current_player == @player1 && ending_cup_idx == 6) || (@current_player == @player2 && ending_cup_idx == 13)
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|el| el.empty?} || cups[7..12].all? {|el| el.empty?}
  end

  def winner
    case cups[6].length <=> cups[13].length
    when 1
      @player1
    when 0
      :draw
    when - 1
      @player2
    end
  end
end
