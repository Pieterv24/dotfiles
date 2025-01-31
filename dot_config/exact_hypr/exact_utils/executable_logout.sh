# close all client windows
# required for graceful exit since many apps aren't good SIGNAL citizens
HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
hyprctl --batch "$HYPRCMDS" >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# exit hyprland
hyprctl dispatch exit >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# Kill user account
# loginctl kill-user $(whoami) >> /tmp/hypr/hyprexitwithgrace.log

