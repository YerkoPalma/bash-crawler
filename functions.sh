print_help () {
  echo "Usage"
  echo "  $ crawler [options] <site>"
  echo ""
  echo "Options"
  echo "  --depth,  -d  Depth of the links searched   5"
  echo "  --list,   -l  Print a list formatted output false"
  echo ""
  echo "Examples"
  echo "  $ crawler -d 5 www.github.com"
}

parse_options () {
    # set defaults
    CRAWLER_DEPTH=5
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -h|--help)
        print_help
      ;;
      -v|--verbose)
        verbose=true
      ;;
      -l|--list)
        list=true
      ;;
      -d)
        CRAWLER_DEPTH="$2"
        shift # past argument
      ;;
      --depth=*)
        CRAWLER_DEPTH="${1#*=}"
      ;;
      *)
        if [ -n $1 ]; then
          target=$1
        else
          print_help
        fi
      ;;
    esac
    shift # past argument or value
  done
}

filter_protocol () {
  allowed_protocols=(http https / \#)
  _links=("$@")
  
  for i in "${!_links[@]}"; do
    # echo "link: ${_links[i]}"
    # if link start with allowed protocol, is fine
    shouldStop=0
    for protocol in "${allowed_protocols[@]}"; do
      if [[ ${_links[i]} == "$protocol"* ]]; then
        shouldStop=1
        break
      fi
    done
    if [[ $shouldStop -eq 1 ]]; then
      continue
    fi
      # return 0
    # else, if link does not contain ':' is fine
    if [[ ${_links[i]} != *:[^0-9]* ]]; then
      # unset '_links[i]'
      printf ""
    else
      # echo "link: ${_links[i]}"
      unset '_links[i]'
    fi
  done
  return $_links
}

print_result () {
  is_array=$(declare -p result 2> /dev/null | grep -q '^declare \-a' && echo 1 || echo 0)
  # 1 is array
  # 0 is not array
  if [[ $is_array -eq 1 ]]; then
    exit 1
  fi
}
