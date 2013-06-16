test_user = User.create(username: "test", email: "test@venview.com", password: "password")
test_user.confirm!

admin = User.create(username: "admin", email: "bionjohnson@gmail.com",
                    password: "password", role: "admin")
admin.confirm!

