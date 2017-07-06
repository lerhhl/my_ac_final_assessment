# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.email = 'admin@admin.com'
  user.password = '123456'
  user.is_admin = true
end

User.find_or_create_by(email: 'demo@demo.com') do |user|
  user.email = 'demo@demo.com'
  user.password = '123456'
  user.is_admin = false
end

# Users - Random users
user_count = 10
if User.count < user_count
  (user_count - User.count).times do
    email = Faker::Internet.email
    User.create( email: email, password: '123456')
  end
end

# Create notes
note_count = 30
if Note.count < note_count
  (note_count - Note.count).times do
    body = Faker::ChuckNorris.fact
    user_id = Faker::Number.between(1, User.count)
    Note.create(body: body, user_id: user_id)
  end
end

# Create like
like_count = 20
if Like.count < like_count
  (like_count - Like.count).times do
    note_id = Faker::Number.between(1, Note.count)
    user_id = Faker::Number.between(1, User.count)
    Like.create(note_id: note_id, user_id: user_id)
  end
end

# Create relationship
relationship_count = 20
if Relationship.count < relationship_count
  (relationship_count - Relationship.count).times do
    follower_id = Faker::Number.between(1, 2)
    followed_id = Faker::Number.between(3, User.count)
    Relationship.create(follower_id: follower_id, followed_id: followed_id)
  end
end