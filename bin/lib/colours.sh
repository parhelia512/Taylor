if [[ -v NO_COLOR ]]; then
  BLACK=""
  BLACK_BG=""
  RED=""
  RED_BG=""
  GREEN=""
  GREEN_BG=""
  YELLOW=""
  YELLOW_BG=""
  BLUE=""
  BLUE_BG=""
  MAGENTA=""
  MAGENTA_BG=""
  CYAN=""
  CYAN_BG=""
  GRAY=""
  GRAY_BG=""
  WHITE=""
  WHITE_BG=""
  LIGHT_GRAY=""
  LIGHT_GRAY_BG=""
  LIGHT_RED=""
  LIGHT_RED_BG=""
  LIGHT_GREEN=""
  LIGHT_GREEN_BG=""
  LIGHT_YELLOW=""
  LIGHT_YELLOW_BG=""
  LIGHT_BLUE=""
  LIGHT_BLUE_BG=""
  LIGHT_MAGENTA=""
  LIGHT_MAGENTA_BG=""
  LIGHT_CYAN=""
  LIGHT_CYAN_BG=""
  NC="";

else
  BLACK="\033[0;30m"
  BLACK_BG="\033[0;40m"
  RED="\033[0;31m"
  RED_BG="\033[0;41m"
  GREEN="\033[0;32m"
  GREEN_BG="\033[0;42m"
  YELLOW="\033[0;33m"
  YELLOW_BG="\033[0;43m"
  BLUE="\033[0;34m"
  BLUE_BG="\033[0;44m"
  MAGENTA="\033[0;35m"
  MAGENTA_BG="\033[0;45m"
  CYAN="\033[0;36m"
  CYAN_BG="\033[0;46m"
  GRAY="\033[0;90m"
  GRAY_BG="\033[0;100m"
  WHITE="\033[0;97m"
  WHITE_BG="\033[0;107m"
  LIGHT_GRAY="\033[0;37m"
  LIGHT_GRAY_BG="\033[0;47m"
  LIGHT_RED="\033[0;91m"
  LIGHT_RED_BG="\033[0;101m"
  LIGHT_GREEN="\033[0;92m"
  LIGHT_GREEN_BG="\033[0;102m"
  LIGHT_YELLOW="\033[0;93m"
  LIGHT_YELLOW_BG="\033[0;103m"
  LIGHT_BLUE="\033[0;94m"
  LIGHT_BLUE_BG="\033[0;104m"
  LIGHT_MAGENTA="\033[0;95m"
  LIGHT_MAGENTA_BG="\033[0;105m"
  LIGHT_CYAN="\033[0;96m"
  LIGHT_CYAN_BG="\033[0106m"
  NC="\033[0m";
fi

CLEAR="\033[1K\r";
