# -*- coding: utf-8 -*-

module Bowling
  class Frame
    attr_accessor :score
    attr_accessor :total_score

    def initialize(frame)
      @frame = frame
    end

    def spare?
      @frame[1] == :/
    end

    def strike?
      @frame[0] == :X
    end

    def score1
      @frame[0]
    end

    def score2
      @frame[1]
    end
  end
end
