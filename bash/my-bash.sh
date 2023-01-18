
# https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# refresh .bash_profile
alias sbp="source ~/.bash_profile" # S-ource B-ash P-rofile

# this was needed for playing Diablo 2
# alias d2plugy="cd ~/.wine_d2plugy/drive_c/games/diablo\ ii/mod\ plugy && WINEPREFIX=~/.wine_d2plugy wine plugy.exe -direct -txt"eval "$(rbenv init -)"

# Install brew command
# 1. Install xcode cli tools
#       $ xcode-select --install
# 2. Install brew using the Bash tool (ruby one has been deprecated)
#       $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 3. Instructions from tool
#       - Run these three commands in your terminal to add Homebrew to your PATH:
#           echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/lukebrooks/.bash_profile
#           echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/lukebrooks/.bash_profile
#           eval "$(/opt/homebrew/bin/brew shellenv)"
# 4. Verify install
#       $ brew -v