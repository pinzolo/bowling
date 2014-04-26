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
    def score(game)
      @game_str = game

      total_score = 0
      last_flame = nil
      last_last_flame = nil

      flames do |flame|
        unless flame.strike?
          score1 = flame.score1
          score1 = 0 if score1 == :-

          if last_flame && last_flame.spare?
            total_score += 10 + score1
          end
          score2 = flame.score2
          score2 = 0 if score2 == :-
          if last_flame && last_flame.strike?
            if last_last_flame && last_last_flame.strike?
              total_score += 20 + score1
            end
            total_score += 10 + score1 + score2
          end

          if !flame.spare? and !flame.strike?
            total_score += score2 + score1
          end
        end

        last_last_flame = last_flame
        last_flame = flame
      end

      total_score
    end

    def flames
      return @flames if defined?(@flames)

      filtered_game = @game_str.dup
      filtered_game.gsub!(%r{-}, ':-')
      filtered_game.gsub!(%r{/}, ':/')
      filtered_game.gsub!('X', ':X')

      flames_ = eval(filtered_game)

      @flames = flames_.map { |flame| Flame.new(flame) }
    end
  end
end
