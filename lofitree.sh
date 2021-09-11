#!/bin/sh
# Default link (lofi hiphop radio)
LINK="https://www.youtube.com/watch?v=5qap5aO4i9A"
TREES=0
trap ctrl_c INT
function ctrl_c() {
    QUIET || notify-send "Trees grown: ${TREES}"
    exit
        }
while getopts ":qcl:" opt; do
  case $opt in
    l)
        LINK="${OPTARG}" ;;
    q)
        QUIET=true;;
    c)
        CURL_MODE=true;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1;;
  esac;done
which notify-send || QUIET=true
mpv "${LINK}" --no-video --really-quiet --volume=40 &
$CURL_MODE && 
while true; do
$CURL_MODE || which cbonsai && cbonsai  -plL 40 -t 7 || \
$CURL_MODE || which bonsai.sh && bonsai.sh  -plL 40 -t 7 || \
curl -s https://gitlab.com/jallbrit/bonsai.sh/-/raw/master/bonsai.sh | bash -s -- -plL 40 -t 7
TREES=$((TREES+1))
$QUIET || notify-send "Trees grown: ${TREES}"
done
