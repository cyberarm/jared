require_relative '../spec_helper'
require 'jared/helpers/map.rb'

describe Helpers do
  it "#map should respond open a browser to PLACE" do
    a=open("http://maps.google.com/?q=google+ca").read
    if a.include?('google ca')
    else
      fail
    end
  end
end