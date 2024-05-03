require "test_helper"

class LeadTest < ActiveSupport::TestCase
  test "should save lead with name" do
    lead = Lead.new(name: "John Doe", email: "valid@email.com")
    assert lead.save
  end

  test "should not save lead without name" do
    lead = Lead.new(name: "", email: "invalid_email")
    assert_not lead.save
  end
  test "should not save lead with invalid email format" do
    lead = Lead.new(name: "John Doe", email: "invalid_email")
    assert_not lead.save
  end

  test "should save lead with valid email format" do
    lead = Lead.new(name: "John Doe", email: "valid@email.com")
    assert lead.save
  end
end
