require 'test_helper'

class AnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get q1" do
    get analysis_q1_url
    assert_response :success
  end

  test "should get q2" do
    get analysis_q2_url
    assert_response :success
  end

  test "should get q3" do
    get analysis_q3_url
    assert_response :success
  end

  test "should get q4" do
    get analysis_q4_url
    assert_response :success
  end

  test "should get q5" do
    get analysis_q5_url
    assert_response :success
  end

  test "should get result_page" do
    get analysis_result_page_url
    assert_response :success
  end

end
