# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
Role.destroy_all


# Generate models and tables, according to the domain model.
# done - check schema

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Insert studios
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

puts "There is #{Studio.all.count} studio"

# Insert actors
christian_bale = Actor.new
christian_bale["name"] = "Christian Bale"
christian_bale.save

michael_caine = Actor.new
michael_caine["name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson["name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger["name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal["name"] = "Maggie Gyllenhal"
maggie_gyllenhaal.save

tom_hardy = Actor.new
tom_hardy["name"] = "Tom Hardy"
tom_hardy.save

joe_gordon_levitt = Actor.new
joe_gordon_levitt["name"] = "Joseph Gordon-Levitt"
joe_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway["name"] = "Anne Hathaway"
anne_hathaway.save

puts "There are #{Actor.all.count} actors"

# Insert movies
warner_bros = Studio.find_by({ "name" => "Warner Bros."})

batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["rated"] = "PG-13"
batman_begins["year_released"] = 2005
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["rated"] = "PG-13"
dark_knight["year_released"] = 2008
dark_knight["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["studio_id"] = warner_bros["id"]
dark_knight_rises.save

puts "There are #{Movie.all.count} movies"

# Insert roles
batman_begins = Movie.find_by({ "title" => "Batman Begins"})
dark_knight = Movie.find_by({ "title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({ "title" => "The Dark Knight Rises"})

christian_bale = Actor.find_by({ "name" => "Christian Bale"})
michael_caine = Actor.find_by({ "name" => "Michael Caine"})
liam_neeson = Actor.find_by({ "name" => "Liam Neeson"})
katie_holmes = Actor.find_by({ "name" => "Katie Holmes"})
gary_oldman = Actor.find_by({ "name" => "Gary Oldman"})
heath_ledger = Actor.find_by({ "name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({ "name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({ "name" => "Maggie Gyllenhal"})
tom_hardy = Actor.find_by({ "name" => "Tom Hardy"})
joe_gordon_levitt = Actor.find_by({ "name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({ "name" => "Anne Hathaway"})

bruce_wayne_bb = Role.new
bruce_wayne_bb["character_name"] = "Bruce Wayne"
bruce_wayne_bb["movie_id"] = batman_begins["id"]
bruce_wayne_bb["actor_id"] = christian_bale["id"]
bruce_wayne_bb.save

bruce_wayne_dn = Role.new
bruce_wayne_dn["character_name"] = "Bruce Wayne"
bruce_wayne_dn["movie_id"] = dark_knight["id"]
bruce_wayne_dn["actor_id"] = christian_bale["id"]
bruce_wayne_dn.save

bruce_wayne_dnr = Role.new
bruce_wayne_dnr["character_name"] = "Bruce Wayne"
bruce_wayne_dnr["movie_id"] = dark_knight_rises["id"]
bruce_wayne_dnr["actor_id"] = christian_bale["id"]
bruce_wayne_dnr.save

alfred_bb = Role.new
alfred_bb["character_name"] = "Alfred"
alfred_bb["movie_id"] = batman_begins["id"]
alfred_bb["actor_id"] = michael_caine["id"]
alfred_bb.save

alfred_dn = Role.new
alfred_dn["character_name"] = "Alfred"
alfred_dn["movie_id"] = dark_knight["id"]
alfred_dn["actor_id"] = michael_caine["id"]
alfred_dn.save

gordon_bb = Role.new
gordon_bb["character_name"] = "Commissioner Gordon"
gordon_bb["movie_id"] = batman_begins["id"]
gordon_bb["actor_id"] = gary_oldman["id"]
gordon_bb.save

gordon_dnr = Role.new
gordon_dnr["character_name"] = "Commissioner Gordon"
gordon_dnr["movie_id"] = dark_knight_rises["id"]
gordon_dnr["actor_id"] = gary_oldman["id"]
gordon_dnr.save

rachel_bb = Role.new
rachel_bb["character_name"] = "Rachel Dawes"
rachel_bb["movie_id"] = batman_begins["id"]
rachel_bb["actor_id"] = katie_holmes["id"]
rachel_bb.save

rachel_dn = Role.new
rachel_dn["character_name"] = "Rachel Dawes"
rachel_dn["movie_id"] = dark_knight["id"]
rachel_dn["actor_id"] = maggie_gyllenhaal["id"]
rachel_dn.save

ghul_bb = Role.new
ghul_bb["character_name"] = "Ra's Al Ghul"
ghul_bb["movie_id"] = batman_begins["id"]
ghul_bb["actor_id"] = liam_neeson["id"]
ghul_bb.save

joker_dn = Role.new
joker_dn["character_name"] = "Joker"
joker_dn["movie_id"] = dark_knight["id"]
joker_dn["actor_id"] = heath_ledger["id"]
joker_dn.save

dent_dn = Role.new
dent_dn["character_name"] = "Harvey Dent"
dent_dn["movie_id"] = dark_knight["id"]
dent_dn["actor_id"] = aaron_eckhart["id"]
dent_dn.save

bane_dnr = Role.new
bane_dnr["character_name"] = "Bane"
bane_dnr["movie_id"] = dark_knight_rises["id"]
bane_dnr["actor_id"] = tom_hardy["id"]
bane_dnr.save

blake_dnr = Role.new
blake_dnr["character_name"] = "John Blake"
blake_dnr["movie_id"] = dark_knight_rises["id"]
blake_dnr["actor_id"] = joe_gordon_levitt["id"]
blake_dnr.save

kyle_dnr = Role.new
kyle_dnr["character_name"] = "Selina Kyle"
kyle_dnr["movie_id"] = dark_knight_rises["id"]
kyle_dnr["actor_id"] = anne_hathaway["id"]
kyle_dnr.save

puts "There are #{Role.all.count} roles"

# Prints a header for the movies output
puts ""
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!