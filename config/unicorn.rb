# Set the working application directory
# working_directory "/path/to/your/app"

root = '/home/cayeta/glass/current'

working_directory = root

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid '/home/cayeta/glass/shared/tmp/pids/unicorn.pid'

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path '/home/cayeta/glass/shared/log/unicorn.log'
stdout_path '/home/cayeta/glass/shared/log/unicorn.log'

# Unicorn socket
listen '/home/cayeta/glass/shared/tmp/sockets/unicorn_glass.sock'

# Number of processes
# worker_processes 4
worker_processes 3

# Time-out
timeout 180
