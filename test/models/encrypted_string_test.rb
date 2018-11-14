require 'test_helper'

class EncryptedStringTest < ActiveSupport::TestCase

  test "Encrypted String won't save without value" do
    @datakey = DataEncryptingKey.new(key: "hello I'm a string", primary: true)
    @datakey.save
    @string = EncryptedString.new(value: nil)
    assert_not @string.save
  end

end
