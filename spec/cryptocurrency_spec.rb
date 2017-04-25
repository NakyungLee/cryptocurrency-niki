require "spec_helper"

RSpec.describe Cryptocurrency do
  it "has a version number" do
    expect(Cryptocurrency::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
