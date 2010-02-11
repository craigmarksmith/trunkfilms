require File.join(File.dirname(__FILE__), '..', 'test_helper.rb')
class MoviesControllerTest < ActionController::TestCase

  def test_should_show_title
    get :index
    assert_select "title", 'Trunk Films'
  end

end