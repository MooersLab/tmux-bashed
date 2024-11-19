function twf {
    echo "Start workflows in tmux."

    alias openc="open -a Google\\ Chrome.app"
    alias 750c="openc https://original.750words.com/"
    alias td='open /Users/blaine/6003TimeTracking/cb/mytime.db && echo "Opened mytime.db for time tracking."'

    # Create a new tmux session named '750words'
    tmux new-session -d -s 750words
    tmux new-window -t 750words -n 750w
    tmux send-keys -t 750words:750w '750c' C-m

    tmux new-window -t 750words -n Transcripts
    tmux select-pane -t 750words:Transcripts.1 -T "current-transcription"
    tmux send-keys -t 750words:Transcripts.1 'cd ./transcriptions' C-m 'ls -ltr *.mp3' C-m 'wh3 '

    # Create a new tmux session named 'TimeTracking'
    tmux new-session -d -s Time
    # open the mytime.db
    tmux new-window -t Time -n td
    tmux select-pane -t Time:td.1 -T "mytime.db"
    tmux send-keys -t Time:td.1 'td &' C-m 

    tmux select-pane -t Time:td.2 -T "hmj"
    # List all panes in the specified window and session
    pane_index=$(tmux list-panes -t Time:td -F "#{pane_index} #{pane_title}" | grep "hmj" | awk '{print $1}')
    # Send command to the identified pane
    tmux send-keys -t Time:td.$pane_index 'hmj &' C-m

    # Create a new tmux session named 'Quizzes'
    tmux new-session -d -s Quizzes
    tmux new-window -t Quizzes -n qtmux
    tmux select-pane -t Quizzes:qtmux.1 -T "qtmux"
    tmux send-keys -t Quizzes:qtmux.1 'say "Your quiz is ready"' C-m
    tmux send-keys -t Quizzes:qtmux.1 'qtmux' C-m

    # Create a new tmux session named 'File-transfers'
    tmux new-session -d -s File-transfers
    tmux new-window -t File-transfers -n HD81
    tmux select-pane -t File-transfers:HD81.1 -T "scp"
    tmux send-keys -t File-transfers:HD81.1 'cd /Volumes/MooersHD81' C-m

    # Create a new tmux session named 'writingProjects'
    tmux new-session -d -s writingProjects

    # Create the first window, rename it, and run a command
    tmux new-window -t writingProjects:1 -n '0033'
    tmux send-keys -t writingProjects:1 'cd ~/0033EditingSiteSAXS' C-m


    # Open new iTerm2 tabs for each tmux session
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tmux attach-session -t 750words"
            end tell
        end tell
    end tell'

    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tmux attach-session -t File-transfers"
            end tell
        end tell
    end tell'

    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tmux attach-session -t Quizzes"
            end tell
        end tell
    end tell'

    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tmux attach-session -t Time"
            end tell
        end tell
    end tell'

    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tmux attach-session -t writingProjects"
            end tell
        end tell
    end tell'
}