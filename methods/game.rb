# frozen_string_literal: false

require_relative 'rules'

# TicTacToe Class
class TicTacToe < Rules
  def loop_winner
    loop do
      display
      draw_turn
      rules
    end
  end
end
