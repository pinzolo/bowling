# coding: utf-8
require_relative "../../../lib/bowling"

describe Bowling::LastFrame do
  context "with frames that has 2 scores" do
    subject { Bowling::LastFrame.new([2,7]) }

    describe "#score1" do
      its(:score1) { should eq 2 }
    end

    describe "#score2" do
      its(:score2) { should eq 7 }
    end

    describe "#score3" do
      its(:score3) { should be_nil }
    end

    describe "#pin_count1" do
      its(:pin_count1) { should eq 2 }
    end

    describe "#pin_count2" do
      its(:pin_count2) { should eq 7 }
    end

    describe "#pin_count3" do
      its(:pin_count3) { should be_nil }
    end

    describe "#spare?" do
      its(:spare?) { should be_false }
    end

    describe "#strike?" do
      its(:strike?) { should be_false }
    end

    describe "#score" do
      its(:score) { should eq 9 }
    end
  end

  context "with frames has spare" do
    context "when last throw is not strike" do
      subject { Bowling::LastFrame.new([2,:/,3]) }

      describe "#score1" do
        its(:score1) { should eq 2 }
      end

      describe "#score2" do
        its(:score2) { should eq :/ }
      end

      describe "#score3" do
        its(:score3) { should eq 3 }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 2 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 8 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 3 }
      end

      describe "#spare?" do
        its(:spare?) { should be_true }
      end

      describe "#strike?" do
        its(:strike?) { should be_false }
      end

      describe "#score" do
        its(:score) { should eq 13 }
      end
    end

    context "when last throw is strike" do
      subject { Bowling::LastFrame.new([2,:/,:X]) }

      describe "#score1" do
        its(:score1) { should eq 2 }
      end

      describe "#score2" do
        its(:score2) { should eq :/ }
      end

      describe "#score3" do
        its(:score3) { should eq :X }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 2 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 8 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 10 }
      end

      describe "#spare?" do
        its(:spare?) { should be_true }
      end

      describe "#strike?" do
        its(:strike?) { should be_true }
      end

      describe "#score" do
        its(:score) { should eq 20 }
      end
    end
  end

  context "with frames has strike" do
    context "when strike-normal-normal" do
      subject { Bowling::LastFrame.new([:X,2,3]) }

      describe "#score1" do
        its(:score1) { should eq :X }
      end

      describe "#score2" do
        its(:score2) { should eq 2 }
      end

      describe "#score3" do
        its(:score3) { should eq 3 }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 10 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 2 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 3 }
      end

      describe "#spare?" do
        its(:spare?) { should be_false }
      end

      describe "#strike?" do
        its(:strike?) { should be_true }
      end

      describe "#score" do
        its(:score) { should eq 15 }
      end
    end

    context "when strike-strike-normal" do
      subject { Bowling::LastFrame.new([:X,:X,3]) }

      describe "#score1" do
        its(:score1) { should eq :X }
      end

      describe "#score2" do
        its(:score2) { should eq :X }
      end

      describe "#score3" do
        its(:score3) { should eq 3 }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 10 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 10 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 3 }
      end

      describe "#spare?" do
        its(:spare?) { should be_false }
      end

      describe "#strike?" do
        its(:strike?) { should be_true }
      end

      describe "#score" do
        its(:score) { should eq 23 }
      end
    end

    context "when strike-normal-spare" do
      subject { Bowling::LastFrame.new([:X,2,:/]) }

      describe "#score1" do
        its(:score1) { should eq :X }
      end

      describe "#score2" do
        its(:score2) { should eq 2 }
      end

      describe "#score3" do
        its(:score3) { should eq :/ }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 10 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 2 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 8 }
      end

      describe "#spare?" do
        its(:spare?) { should be_true }
      end

      describe "#strike?" do
        its(:strike?) { should be_true }
      end

      describe "#score" do
        its(:score) { should eq 20 }
      end
    end

    context "when strike-strike-strike" do
      subject { Bowling::LastFrame.new([:X,:X,:X]) }

      describe "#score1" do
        its(:score1) { should eq :X }
      end

      describe "#score2" do
        its(:score2) { should eq :X }
      end

      describe "#score3" do
        its(:score3) { should eq :X }
      end

      describe "#pin_count1" do
        its(:pin_count1) { should eq 10 }
      end

      describe "#pin_count2" do
        its(:pin_count2) { should eq 10 }
      end

      describe "#pin_count3" do
        its(:pin_count3) { should eq 10 }
      end

      describe "#spare?" do
        its(:spare?) { should be_false }
      end

      describe "#strike?" do
        its(:strike?) { should be_true }
      end

      describe "#score" do
        its(:score) { should eq 30 }
      end
    end
  end
end
