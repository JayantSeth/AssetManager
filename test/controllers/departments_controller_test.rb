require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department = Department.create(department: "IT") 
    @admin_user = User.create(username: "jet1", email: "jet1@example.com", password: "password", 
                              admin: true, approved: true)
    sign_in_as(@admin_user)
  end

  test "should get index" do
    get departments_url
    assert_response :success
  end

  test "should get new" do 
    get new_department_url
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      post departments_url, params: { department: { department: "HR", comment: "" } }
    end

    assert_redirected_to departments_url
  end

  test "should show department" do
    get department_url(@department)
    assert_response :success
  end

  test "should get edit" do
    get edit_department_url(@department)
    assert_response :success
  end

  test "should update department" do
    post departments_url(@department), params: { department: { department: "Information Technology", comment: @department.comment } }
    assert_redirected_to departments_url
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      delete department_url(@department)
    end

    assert_redirected_to departments_url
  end
end
