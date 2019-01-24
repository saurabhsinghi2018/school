require 'test_helper'

class GradesControllerTest < ActionController::TestCase
  setup do
    @section = sections(:one)
    @grade = grades(:one)
  end

  test "should get index" do
    get :index, params: { section_id: @section }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { section_id: @section }
    assert_response :success
  end

  test "should create grade" do
    assert_difference('Grade.count') do
      post :create, params: { section_id: @section, grade: @grade.attributes }
    end

    assert_redirected_to section_grade_path(@section, Grade.last)
  end

  test "should show grade" do
    get :show, params: { section_id: @section, id: @grade }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { section_id: @section, id: @grade }
    assert_response :success
  end

  test "should update grade" do
    put :update, params: { section_id: @section, id: @grade, grade: @grade.attributes }
    assert_redirected_to section_grade_path(@section, Grade.last)
  end

  test "should destroy grade" do
    assert_difference('Grade.count', -1) do
      delete :destroy, params: { section_id: @section, id: @grade }
    end

    assert_redirected_to section_grades_path(@section)
  end
end
