if status is-interactive
    # Commands to run in interactive sessions can go here
end

function canvas
    open https://sit.instructure.com/
end

set -Ux fish_user_paths $fish_user_paths ~/go/bin
set fish_greeting

starship init fish | source
