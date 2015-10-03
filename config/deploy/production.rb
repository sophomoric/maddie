set :stage, :production

server '104.131.55.60', user: 'deploy', roles: %w{web app db}
