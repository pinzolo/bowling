# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling::Game do
  context "with invalid score note" do
    let(:score_note) { "[[1,1],[A,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    it "failure initialization" do
      expect { Bowling::Game.new(score_note) }.to raise_error ArgumentError
    end
  end
  context "with flames that has score 2" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:score_note) { "[[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 20 }
  end

  context "with flames that has gutter" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:score_note) { "[[-,-],[-,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 16 }
  end

  context "with flames that has spare" do
    #              1     2     3     4     5     6     7     8     9     10
    let(:score_note) { "[[1,1],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     13    15    17    19    21    23    25    27    29
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 29 }
  end

  context "with flames that has a strike!!" do
    #              1     2    3     4     5     6     7     8     9     10
    let(:score_note) { "[[1,1],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     14   16    18    20    22    24    26    28    30
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 30 }
    its(:results) { "2,14,16,18,20,22,24,26,28,30" }
  end

  context "with flames that has 2 strikes!!" do
    #              1     2    3   4     5     6     7     8     9     10
    let(:score_note) { "[[1,1],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    # score        2     23   35  37    39    41    43    45    47    49
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 49 }
    its(:results) { "2,23,35,37,39,41,43,45,47,49" }
  end
end
