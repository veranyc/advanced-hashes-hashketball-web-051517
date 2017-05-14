require "pry"#method that serves as the dictionary for all the other methods
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans"=> {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez"=> {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      },
    },
  }
end



def num_points_scored(player_name)
  #takes in arguement of player's name and returns the number of points
  #player is the next key level under players but they are all different
  game_hash.keys.each do |location|
    game_hash[location][:players].keys.each do |player|
      #now that I've iterated down to the player level, I need to return the points value if that player is the same
      #as they name passed as an arguement
     return game_hash[location][:players][player][:points] if player == player_name
    end
  end
end

def shoe_size(player_name)
  #takes in arguement of player's name and returns the shoe size
  #similar to num_points_scored except instead of returning the points we return the shoe_size
  game_hash.keys.each do |location|
    game_hash[location][:players].keys.each do |player|
      return game_hash[location][:players][player][:shoe] if player == player_name
    end
  end
end

def team_colors(given_team)
  #takes in arguement of team name and returns the array of colors
  game_hash.keys.each do |location|
    return game_hash[location][:colors] if game_hash[location][:team_name] == given_team
  end
end

def team_names
  #operates on the game has to return an array of the team names
  #create a new array - .keys method will create an array from the keys of the hash
  #once I have the array, I need to use .map ang give it the block of code that will deliver the team_name and then add
  #the values to the new array. The block is given as a parameter.
  game_hash.keys.map { |location| game_hash[location][:team_name] }
end

def player_numbers(given_team)
  #returns an array of the jersey numbers based on the team name
  #create a new array
  team_numbers = []
  #enumerate over each of the location sets starting with the use of the .keys method
  game_hash.keys.each do |location|
    #define condition of the team_name value == to the arguement
    if game_hash[location][:team_name] == given_team
      #drill down to enumerate on each of the players of the team
      game_hash[location][:players].keys.each do |player|
        #grab the number value and shovel it into the new array of team numbers
        team_numbers << game_hash[location][:players][player][:number]
      end
    end
  end
  #return the array
  team_numbers
end

def player_stats(given_player)
  #returns an array of the stats for that player
  #drill down the player keys to get the all the stat values. They can be returned as a hash
  game_hash.keys.each do |location|
    game_hash[location][:players].keys.each do |player|
      #now that I'm drilled to the player level I set the condition that relates to the arguement
      #and returns the stat hash
      return game_hash[location][:players][player] if player == given_player
    end
  end
end

def big_shoe_rebounds
  #return the number of rebounds associated with the player that has the largest shoe size
  #find the player with the largest shoe size
  #return the player's number of rebounds
  #first I need a set of variables to compare against while I enumerate.
  #in order to return the right rebound number I need to use the keys for team and player
  #while also keeping track of the largest shoe the program comes across
  team = ""
  largest_shoe = 0
  player_with_largest_shoe = ""
  game_hash.keys.each do |location| #drill down to location
    game_hash[location][:players].keys.each do |player| #drill down to player
    #is the shoe of player greater than the largest_shoe variable
      if game_hash[location][:players][player][:shoe] > largest_shoe
        #if true, the largest_shoe variable is now equal to the shoe value
        largest_shoe = game_hash[location][:players][player][:shoe]
        #the player_with_largest_shoe is now the value of the related player
        player_with_largest_shoe = player
        #the team is either away or home
        team = location
      end
    end
  end
  #return the rebounds considering the values for the team and the player
  game_hash[team][:players][player_with_largest_shoe][:rebounds]
end
