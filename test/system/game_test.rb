require "application_system_test_case"

class GameTest < ApplicationSystemTestCase

  test "Start Game" do

    Rails.application.load_seed
    visit root_url

    # Click on the big button to play the game
    click_on "Play"

    # Title is still visible
    assert_selector "h1", text: "Connections Clone"
  end

end