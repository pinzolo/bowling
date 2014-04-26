# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling::Game do
  context "with flames that has score 2" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game_str) { "[[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(game_str) }
    its(:score) { should eq 20 }
  end

  context "with flames that has gutter" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game_str) { "[[-,-],[-,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(game_str) }
    its(:score) { should eq 16 }
  end

  context "with flames that has spare" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game_str) { "[[1,1],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     13    15    17    19    21    23    25    27    29
    subject { Bowling::Game.new(game_str) }
    its(:score) { should eq 29 }
  end

  context "with flames that has a strike!!" do
    #              1     2    3     4     5     6     7     8     9     10
    let(:game_str) { "[[1,1],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     14   16    18    20    22    24    26    28    30
    subject { Bowling::Game.new(game_str) }
    its(:score) { should eq 30 }
  end

  context "with flames that has 2 strikes!!" do
    #              1     2    3   4     5     6     7     8     9     10
    let(:game_str) { "[[1,1],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     23   35  37    39    41    43    45    47    49
    subject { Bowling::Game.new(game_str) }
    its(:score) { should eq 49 }
  end
end
