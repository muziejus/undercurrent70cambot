# frozen_string_literal: true
require 'spec_helper'

describe CamOnHudson do

  let(:cam){ CamOnHudson.new }

  context "#initialize" do
    context "loads the day's schedule" do
      it "as @schedule" do
        expect(cam.instance_variable_get(:@schedule)).not_to be_nil
      end
    end
    it "loads the day's schedule, in a file called yyyy-mm-dd-schedule.yml"
    it "builds a schedule if none exists"
  end

end
