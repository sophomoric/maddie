def sign_in_and_stub(user)
  sign_in :user, user
  allow(controller).to receive(:current_user) { user }
end
