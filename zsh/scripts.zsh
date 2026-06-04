#~/.zsh/scripts.zsh (User defined convenience functions)
# extract any archive type
_xtract() {
  case "$1" in
    *.tar.gz)  tar -xzf "$1"  ;;
    *.tar.bz2) tar -xjf "$1"  ;;
    *.tar.xz)  tar -xJf "$1"  ;;
    *.tar)     tar -xf "$1"   ;;
    *.zip)     unzip "$1"     ;;
    *.gz)      gunzip "$1"    ;;
    *.rar)     unrar x "$1"   ;;
    *.7z)      7z x "$1"      ;;
    *)         echo "Unknown format: $1" ;;
  esac
}
