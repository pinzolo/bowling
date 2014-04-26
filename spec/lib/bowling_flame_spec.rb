# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling::Flame do
  context "with flames that has 2 scores" do
    subject { Bowling::Flame.new([2,7]) }

    describe "#score1" do
      its(:score1) { should eq 2 }
    end

    describe "#score2" do
      its(:score2) { should eq 7 }
    end
  end

  describe "#spare?" do
    context "with a spare flame" do
      subject { Bowling::Flame.new([2,:/]) }
      its(:spare?) { should be_true }
    end

    context "with a non spare flame" do
      subject { Bowling::Flame.new([2,3]) }
      its(:spare?) { should be_false }
    end
  end

  describe "#strike?" do
    context "with a strike flame" do
      subject { Bowling::Flame.new([:X]) }
      its(:strike?) { should be_true }
    end

    context "with a non strike flame" do
      subject { Bowling::Flame.new([2,3]) }
      its(:strike?) { should be_false }
    end
  end
end
