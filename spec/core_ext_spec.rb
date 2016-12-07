require 'spec_helper'

describe 'to_squawk' do
  it "should prepend the word squawk!" do
    expect('Hello World'.to_squawk).to eq 'squawk! Hello World'
  end
end
