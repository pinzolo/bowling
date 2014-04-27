# -*- coding: utf-8 -*-

# game
# frame
# score

module Bowling
  class Game
    def initialize(score_note)
      unless /\A[\dX\/,\[\]-]+\z/.match(score_note)
        raise ArgumentError, "score_note is invalid format."
      end
      @score_note = score_note
      scorer = Scorer.new
      frames.each { |frame| scorer.score(frame) }
    end

    # == Parameters:
    #
    # game: "[[1,1],[2,3],...]"
    #
    # ex.
    # [[5,3],[7,2],[8,/],[X],[7,1],[9,-],[6,2],[X],[6,/],[8,-]]
    # score: 126
    #
    # []: 1フレーム
    # n: 倒したピンの数
    # X: ストライク
    # /: スペア
    # -: ガター
    #
    def score
      frames.inject(0) { |total, frame| total += frame.score }
    end

    def results
      scores = []
      frames.each do |frame|
        scores << scores.last.to_i + frame.score
      end
      scores.join(',')
    end

    private

    def frames
      @frames ||= eval(filtered_score_note).map { |frame| Frame.new(frame) }
    end

    def filtered_score_note
      @score_note.dup
        .gsub('-', ':-')
        .gsub('/', ':/')
        .gsub('X', ':X')
    end
  end
end
