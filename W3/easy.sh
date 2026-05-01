#!/bin/bash
tmux new-session -d -s crontest

tmux split-window -v

tmux send-keys -t 0 'watch -n 1 "cat carriage" | lolcat' Enter
tmux send-keys -t 1 'sudo date -s "2026-05-01 23:59:45"'

tmux attach -t crontest