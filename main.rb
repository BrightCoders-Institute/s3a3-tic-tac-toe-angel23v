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
    choose_number = 0
    matrix = Array.new(width) { Array.new(height) }
    (0...width).each do |i|
      (0...height).each do |j|
        matrix[i][j] = choose_number += 1
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
    @matrix[turno[0]][turno[1]] = player if @matrix[turno[0]][turno[1]].is_a?(Integer)
  end

  def request_player
    print 'Choose one number: '
    num = $stdin.gets.chomp.to_i

    validation(num)
  end

  def validation(number)
    numbers = [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]

    number > 9 ? request_player : numbers[number - 1]
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

  def rules
    @matrix.each_with_index do |colum, idx|
      break if first_rule(colum)

      break if sec_rule(idx, @player_one)
      break if sec_rule(idx, @player_two)

      break if third_rule(@player_one)
      break if third_rule(@player_two)
    end
  end

  def first_rule(colum)
    print "¡Winner! \n" if colum.join == 'XXX' || colum.join == 'OOO'
  end

  def sec_rule(idx, symbol)
    next_pos = @matrix[1][idx] == symbol
    sec_nex_pos = @matrix[2][idx] == symbol
    print "!Winner by fila¡ \n" if @matrix[0][idx] == symbol && next_pos && sec_nex_pos
  end

  def third_rule(symbol)
    next_pos = @matrix[1][1] == symbol

    sec_next_pos = @matrix[2][2] == symbol
    reverse_sec_pos = @matrix[2][0] == symbol

    first_pos = @matrix[0][0] == symbol
    reverse_firs_pos = @matrix[0][2] == symbol

    return unless next_pos

    print "Winner by Cross \n" if first_pos && sec_next_pos
    print "Winner by Cross \n" if reverse_firs_pos && reverse_sec_pos
  end

  def loop_winner
    loop do
      display
      draw_turn
      rules
    end
  end
end

a = TicTacToe.new(1)
a.loop_winner
