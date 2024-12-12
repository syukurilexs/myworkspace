# Kill process that running on given port
#
# Parameters:
#   $1 - Port number
#
# Example:
#   killport 3000
function killport() {
	# Ensure port provided
	if [ -z "$1" ]; then
		echo "Usage: killport <port>"
		return 1
	fi

	# Check if port is running
	lsof -i:$1 >/dev/null

	# Return if not running 
	if [ $? -eq 1 ]; then
		echo "Port $1 is not running"
		return 1
	fi

	# Kill port
	echo "kill port $1"
	lsof -i:$1 | awk '{print $2}' | xargs kill
}