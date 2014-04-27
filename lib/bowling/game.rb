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
      total_score = 0
      last_frame = nil
      last_last_frame = nil

      frames.each do |frame|
        unless frame.strike?
          score1 = frame.score1
          score1 = 0 if score1 == :-

          if last_frame && last_frame.spare?
            total_score += 10 + score1
          end
          score2 = frame.score2
          score2 = 0 if score2 == :-
          if last_frame && last_frame.strike?
            if last_last_frame && last_last_frame.strike?
              total_score += 20 + score1
            end
            total_score += 10 + score1 + score2
          end

          if !frame.spare? and !frame.strike?
            total_score += score2 + score1
          end
        end

        last_last_frame = last_frame
        last_frame = frame
      end

      total_score
    end

    def frames
      @frames ||= eval(filtered_score_note).map { |frame| Frame.new(frame) }
    end

    def results
      frames.map(&:total_score).join(',')
    end

    private

    def filtered_score_note
      @score_note.dup
        .gsub('-', ':-')
        .gsub('/', ':/')
        .gsub('X', ':X')
    end
  end
end
