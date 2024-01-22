require "application_system_test_case"

class GameTest < ApplicationSystemTestCase

  test "Start Game" do
    visit root_url
    click_on "Start Game"
    assert_selector "h1", text: "Connections Clone"
  end

end