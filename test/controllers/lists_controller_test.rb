require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @list = lists(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'List.count' do
      post lists_path, params: {list: { title: "Love you"}}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'List.count' do
      delete list_path(@list)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong list" do
    log_in_as(users(:michael))
    list = lists(:ants)
    assert_no_difference 'List.count' do
      delete list_path(list)
    end
    assert_redirected_to root_url
  end
end
