# frozen_string_literal: true
require 'spec_helper'

describe CamOnHudson do

  let(:cam){ 
    CamOnHudson.new 
  }

  context "#initialize" do

    context "loads the configs" do

      it "as @configs" do
        expect(cam.instance_variable_get :@configs ).not_to be_nil
      end

      it "which is a Hash" do
        expect(cam.instance_variable_get :@configs ).to be_a Hash
      end

    end

  end

  context "@configs" do

    let(:configs){ CamOnHudson.new.instance_variable_get(:@configs) }

    context "When there is no 'configs.yml'" do
      it "'configs.yml' is created anew" do
        config_file = "configs.yml"
        File.delete(config_file)
        CamOnHudson.new
        expect(File.exists? config_file).to be true
      end
    end

    it "has a :sun_schedule" do
      expect(configs.keys.include? :sun_schedule).to be true
    end

    context ":sun_schedule" do
      it "has the keys :sunrise and :sunset" do
        expect(configs[:sun_schedule].keys).to contain_exactly :sunrise, :sunset
      end

      it "which are Times" do
        types = configs[:sun_schedule].values.select{ |v| v.class != Time }
        expect(types.length).to eq 0
      end

      it "which are in the local time zone" do
        offset = Time.now.utc_offset
        zones = configs[:sun_schedule].values.select{ |v| v.utc_offset != offset }
        puts zones
        expect(zones.length).to eq 0
      end
    end

  end

end
