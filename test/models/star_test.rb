require 'test_helper'

class StarTest < ActiveSupport::TestCase

  def setup
    @star = Star.new(list: lists(:orange), starrer: users(:kailee))
  end

  test "should be valid" do
    assert @star.valid?
  end

  test "should require a starrer_id" do
    @star.starrer_id = nil
    assert_not @star.valid?
  end

  test "should require a list" do
    @star.list = nil
    assert_not @star.valid?
  end
end
