#!/bin/bash
# Script to record the demo_all.exe running with xvfb

export PATH="/root/bin:/root/.opam/default/bin:$PATH"

# Start Xvfb on display :99
Xvfb :99 -screen 0 1024x768x24 &
XVFB_PID=$!
export DISPLAY=:99

# Give Xvfb time to start
sleep 2

# Run the demo (it will print output to stdout)
echo "Running demo..."
/home/user/lablgtk/ocgtk/_build/default/examples/demo_all.exe

# Clean up
kill $XVFB_PID
wait $XVFB_PID 2>/dev/null

echo "Demo complete!"
