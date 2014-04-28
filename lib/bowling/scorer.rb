# coding: utf-8
module Bowling
  class Scorer
    def score(frame)
      if frame.is_a?(LastFrame)
        last_frame_to_frames(frame).each { |f| score(f) }
      else
        if frame.strike?
          on_strike(frame)
        elsif frame.spare?
          on_spare(frame)
        else
          on_normal_point(frame)
        end
      end
    end

    private

    def on_strike(frame)
      held_frames << frame
      if @state == 'strike_strike'
        turkey
      elsif @state == 'spare'
        spare_strike
      else
        append_state('strike')
      end
    end

    def on_spare(frame)
      held_frames << frame
      if @state == 'spare'
        spare(frame)
      elsif @state == 'strike'
        strike_spare
      elsif @state == 'strike_strike'
        strike_strike_spare(frame)
      else
        append_state('spare')
      end
    end

    def on_normal_point(frame)
      if @state
        send(@state, frame)
        @state = nil
      end
      normal(frame)
    end

    def held_frames
      @held_frames ||= []
    end

    def normal(frame)
      frame.score = frame.pin_count1 + frame.pin_count2
    end

    def spare(frame)
      held_frames.shift.score = SINGLE_BONUS + frame.pin_count1
    end

    def strike(frame)
      held_frames.shift.score = SINGLE_BONUS + frame.pin_count1 + frame.pin_count2
    end

    def strike_strike(frame)
      held_frames.shift.score = DOUBLE_BONUS + frame.pin_count1
      strike(frame)
    end

    def turkey
      held_frames.shift.score = TURKEY_BONUS
    end

    def spare_strike
      held_frames.shift.score = DOUBLE_BONUS
      @state = 'strike'
    end

    def strike_spare
      held_frames.shift.score = DOUBLE_BONUS
      @state = 'spare'
    end

    def strike_strike_spare(frame)
      held_frames.shift.score = DOUBLE_BONUS + frame.pin_count1
      strike_spare
    end

    def append_state(new_state)
      if @state
        @state << "_#{new_state}"
      else
        @state = new_state
      end
    end

    def last_frame_to_frames(last_frame)
      frames = []
      if last_frame.score1 == :X
        frames << Frame.new([:X])
        if last_frame.score2 == :X
          frames << Frame.new([:X])
          frames << Frame.new([last_frame.score3,:-])
        else
          frames << Frame.new([last_frame.score2, last_frame.score3])
        end
      else
        frames << Frame.new([last_frame.score1, last_frame.score2])
        if last_frame.score2 == :/
          frames << Frame.new([last_frame.score3,:-])
        end
      end
      frames
    end
  end
end
