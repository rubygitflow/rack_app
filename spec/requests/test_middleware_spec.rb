# frozen_string_literal: true
require 'spec_helper'
require './app'
require './middleware/runtime'

RSpec.describe 'Middleware', type: :request do
  let(:rt_inp) { App.new  } 
  let(:app) { Runtime.new(rt_inp)  } 

  it "changes a headers" do
    get "/time?format=year,month,day,hour,minute"
    expect(last_response.headers['X-Runtime']).to be_truthy
  end
end
