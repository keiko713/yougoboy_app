require "minitest_helper"

describe Game do
  before do
    @game = Game.new
  end

  it "must be valid" do
    @game.valid?.must_equal true
  end
end
