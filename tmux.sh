function wf {
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
    tmux new-session -d -s 'Time'
    # open the mytime.db
    tmux new-window -t Time -n td
    tmux select-pane -t Time:td.1 -T "mytime.db"
    tmux send-keys -t Time:td.1 'td &' C-m C-z %

    tmux new-window -t Time -n hmj
    # List all panes in the specified window and session
    # pane_index=$(tmux list-panes -t Time:td -F "#{pane_index} #{pane_title}" | grep "hmj" | awk '{print $1}')
    # Send command to the identified pane
    tmux send-keys -t Time:hmj 'hmj &' C-m

    # Create a new tmux session named 'Quizzes'
    tmux new-session -d -s 'Quizzes'
    tmux new-window -t Quizzes -n 'qtmux'
    tmux select-pane -t Quizzes:qtmux.1 -T "qtmux"
    tmux send-keys -t Quizzes:qtmux.1 'say "Your quiz is ready"' C-m
    tmux send-keys -t Quizzes:qtmux.1 'qtmux' C-m

    # Create a new tmux session named 'File-transfers'
    tmux new-session -d -s File-transfers
    tmux new-window -t File-transfers -n 'HD81'
    tmux select-pane -t File-transfers:HD81.1 -T "scp"
    tmux send-keys -t File-transfers:HD81.1 'cd /Volumes/MooersHD81' C-m

    tmux new-window -t File-transfers -n 'XrayData'
    tmux send-keys -t File-transfers:XrayData 'xd' C-m

    # Create a new tmux session named 'researchArticles'
    tmux new-session -d -s researchArticles

    # Create the third window, rename it, and run a command
    tmux new-window -t researchArticles:3 -n '0033'
    tmux send-keys -t researchArticles:3 'cd ~/0033EditingSiteSAXS' C-m

    # Create a new tmux session named 'computingArticles'
    tmux new-session -d -s computingArticles
    # Create the first window, rename it, and run a command
    tmux new-window -t computingArticles:2 -n '0042'
    tmux send-keys -t computingArticles:2 'cd ~/0042CCN2025' C-m
    
    # Create a new tmux session named 'writingArticles'   
    tmux new-session -d -s writingArticles
    # Create the first window, rename it, and run a command
    tmux new-window -t writingArticles:2 -n '0517'
    tmux send-keys -t writingArticles:2 'cd ~/0517TSRWritingManagementWithOrg' C-m

    # Create second window, rename it, and run a command
    tmux new-window -t writingArticles:3 -n '0598'
    tmux send-keys -t writingArticles:3 'cd ~/0598tenRulesWritingLog' C-m


    # Create a new tmux session named 'grantApplications'
    tmux new-session -d -s grantApplications

    tmux new-window -t grantApplications:2 '1019'
    tmux send-keys -t grantApplications:2 'cd ~/1019NIHemofat' C-m

    tmux new-session -d -s brewUpdate
    # Create the first window, rename it, and run a command
    tmux new-window -t brewUpdate:2 -n 'updateUpgrade'
    tmux send-keys -t brewUpdate:2 'brew update && brew upgrade && msu' C-m



    # Open new iTerm2 tabs for each tmux session
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt 750w && tmux attach-session -t 750words"
            end tell
        end tell
    end tell'


    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt scp && tmux attach-session -t File-transfers"
            end tell
        end tell
    end tell'


    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt quizzes && tmux attach-session -t Quizzes"
            end tell
        end tell
    end tell'


    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt time && tmux attach-session -t Time"
            end tell
        end tell
    end tell'


    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt research && tmux attach-session -t researchArticles"
            end tell
        end tell
    end tell'

    
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt computing && tmux attach-session -t computingArticles"
            end tell
        end tell
    end tell'
    
    
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt writing && tmux attach-session -t writingArticles"
            end tell
        end tell
    end tell'
    
    
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt grants && tmux attach-session -t grantApplications"
            end tell
        end tell
    end tell'

     
    osascript -e 'tell application "iTerm2"
        tell current window
            create tab with default profile
            tell current session of current tab
                write text "tt updates && tmux attach-session -t brewUpdate"
            end tell
        end tell
    end tell'
}
