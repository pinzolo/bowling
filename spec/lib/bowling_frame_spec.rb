# -*- coding: utf-8 -*-

require_relative "../../lib/bowling"

describe Bowling::Frame do
  context "with frames that has 2 scores" do
    subject { Bowling::Frame.new([2,7]) }

    describe "#score1" do
      its(:score1) { should eq 2 }
    end

    describe "#score2" do
      its(:score2) { should eq 7 }
    end
  end

  describe "#spare?" do
    context "with a spare frame" do
      subject { Bowling::Frame.new([2,:/]) }
      its(:spare?) { should be_true }
    end

    context "with a non spare frame" do
      subject { Bowling::Frame.new([2,3]) }
      its(:spare?) { should be_false }
    end
  end

  describe "#strike?" do
    context "with a strike frame" do
      subject { Bowling::Frame.new([:X]) }
      its(:strike?) { should be_true }
    end

    context "with a non strike frame" do
      subject { Bowling::Frame.new([2,3]) }
      its(:strike?) { should be_false }
    end
  end

  describe "#pin_count1" do
    context "with a strike frame" do
      subject { Bowling::Frame.new([:X]) }
      its(:pin_count1) { should eq 10 }
    end

    context "with gutter" do
      subject { Bowling::Frame.new([:-, 3]) }
      its(:pin_count1) { should eq 0 }
    end

    context "with defeated pin count" do
      subject { Bowling::Frame.new([2,3]) }
      its(:pin_count1) { should eq 2 }
    end
  end

  describe "#pin_count2" do
    context "with a spare frame" do
      subject { Bowling::Frame.new([3, :/]) }
      its(:pin_count2) { should eq 7 }
    end

    context "with gutter" do
      subject { Bowling::Frame.new([4, :-]) }
      its(:pin_count2) { should eq 0 }
    end

    context "with defeated pin count" do
      subject { Bowling::Frame.new([2,3]) }
      its(:pin_count2) { should eq 3 }
    end
  end
end
