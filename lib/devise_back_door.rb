class DeviseBackDoor
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    sign_in_through_the_back_door
    @app.call(env)
  end

  private

  def sign_in_through_the_back_door
    user_id = params["as"]

    if user_id.present?
      @env["warden"].set_user User.find(user_id), scope: :user
    end
  end

  def params
    Rack::Utils.parse_query(@env["QUERY_STRING"])
  end
end
