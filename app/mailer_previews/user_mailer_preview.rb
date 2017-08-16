# app/mailer_previews/user_mailer_preview.rb:
class UserMailerPreview
  # preview methods should return Mail objects, e.g.:
  def invitation
    UserMailer.invitation mock_user('Alice'), mock_user('Bob')
  end

  def welcome
    user = @user_id ? User.find(@user_id) : mock_user
    UserMailer.welcome(user)
  end

  private
  # You can put all your mock helpers in a module
  # or you can use your factories / fabricators, just make sure you are not creating anything
  def mock_user(name = 'Bill Gates')
    fake_id User.new(name: name, email: "user#{rand 100}@test.com")
  end

  def fake_id(obj)
    # overrides the method on just this object
    obj.define_singleton_method(:id) { 123 + rand(100) }
    obj
  end
end