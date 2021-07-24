Dotenv.load

role :app, %W{#{ENV['USER_HOST']}}
role :web, %W{#{ENV['USER_HOST']}}
role :db,  %W{#{ENV['USER_HOST']}}


server ENV['HOST'], user: ENV['DEPLOY_USER'], roles: %W{web app}, port: 8585
