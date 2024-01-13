# frozen_string_literal: false

# class for displa
class Display
  def initialize
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
end
