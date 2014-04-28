# coding: utf-8
module Bowling
  class LastFrame < Frame
    def score3
      @frame[2]
    end

    def pin_count2
      if score2 == :-
        0
      elsif score2 == :/
        PIN_TOTAL - score1
      elsif score2 == :X
        PIN_TOTAL
      else
        score2
      end
    end

    def pin_count3
      if score3 == :-
        0
      elsif score3 == :/
        PIN_TOTAL - score2
      elsif score3 == :X
        PIN_TOTAL
      else
        score3
      end
    end

    def spare?
      score2 == :/ || score3 == :/
    end

    def strike?
      score1 == :X || score2 == :X || score3 == :X
    end

    def score
      if score1 == :X
        if score2 == :X
          if score3 == :X
            TURKEY_BONUS
          else
            DOUBLE_BONUS + pin_count3
          end
        else
          if score3 == :/
            DOUBLE_BONUS
          else
            SINGLE_BONUS + pin_count2 + pin_count3
          end
        end
      else
        if score2 == :/
          if score3 == :X
            DOUBLE_BONUS
          else
            SINGLE_BONUS + pin_count3
          end
        else
          pin_count1 + pin_count2
        end
      end
    end
  end
end
