# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.username                  "Username"
  user.real_name              "RealName"
  user.email                 "mhartl@example.com"
  user.password              "foobars"
  #user.password_confirmation "foobars"
end

Factory.define :bookmark do |bookmark|
  bookmark.URL  "www.test.com"
  bookmark.Name "Test"
  bookmark.UserMade "Test User"
end
