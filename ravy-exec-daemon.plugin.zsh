# Run given command only if there is not one running.
singleton_command () {
  pgrep -f "(^| |/)$@( |\$)" > /dev/null || eval "$@";
}

# Run given singleton command in background.
singleton_command_background () {
  (singleton_command "$@" &) &>/dev/null;
}

[ $(uname) = Darwin ] && singleton_command_background "${0:A:h}/ravy-exec-daemon"
