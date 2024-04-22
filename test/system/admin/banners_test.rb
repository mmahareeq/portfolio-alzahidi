require "application_system_test_case"

class Admin::BannersTest < ApplicationSystemTestCase
  setup do
    @admin_banner = admin_banners(:one)
  end

  test "visiting the index" do
    visit admin_banners_url
    assert_selector "h1", text: "Banners"
  end

  test "should create banner" do
    visit admin_banners_url
    click_on "New banner"

    fill_in "Link", with: @admin_banner.link
    fill_in "Name", with: @admin_banner.name
    click_on "Create Banner"

    assert_text "Banner was successfully created"
    click_on "Back"
  end

  test "should update Banner" do
    visit admin_banner_url(@admin_banner)
    click_on "Edit this banner", match: :first

    fill_in "Link", with: @admin_banner.link
    fill_in "Name", with: @admin_banner.name
    click_on "Update Banner"

    assert_text "Banner was successfully updated"
    click_on "Back"
  end

  test "should destroy Banner" do
    visit admin_banner_url(@admin_banner)
    click_on "Destroy this banner", match: :first

    assert_text "Banner was successfully destroyed"
  end
end
