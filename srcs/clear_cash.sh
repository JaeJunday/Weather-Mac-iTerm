#/bin/bash

# 이스케이프 컬러 시퀀스 
DELETE=$'\033[1A\033[K'
Red=$'\033[0;31m'
Green=$'\033[0;32m'
Yellow=$'\033[0;33m'
Reset=$'\033[0m'

BANNER="$(  
printf $DELETE
cat << EOF
║ █ █ ║ █ █ █ ║ █ █ ║
║ █ █ ║ █ █ █ ║ █ █ ║
║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ║
╚═╩═╩═╩═╩═╩═╩═╩═╩═╩═╝
EOF
)"

TARGET=(
  "Caches"
  "ApplicationSupport/Code/Cache"
  "ApplicationSupport/Code/CachedData"
  "ApplicationSupport/Code/CachedExtensions"
  "ApplicationSupport/Code/CachedExtensionVSIXs"
  "ApplicationSupport/Code/Code Cache"
  "ApplicationSupport/Slack/Cache"
  "ApplicationSupport/Slack/CachedData"
  "ApplicationSupport/Slack/Service Worker/CacheStorage"
  "ApplicationSupport/Slack/Service Worker/ScriptCache"
)



# 출력 포맷 지정 
function link_all_cache_dirs() {
  for ((i = 0; i < ${#TARGET[@]}; i++)); do
    rm -rf "$HOME/Library/${TARGET[$i]}"
  done
}

#if [ ! -e "$FLAG" ]; then
  #printf "\n$BANNER\n"
  link_all_cache_dirs
#fi

# df -h 명령어 실행 및 마지막 줄 추출
df_output=$(df -h | tail -n 1)

# 필요한 정보 추출
total=$(echo "$df_output" | awk '{print $2}')
used=$(echo "$df_output" | awk '{print $3}')
percentage=$(echo "$df_output" | awk '{sub(/%$/, "", $5); print $5}')

# 컬러 선택
color=""
if (( $(awk 'BEGIN {print ('"$percentage"' < 70)}') )); then
    color=$Green  # 초록색
elif (( $(awk 'BEGIN {print ('"$percentage"' < 90)}') )); then
    color=$Yellow
else
    color=$Red
fi

# df -m 그래프계산값을 위한 정보 출력
df_graph=$(df -m | tail -n 1)

# 필요한 정보 추출
total_g=$(echo "$df_graph" | awk '{print $2}')
used_g=$(echo "$df_graph" | awk '{print $3}')
percentage_g=$(echo "$df_graph" | awk '{sub(/%$/, "", $5); print $5}')

# 막대 그래프 생성
graph="$Yellow[$Reset"
usage2=$(awk -v total=$total_g -v used=$used_g 'BEGIN {printf "%.0f", used / total * 25}')
for ((i=0; i<25; i++)); do
    if ((i < usage2)); then
        graph+="$color#$Reset"
    else
        graph+="·"
    fi
done
graph+="$Yellow]$Reset"

# 출력
printf $DELETE
printf "$graph "
printf "$color$percentage\e[0m %% \n" | tr -d "\n"
curl 'wttr.in/seoul?format=3'
