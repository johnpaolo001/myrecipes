require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "homer", email: "homer@example.com",
                        password: "password", password_confirmation: "password")
  end

  test "should get chefs index" do
    get chefs_path
    assert_response :success
  end

  test "should get chefs listing" do
    get chefs_path
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.capitalize
  end
end
