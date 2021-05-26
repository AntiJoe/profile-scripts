#!/bin/sh

SESSION="stocks"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" = "" ]
then

        tmux new-session -d -s $SESSION 

        tmux rename -t 0 'STOCKS'
        tmux new-window -t $SESSION:1 -n 'stocks'
        tmux new-window -t $SESSION:2 -n 'rsp'
        tmux new-window -t $SESSION:3 -n 'tfsa'
        tmux new-window -t $SESSION:4 -n 'margin'

fi

