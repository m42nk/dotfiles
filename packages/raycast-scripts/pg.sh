#!/usr/bin/osascript

set appName to "Kitty"
set winTitle to "tmux"

if application appName is running then
    # tell application id (id of application appName)
    #     open location "http://googlecom"
    # end tell

    tell application id (id of application appName)
        # activate
        # windows where name contains winTitle
        windows
        return result

        # perform action "AXRaise" of (windows whose title is title)
    end tell

    # return "Running"
else
    return "Not running"
end if
