require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "product_added" do
    mail = Notifier.product_added
    assert_equal "Product added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "product_deleted" do
    mail = Notifier.product_deleted
    assert_equal "Product deleted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
