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
    let(:score_note) { "[[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 20 }
    its(:results) { should eq "2,4,6,8,10,12,14,16,18,20" }
  end

  context "with flames that has gutter" do
    let(:score_note) { "[[-,-],[-,-],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 16 }
    its(:results) { should eq "0,0,2,4,6,8,10,12,14,16" }
  end

  context "with flames that has spare" do
    let(:score_note) { "[[1,1],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 29 }
    its(:results) { should eq "2,13,15,17,19,21,23,25,27,29" }
  end

  context "with flames that has a strike!!" do
    let(:score_note) { "[[1,1],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 30 }
    its(:results) { should eq "2,14,16,18,20,22,24,26,28,30" }
  end

  context "with flames that has 2 strikes!!" do
    let(:score_note) { "[[1,1],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 49 }
    its(:results) { should eq "2,23,35,37,39,41,43,45,47,49" }
  end

  context "with flames that has turkey!!" do
    let(:score_note) { "[[1,1],[X],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 77 }
    its(:results) { should eq "2,32,53,65,67,69,71,73,75,77" }
  end

  context "with flames that has 4 strikes!!" do
    let(:score_note) { "[[1,1],[X],[X],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 105 }
    its(:results) { should eq "2,32,62,83,95,97,99,101,103,105" }
  end

  context "with flames that has spare-spare" do
    let(:score_note) { "[[1,1],[1,/],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 38 }
    its(:results) { should eq "2,13,24,26,28,30,32,34,36,38" }
  end

  context "with flames that has spare-spare-spare" do
    let(:score_note) { "[[1,1],[1,/],[1,/],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 47 }
    its(:results) { should eq "2,13,24,35,37,39,41,43,45,47" }
  end

  context "with flames that has spare-strike" do
    let(:score_note) { "[[1,1],[1,/],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 48 }
    its(:results) { should eq "2,22,34,36,38,40,42,44,46,48" }
  end

  context "with flames that has spare-strike-strike" do
    let(:score_note) { "[[1,1],[1,/],[X],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 67 }
    its(:results) { should eq "2,22,43,55,57,59,61,63,65,67" }
  end

  context "with flames that has strike-spare" do
    let(:score_note) { "[[1,1],[X],[1,/],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 47 }
    its(:results) { should eq "2,22,33,35,37,39,41,43,45,47" }
  end

  context "with flames that has strike-spare-strike" do
    let(:score_note) { "[[1,1],[X],[1,/],[X],[1,1],[1,1],[1,1],[1,1],[1,1],[1,1]]" }
    subject { Bowling::Game.new(score_note) }
    its(:score) { should eq 66 }
    its(:results) { should eq "2,22,42,54,56,58,60,62,64,66" }
  end
end
