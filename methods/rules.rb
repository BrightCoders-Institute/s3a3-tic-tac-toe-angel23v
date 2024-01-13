# frozen_string_literal: false

require_relative 'turns'

# class for rules
class Rules < Turn
  def rules
    @matrix.each_with_index do |colum, idx|
      print "---Winner--- \n" if first_rule(colum)

      print "---Winner--- \n" if sec_rule(@matrix, idx, @player_one)
      print "---Winner--- \n" if sec_rule(@matrix, idx, @player_two)

      print "---Winner--- \n" if third_rule(@matrix, @player_one)
      print "---Winner--- \n" if third_rule(@matrix, @player_two)
    end
  end

  def first_rule(colum)
    colum.join == 'XXX' || colum.join == 'OOO'
  end

  def sec_rule(matrix, idx, symbol)
    next_pos = matrix[1][idx] == symbol
    sec_nex_pos = matrix[2][idx] == symbol
    matrix[0][idx] == symbol && next_pos && sec_nex_pos
  end

  def third_rule(matrix, symbol)
    next_pos = matrix[1][1] == symbol

    sec_next_pos = matrix[2][2] == symbol
    reverse_sec_pos = matrix[2][0] == symbol

    first_pos = matrix[0][0] == symbol
    reverse_firs_pos = matrix[0][2] == symbol

    # return unless next_pos

    next_pos && first_pos && sec_next_pos || next_pos && reverse_firs_pos && reverse_sec_pos
  end
end
