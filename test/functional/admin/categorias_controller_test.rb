require 'test_helper'

class Admin::CategoriasControllerTest < ActionController::TestCase
  test "should get Admin::Productos" do
    get :Admin::Productos
    assert_response :success
  end

  test "should get Admin::Admins" do
    get :Admin::Admins
    assert_response :success
  end

end
