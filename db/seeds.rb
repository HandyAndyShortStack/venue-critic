test_user = User.create(email: "test@venview.com", password: "password")
test_user.confirm!
