def sign_in_and_stub(user)
  sign_in :user, user
  allow(controller).to receive(:user_by_domain) { user }
end
