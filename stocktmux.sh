#!/bin/sh

tmux kill-sess -t stock

SESSION="stocks"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd Projects/stock-review

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 

        tmux rename -t 0 'STOCKS'
        tmux new-window -t $SESSION:1 -n 'stocks'
        cd rsp
        tmux new-window -t $SESSION:2 -n 'rsp'
        cd ../tfsa
        tmux new-window -t $SESSION:3 -n 'tfsa'
        cd ../margin
        tmux new-window -t $SESSION:4 -n 'margin'
        cd ..
        tmux new-window -t $SESSION:5 -n 'all'
        tmux splitw -v
        tmux splitw -h
        tmux selectp -t 0
        tmux splitw -h
        tmux send-keys 'cd tfsa' C-m
        tmux selectp -t 3
        tmux send-keys 'cd margin' C-m
        tmux selectp -t 0
        tmux send-keys 'cd rsp' C-m
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 1
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 3
        tmux send-keys 'py report.py -v' C-m
        tmux selectp -t 2
        tmux send-keys 'py acc_sum.py -v' C-m


fi

