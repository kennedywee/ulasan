# db/seeds.rb

# Create Users
user1 = User.create!(
  name: "John Doe",
  email_address: "john.doe@example.com",
  username: "johndoe",
  password: "password",
  role: 0,
  active: true
)

user2 = User.create!(
  name: "Jane Smith",
  email_address: "jane.smith@example.com",
  username: "janesmith",
  password: "password",
  role: 0,
  active: true
)

# Create Boards
board1 = Board.create!(
  user_id: user1.id,
  appname: "App One",
  description: "First app description",
  company: "Company One",
  website: "http://www.companyone.com"
)

board2 = Board.create!(
  user_id: user2.id,
  appname: "App Two",
  description: "Second app description",
  company: "Company Two",
  website: "http://www.companytwo.com"
)

# Create Features
Feature.create!(
  user_id: user1.id,
  board_id: board1.id,
  identity: 1,
  title: "Feature 1",
  content: "Content for feature 1",
  category: 0,
  vote_count: 0
)

Feature.create!(
  user_id: user2.id,
  board_id: board2.id,
  identity: 2,
  title: "Feature 2",
  content: "Content for feature 2",
  vote_count: 0
)

# Ensure no duplicate (user_id, board_id) pairs
Feature.create!(
  user_id: user1.id,
  board_id: board2.id,
  identity: 3,
  title: "Feature 3",
  content: "Content for feature 3",
  vote_count: 0
)

puts "Seeding done :)"
