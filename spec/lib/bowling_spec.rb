# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling::Game do
  subject { Bowling::Game.new }

  context "with flames that has score 2" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game) { "[[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    it { expect(subject.score(game)).to eq 20 }
  end

  context "with flames that has gutter" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game) { "[[-,-],[-,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    it { expect(subject.score(game)).to eq 16 }
  end

  context "with flames that has spare" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game) { "[[1,1],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     13    15    17    19    21    23    25    27    29
    it { expect(subject.score(game)).to eq 29 }
  end

  context "with flames that has strike!!" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:game) { "[[1,1],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     14    16    18    20    22    24    26    28    30
    it { expect(subject.score(game)).to eq 30 }
  end
end
