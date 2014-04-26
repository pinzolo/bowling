# -*- coding: utf-8 -*-

module Bowling
  class Flame
    def initialize(flame)
      @flame = flame
    end

    def spare?
      @flame[1] == :/
    end

    def strike?
      @flame[0] == :X
    end

    def score1
      @flame[0]
    end

    def score2
      @flame[1]
    end

  end
end
