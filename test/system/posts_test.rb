require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Address", with: @post.address
    fill_in "Branward", with: @post.branward
    fill_in "Descript", with: @post.descript
    fill_in "Integer", with: @post.integer
    fill_in "Price", with: @post.price
    fill_in "References", with: @post.references
    fill_in "Status", with: @post.status
    fill_in "String", with: @post.string
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Address", with: @post.address
    fill_in "Branward", with: @post.branward
    fill_in "Descript", with: @post.descript
    fill_in "Integer", with: @post.integer
    fill_in "Price", with: @post.price
    fill_in "References", with: @post.references
    fill_in "Status", with: @post.status
    fill_in "String", with: @post.string
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
