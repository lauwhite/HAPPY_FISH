require 'test_helper'

class OnboardingQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get onboarding_question_show_url
    assert_response :success
  end

end
