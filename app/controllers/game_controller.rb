class GameController < ApplicationController

  CLUE_COUNT = 4
  WORDS_PER_CLUE = 4
  MISTAKES_ALLOWED = 5


  def make_guess



  end

  def play

    # Create a new, random game
    @game = Game.new
    @words_per_clue = WORDS_PER_CLUE # Expose to the front end

    @game.player_id = Player.find_or_create_by(code: "test").id # For now, we'll default to a test player

    # Generate a random seed that we'll use to generate the game
    @game.seed = rand(1000000)
    @game.clue_count = CLUE_COUNT; # For now, we'll default to a standard amount of clues
    @game.mistakes_allowed = MISTAKES_ALLOWED # For now, we'll default to a standard amount of mistakes allowed

    # Save the game to the database
    # so we can reference it later
    @game.save

    # Fetch the clues from the database, using the seed to generate 4 random clues
    clues = Clue.order("RANDOM()").limit(CLUE_COUNT)

    # Seed the clue search so we get random ones based on the seed
    seed = (seed_to_number(@game.seed) / 1000000.0).to_s
    Clue.connection.execute("SELECT setseed(" + seed + ")")


    clues.each do |clue|

      clue.clue_words.order("RANDOM()").limit(WORDS_PER_CLUE).each do |clue_word|

        # Create the game clue
        game_clue = GameClue.new
        game_clue.clue_word_id = clue_word.id
        game_clue.game_id = @game.id
        game_clue.save

      end
    end


  end

  private
  # Take a random seed, i.e. "CoolSeed" and convert it to a number we can use for random number generation
  def seed_to_number(seed)
    seed.to_s.sum
  end

end
