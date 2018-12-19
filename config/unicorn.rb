
# Set the working application directory
# working_directory "/path/to/your/app"

root = ENV['DEPLOY_PATH_UNICORN'] 

working_directory = root

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid ENV['PID_UNICORN_PATH']

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path ENV['LOG_UNICORN_PATH']
stdout_path ENV['LOG_UNICORN_PATH']

# Unicorn socket
listen ENV['SOCKET_UNICORN_PATH']

# Number of processes
# worker_processes 4
worker_processes 3

# Time-out
timeout 180
