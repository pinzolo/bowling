# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling do
  context "with flames that has score 2" do
    #        1     2     3     4     5     6     7     8     9     10
    game = "[[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]"
    it { expect(Bowling.score(game)).to eq 20 }
  end

  context "with flames that has gutter" do
    #        1     2     3     4     5     6     7     8     9     10
    game = "[[-,-],[-,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]"
    it { expect(Bowling.score(game)).to eq 16 }
  end
end
