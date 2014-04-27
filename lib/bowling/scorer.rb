# coding: utf-8
module Bowling
  class Scorer
    def score(frame)
      if frame.strike?
        on_strike(frame)
      elsif frame.spare?
        on_spare(frame)
      else
        on_normal_point(frame)
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
      held_frames.shift.score = 10 + frame.pin_count1
    end

    def strike(frame)
      held_frames.shift.score = 10 + frame.pin_count1 + frame.pin_count2
    end

    def strike_strike(frame)
      held_frames.shift.score = 20 + frame.pin_count1
      strike(frame)
    end

    def turkey
      held_frames.shift.score = 30
    end

    def spare_strike
      held_frames.shift.score = 20
      @state = 'strike'
    end

    def strike_spare
      held_frames.shift.score = 20
      @state = 'spare'
    end

    def strike_strike_spare(frame)
      held_frames.shift.score = 20 + frame.pin_count1
      strike_spare
    end

    def append_state(new_state)
      if @state
        @state << "_#{new_state}"
      else
        @state = new_state
      end
    end
  end
end
