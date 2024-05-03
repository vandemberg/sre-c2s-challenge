require "test_helper"

class LeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lead = leads(:one)
  end

  test "should get index" do
    get leads_url
    assert_response :success
  end

  test "should get new" do
    get new_lead_url
    assert_response :success
  end

  test "should create lead" do
    assert_difference("Lead.count") do
      post leads_url, params: { lead: { email: @lead.email, name: @lead.name, phone: @lead.phone } }
    end

    assert_redirected_to lead_url(Lead.last)
  end

  test "should not create lead without email" do
    post leads_url, params: { lead: { email: nil, name: @lead.name, phone: @lead.phone } }
    assert_response :unprocessable_entity
    assert_match "E-mail não pode ficar em branco", response.body
    assert_match "E-mail não é válido", response.body
  end

  test "should not create lead without name" do
    post leads_url, params: { lead: { email: @lead.email, name: nil, phone: @lead.phone } }
    assert_response :unprocessable_entity
    assert_match "Nome não pode ficar em branco", response.body
  end

  test "should show lead" do
    get lead_url(@lead)
    assert_response :success
  end

  test "should get edit" do
    get edit_lead_url(@lead)
    assert_response :success
  end

  test "should update lead" do
    patch lead_url(@lead), params: { lead: { email: @lead.email, name: @lead.name, phone: @lead.phone } }
    assert_redirected_to lead_url(@lead)
  end

  test "should not update lead without email" do
    patch lead_url(@lead), params: { lead: { email: nil, name: @lead.name, phone: @lead.phone } }
    assert_response :unprocessable_entity
    assert_match "E-mail não pode ficar em branco", response.body
    assert_match "E-mail não é válido", response.body
  end

  test "should not update lead without name" do
    patch lead_url(@lead), params: { lead: { email: @lead.email, name: nil, phone: @lead.phone } }
    assert_response :unprocessable_entity
    assert_match "Nome não pode ficar em branco", response.body
  end

  test "should destroy lead" do
    assert_difference("Lead.count", -1) do
      delete lead_url(@lead)
    end

    assert_redirected_to leads_url
  end
end
