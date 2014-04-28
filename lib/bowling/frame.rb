# -*- coding: utf-8 -*-

module Bowling
  class Frame
    attr_accessor :score

    def initialize(frame)
      @frame = frame
    end

    def spare?
      score2 == :/
    end

    def strike?
      score1 == :X
    end

    def score1
      @frame[0]
    end

    def score2
      @frame[1]
    end

    def pin_count1
      if score1 == :-
        0
      elsif score1 == :X
        10
      else
        score1
      end
    end

    def pin_count2
      if score2 == :-
        0
      elsif score2 == :/
        10 - score1
      else
        score2
      end
    end
  end
end
