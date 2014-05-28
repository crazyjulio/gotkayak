require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index
    
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    sign_in @dadmin
    get :new
    
    assert_response :success
  end

  test "should create question" do
    sign_in @dadmin
    
    assert_difference('Question.count') do
      post :create, question: @question.attributes
    end
    assert_redirected_to question_path(assigns(:question))
  end

  test "should not create question with bad params" do
    sign_in @dadmin
    @question.answer = nil

    assert_no_difference('Question.count') do
      post :create, :question => @question.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:question).errors.messages[:answer]
  end

  test "should show question" do
    sign_in @dadmin
    get :show, id: @question
    
    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, id: @question
    
    assert_response :success
  end

  test "should update question" do
    sign_in @dadmin
    put :update, id: @question, question: @question.attributes
    
    assert_redirected_to question_path(assigns(:question))
  end

  test "should not update question with bad params" do
    sign_in @dadmin
    @question.answer = nil
    put :update, :id => @question.to_param, :question => @question.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:question).errors.messages[:answer]
  end

  test "should destroy question" do
    sign_in @dadmin
    
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end
    assert_redirected_to questions_path
  end
end
