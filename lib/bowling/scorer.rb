# coding: utf-8
module Bowling
  class Scorer
    def score(frame)
      if frame.strike?
        held_frames << frame
        if @state == 'strike_strike'
          turkey
        else
          append_state('strike')
        end
      elsif frame.spare?
        held_frames << frame
        append_state('spare')
      else
        if @state
          send(@state, frame)
          @state = nil
        end
        normal(frame)
      end
    end

    private

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

    def spare_strike(frame)
      held_frames.shift.score = 20
      strike(frame)
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
