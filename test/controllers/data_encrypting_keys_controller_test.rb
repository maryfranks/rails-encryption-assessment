require 'test_helper'

class DataEncryptingKeysControllerTest < ActionController::TestCase

  setup do
    @datakey = DataEncryptingKey.new(key: "hello I'm a string", primary: true)
    @datakey.save
  end

  test "POST #rotate saves new DataEncryptingKey" do
    assert_difference "DataEncryptingKey.count" do
      post :rotate, data_encrypting_key: {key: "this is a really really long string"}
    end

    assert_response :success
  end

  test "POST #rotate sets old keys primary to false" do
    skip 
    post :rotate, data_encrypting_key: {key: "I've got a lovely bunch of coconuts"}

    assert_equal false, @datakey.primary
  end

  test "GET #status renders a json object" do
    get :status
    json = JSON.parse(response.body)
    assert_equal "this is a status", json["message"]
  end

end
