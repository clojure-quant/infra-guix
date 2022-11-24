tmux terminal multiplexer

http://byobu.co/    better gui to tmux.
https://github.com/gpakosz/.tmux Pretty + versatile self-contained tmux configuration

https://gist.github.com/MohamedAlaa/2961058 tmux cheat sheet

tmux ls (list sessions)
tmux kill-session -t myname         kill session
tmux attach             (to running session)

tmux attach \; new-window top               (\; separates multple tmux commands)
tmux capture-pane -pt "website_production"
tmux new-session -s website_test -n website_test     (new session + window)

tmux new-session -s website_test -n website_test \; attach -t website_test \; new-window /usr/local/newstradingorg/start_debug.sh \; detach


CTRL-B is the control key.   

%
split vertically
“
split horizontally. 


s
switch session


x
Kill pane
d
Detach session
o
Switch between windows
$
name current session






http://byobu.org/  A better configured tmux
shift-F1   help
F2  new panel
Shift F2 new vertical panel
Alt UP/DOWN  move window
Shift +   Up/Down/Left/Right 	    move from pane to pane
F6    detach
CTRL F6 kill split

tmuxinator
https://github.com/tmuxinator/tmuxinator
Save layoutsof tmux sessions.



