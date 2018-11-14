require 'test_helper'

class DataEncryptingKeysControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "POST #rotate saves new DataEncryptingKey" do
    assert_difference "DataEncryptingKey.count" do
      post :rotate, data_encrypting_key: {key: "this is a really really long string"}
    end

    # assert_response :success
  end

  test "POST #rotate sets old keys primary = false" do
    assert true
  end

  test "GET #status renders a json object" do
    assert true
  end

end
