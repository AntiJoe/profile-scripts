#!/bin/sh

tmux kill-session -t stocks
tmux kill-session -t php
tmux kill-session -t pe


SESSION="pe"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd Insync/gd/PHPaper/Projects/Trials/Screenroom  

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 
        tmux new-window -t $SESSION:1 -n 'Screen'

fi

SESSION="php"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/Projects/qwindow

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 
        tmux new-window -t $SESSION:1 -n 'qwindow'

fi

SESSION="stocks"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

cd ~/Projects/stock-review

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





