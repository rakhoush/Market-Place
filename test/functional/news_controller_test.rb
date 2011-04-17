require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => New.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    New.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    New.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to new_url(assigns(:new))
  end

  def test_edit
    get :edit, :id => New.first
    assert_template 'edit'
  end

  def test_update_invalid
    New.any_instance.stubs(:valid?).returns(false)
    put :update, :id => New.first
    assert_template 'edit'
  end

  def test_update_valid
    New.any_instance.stubs(:valid?).returns(true)
    put :update, :id => New.first
    assert_redirected_to new_url(assigns(:new))
  end

  def test_destroy
    new = New.first
    delete :destroy, :id => new
    assert_redirected_to news_url
    assert !New.exists?(new.id)
  end
end
