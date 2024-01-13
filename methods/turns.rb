# frozen_string_literal: false

require_relative 'display'

# class for turns
class Turn < Display
  def turn(matrix, turno, player)
    matrix[turno[0]][turno[1]].is_a?(Integer) ? matrix[turno[0]][turno[1]] = player : false
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
    turn(@matrix, play, change_turns)
    @flag = !@flag
  end
end
