# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'can see homepage' do
    get root_path
    assert_response :success
  end

  test 'post route' do
    post root_path,
         params: { latitude: '52.494857', longitude: '13.437641' }
    assert_response :success
  end

  test 'post route blank request' do
    post root_path,
         params: { latitude: '', longitude: '' }
    assert_redirected_to root_path
  end

  test 'post route bad request (non-number)' do
    post root_path,
         params: { latitude: 'asd', longitude: 'asd' }
    assert_redirected_to root_path
  end
end
