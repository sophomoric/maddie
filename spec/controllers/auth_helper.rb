module AuthHelper
  def sign_in_and_stub(user)
    sign_in :user, user
    allow(controller).to receive(:user_by_domain) { user }
  end

  def stub_current_user(user)
    allow(request.env["warden"]).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
