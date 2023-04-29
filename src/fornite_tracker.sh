#!/bin/bash

api="https://api.fortnitetracker.com/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function set_api_key {
    # 1 - api_key: (string): <api_key>
    api_key=$1
}

function get_player_stats() {
    # 1 - platform: (string): <kbm, gamepad, touch>
    # 2 - epic_nickname: (string): <epic games nickname>
    curl --request GET \
        --url "$api/profile/$1/$2" \
        --user-agent "$user_agent" \
        --header "TRN-Api-Key: $api_key" \
        --header "content-type: application/json"
}

function get_player_matches() {
    # Get player matches by platform and username
    # 1 - platform: (string): <pc, xbl, psn>
    # 2 - username: (string): player username
    # 3 - mode: (string): <solo, duo, squad>
    # 4 - limit: (integer): <1-100 - default: 10>
    curl --request GET \
        --url "$api/profile/$1/$2/matches?mode=$3&limit=${4:-10}" \
        --user-agent "$user_agent" \
        --header "TRN-Api-Key: $api_key" \
        --header "content-type: application/json"
}

function get_current_store() {
    curl --request GET \
        --url "$api/store" \
        --user-agent "$user_agent" \
        --header "TRN-Api-Key: $api_key" \
        --header "content-type: application/json"
}


function get_current_challenges() {
    curl --request GET \
        --url "$api/challenges" \
        --user-agent "$user_agent" \
        --header "TRN-Api-Key: $api_key" \
        --header "content-type: application/json"
}
