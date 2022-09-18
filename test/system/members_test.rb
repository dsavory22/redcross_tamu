require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    visit members_url
    click_on "New Member"

    fill_in "Email", with: @member.Email
    check "Fall dues" if @member.Fall_Dues
    fill_in "First name", with: @member.First_Name
    fill_in "Last name", with: @member.Last_Name
    fill_in "Shirt size", with: @member.Shirt_Size
    check "Spring dues" if @member.Spring_Dues
    fill_in "Year", with: @member.year
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "updating a Member" do
    visit members_url
    click_on "Edit", match: :first

    fill_in "Email", with: @member.Email
    check "Fall dues" if @member.Fall_Dues
    fill_in "First name", with: @member.First_Name
    fill_in "Last name", with: @member.Last_Name
    fill_in "Shirt size", with: @member.Shirt_Size
    check "Spring dues" if @member.Spring_Dues
    fill_in "Year", with: @member.year
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "destroying a Member" do
    visit members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end
