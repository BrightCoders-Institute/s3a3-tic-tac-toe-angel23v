# frozen_string_literal: false

# TicTacToe Class
class TicTacToe
  attr_accessor :space, :space_two

  def initialize(space)
    @space = space
    @player_one = 'X'
    @player_two = 'O'
    @width = 3
    @height = 3
    @matrix = start_matrix(@width, @height)
    @flag = true
  end

  def start_matrix(width, height)
    matrix = Array.new(width) { Array.new(height) }
    (0...width).each do |i|
      (0...height).each do |j|
        matrix[i][j] = '-' # '██'
      end
    end
    matrix
  end

  def display
    @matrix.each do |colum|
      colum.each do |block|
        print block
      end
      puts ''
    end
  end

  def turn(turno, player)
    @matrix[turno[0]][turno[1]] = player
  end

  def request_player
    print 'Choose coordinate x: '
    position = $stdin.gets.chomp.to_i
    print 'Choose coordinate y: '
    position_two = $stdin.gets.chomp.to_i

    validation(position, position_two)
  end

  def validation(number_one, number_two)
    if number_one <= 2 && number_one >= 0 && number_two <= 2 && number_two >= 0
      [number_one, number_two]
    else
      print "Coordinate beetween 0 and 3 \n"
      request_player
    end
  end

  def change_turns
    @flag ? @player_one : @player_two
  end

  def draw_turn
    print "Player #{@flag ? 'One' : 'Two'} \n"
    play = request_player
    turn(play, change_turns)
    @flag = !@flag
  end
end

a = TicTacToe.new(1)

puts ''
# a.turn([2, 2])
# a.display

a.draw_turn
a.display

a.draw_turn
a.display

a.draw_turn
a.display

a.draw_turn
a.display
