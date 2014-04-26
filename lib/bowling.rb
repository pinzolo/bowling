# -*- coding: utf-8 -*-

# game
# frame
# score

class Bowling
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
  def self.score(game)
    filtered_game = game.dup
    filtered_game.gsub!(/-/, ':-')

    flames = eval(filtered_game)
    flames.inject(0) { |score, flame|
      score1 = flame[0]
      score1 = 0 if score1 == :-
      score2 = flame[1]
      score2 = 0 if score2 == :-
      
      score + score2 + score1
    }
  end
end
