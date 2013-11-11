require 'spec_helper'

describe Event do
  context "validations" do
    context "date" do
      it { should validate_presence_of :date }
      pending "Event is not saved if the event date is in the past."
      pending "Event is not saved if the event date is not a valid date."
    end

    context "title" do
      pending "Event is not saved if the event title is empty."
      pending "Event is not saved if the event title is already taken."
    end

    context "organizer_name" do
      pending "Event is not saved if the event organizer name is empty."
    end

    context "organizer_email" do
      pending "Event is not saved if the format of the event organizer email address is invalid"
      # note: comprehensive validation of email format is *very* complex
      # it's sufficient here to just check the basics
    end
  end
end

