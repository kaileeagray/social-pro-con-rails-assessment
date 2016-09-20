require 'test_helper'

class ListTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @list = @user.lists.build(title: "Lorem ipsum", description: "I LIKE PIZZA SO MUCH.")
  end

  test "should be valid" do
    assert @list.valid?
  end

  test "user id should be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end

  test "title should be present" do
    @list.title = "    "
    assert_not @list.valid?
  end

  test "title should be at most 80 characters" do
    @list.title = "a"*81
    assert_not @list.valid?
  end

  test "description is optional" do
    @list.description = "    "
    assert @list.valid?
  end

  test "description should be at most 280 characters" do
    @list.description = "a"*281
    assert_not @list.valid?
  end

  test "order should be most recent first" do
    assert_equal lists(:most_recent), List.first
  end

end
