require File.join(File.dirname(__FILE__), '..', 'test_helper.rb')
class StaticPagesControllerTest < ActionController::TestCase
  def test_should_show_title
    get :about_us
    assert_select "title", 'About Us : Trunk Films'
  end
end