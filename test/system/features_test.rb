require "application_system_test_case"

class FeaturesTest < ApplicationSystemTestCase
  setup do
    @feature = features(:one)
  end

  test "visiting the index" do
    visit features_url
    assert_selector "h1", text: "Features"
  end

  test "should create feature" do
    visit features_url
    click_on "New feature"

    fill_in "Board", with: @feature.board_id
    fill_in "Category", with: @feature.category
    fill_in "Description", with: @feature.description
    fill_in "Title", with: @feature.title
    fill_in "User", with: @feature.user_id
    fill_in "Vote count", with: @feature.vote_count
    click_on "Create Feature"

    assert_text "Feature was successfully created"
    click_on "Back"
  end

  test "should update Feature" do
    visit feature_url(@feature)
    click_on "Edit this feature", match: :first

    fill_in "Board", with: @feature.board_id
    fill_in "Category", with: @feature.category
    fill_in "Description", with: @feature.description
    fill_in "Title", with: @feature.title
    fill_in "User", with: @feature.user_id
    fill_in "Vote count", with: @feature.vote_count
    click_on "Update Feature"

    assert_text "Feature was successfully updated"
    click_on "Back"
  end

  test "should destroy Feature" do
    visit feature_url(@feature)
    click_on "Destroy this feature", match: :first

    assert_text "Feature was successfully destroyed"
  end
end
