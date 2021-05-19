require "category_helper"

class CategoriesControllerCategory < ActionDispatch::IntegrationCategory
  setup do
    @category = categories(:one)
  end

  category "should get index" do
    get categories_url
    assert_response :success
  end

  category "should get new" do
    get new_category_url
    assert_response :success
  end

  category "should create category" do
    assert_difference('category.count') do
      post categories_url, params: { category: {  } }
    end

    assert_redirected_to category_url(category.last)
  end

  category "should show category" do
    get category_url(@category)
    assert_response :success
  end

  category "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  category "should update category" do
    patch category_url(@category), params: { category: {  } }
    assert_redirected_to category_url(@category)
  end

  category "should destroy category" do
    assert_difference('category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
