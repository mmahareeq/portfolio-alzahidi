require "test_helper"

class Admin::BannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_banner = admin_banners(:one)
  end

  test "should get index" do
    get admin_banners_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_banner_url
    assert_response :success
  end

  test "should create admin_banner" do
    assert_difference("Admin::Banner.count") do
      post admin_banners_url, params: { admin_banner: { link: @admin_banner.link, name: @admin_banner.name } }
    end

    assert_redirected_to admin_banner_url(Admin::Banner.last)
  end

  test "should show admin_banner" do
    get admin_banner_url(@admin_banner)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_banner_url(@admin_banner)
    assert_response :success
  end

  test "should update admin_banner" do
    patch admin_banner_url(@admin_banner), params: { admin_banner: { link: @admin_banner.link, name: @admin_banner.name } }
    assert_redirected_to admin_banner_url(@admin_banner)
  end

  test "should destroy admin_banner" do
    assert_difference("Admin::Banner.count", -1) do
      delete admin_banner_url(@admin_banner)
    end

    assert_redirected_to admin_banners_url
  end
end
