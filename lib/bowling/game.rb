# -*- coding: utf-8 -*-

# game
# frame
# score

module Bowling
  class Game
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
    def initialize(score_note)
      unless /\A[ \dX\/,\[\]-]+\z/.match(score_note)
        raise ArgumentError, "score_note is invalid format."
      end

      @score_note = score_note
      frames.each { |frame| scorer.score(frame) }
    end

    def score
      frames.inject(0) { |total, frame| total += frame.score }
    end

    def results
      total = 0
      frames.map { |frame| total += frame.score }.join(',')
    end

    def frames
      @frames ||= raw_frame_scores.map do |frame|
        raw_frame_scores.last != frame ?  Frame.new(frame) : LastFrame.new(frame)
      end
    end

    private

    def scorer
      @scorer ||= Scorer.new
    end

    def filtered_score_note
      @score_note.dup
        .gsub('-', ':-')
        .gsub('/', ':/')
        .gsub('X', ':X')
    end

    def raw_frame_scores
      @raw_frame_scores ||= eval(filtered_score_note)
    end
  end
end
