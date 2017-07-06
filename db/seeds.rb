# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.email = 'admin@admin.com'
  user.password = '123456'
  user.is_admin = true

User.find_or_create_by(email: 'demo@demo.com') do |user|
  user.email = 'demo@demo.com'
  user.password = '123456'
  user.is_admin = false

# Users - Random users
user_count = 10
if User.count < user_count
  (user_count - User.count).times do
    email = Faker::Internet.email
    User.create( email: email, password: '123456')
  end
end




end