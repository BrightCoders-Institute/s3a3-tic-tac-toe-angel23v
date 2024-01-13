# frozen_string_literal: false

require 'minitest/autorun'

require_relative 'main'

# class for test
class TestGame < Minitest::Test
  def test_winnerbycolumn
    a = TicTacToe.new
    game = [[1, 'O', 'X'], ['X', 'X', 'X'], ['O', 8, 'X']]

    assert_equal true, a.first_rule(game[1])
    # assert_equal true, a.first_rule(game[2])
  end

  def test_winner_by_fila
    a = TicTacToe.new
    game = [['O', 'X', 3], ['O', 5, 'O'], ['O', 8, 'X']]

    assert_equal true, a.sec_rule(game, 0, 'O')
  end

  def test_winenr_by_cross
    a = TicTacToe.new
    game = [['X', 2, 'O'], ['O', 'X', 6], [7, 'O', 'X']]

    assert_equal true, a.third_rule(game, 'X')
  end

  def test_winner_by_cross_rev
    a = TicTacToe.new
    game = [['X', 2, 'O'], ['X', 'O', 6], ['O', 'X', 9]]

    assert_equal true, a.third_rule(game, 'O')
  end

  def test_not_winner_column
    a = TicTacToe.new
    game = [['O', 2, 'X'], [4, 'X', 'X'], ['O', 'O', 9]]

    assert_equal false, a.first_rule(game[2])
  end

  def test_not_winner_by_fila
    a = TicTacToe.new
    game = [['O', 'X', 3], [4, 'X', 'O'], ['O', 8, 'X']]

    assert_equal false, a.sec_rule(game, 1, 'O')
  end

  def test_not_winnner_by_cross
    a = TicTacToe.new
    game = [['X', 'O', 3], [4, 'X', 'O'], ['O', 8, 9]]

    assert_equal false, a.third_rule(game, 'X')
  end

  def test_not_winner_by_cross_rev
    a = TicTacToe.new
    game = [[1, 'X', 'O'], ['X', 'O', 6], ['O', 8, 'X']]

    assert_equal false, a.third_rule(game, 'X')
  end

  def test_overwrite
    a = TicTacToe.new
    game = [[1, 'X', 'O'], ['X', 5, 6], ['O', 8, 'X']]
    assert_equal 'X', a.turn(game, [1, 1], 'X')
  end

  def test_not_overwrite
    a = TicTacToe.new
    game = [[1, 'X', 'O'], ['X', 5, 6], ['O', 8, 'X']]
    assert_equal false, a.turn(game, [0, 1], 'O')
  end
end
