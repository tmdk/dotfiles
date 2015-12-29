ls -al sania535-2015092* | cut -f 5 -d" " | awk 's{print ((s>$0)?s-$0:$0-s)}{s=$0}' | awk '{ print $0 / (1024 * 1024) "M"}'
