# Create Admin user
User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.email = 'admin@admin.com'
  user.password = 'password'
  user.is_admin = true
end