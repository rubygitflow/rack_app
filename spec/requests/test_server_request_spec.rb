# frozen_string_literal: true
require 'spec_helper'
require './app'

RSpec.describe 'Application', type: :request do
  let(:app) { App.new  } 

  it "returns the status 200" do
    get "/time?format=year,month,day,hour,minute"
    expect(last_response.status).to eq 200
  end

  it "brings the answer" do
    get "/time?format=year,month,day,hour,minute"
    expect(last_response.body).to be_truthy
    expect(last_response.body).to include("-")
  end

  it "returns the status 400" do
    get "/time"
    expect(last_response.status).to eq 400
  end

  it "returns the status 404" do
    get "/team"
    expect(last_response.status).to eq 404
  end
end
