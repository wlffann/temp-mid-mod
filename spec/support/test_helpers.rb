module TestHelpers
  def stub_login(user)
    page.set_rack_session(user_id: user.id)
  end

  def stub_logout(user)
    page.set_rack_session(user_id: nil)
  end
end
