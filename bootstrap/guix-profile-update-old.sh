

# https://github.com/SqrtMinusOne/dotfiles/blob/master/bin/scripts/update-profiles

# 2022 10 awb99: this script works to update all profiles.

GREEN='\033[1;32m'
NC='\033[0m'
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

GUILE_LOAD_PATH="./modules"

profiles=$*
if [[ $# -eq 0 ]]; then
    profiles="$GUIX_EXTRA_PROFILES/*";
fi

for profile in $profiles; do
  profileName=$(basename $profile)
  profilePath=$GUIX_EXTRA_PROFILES/$profileName

  echo
  echo -e "${GREEN}Updating profile:" $profilePath "${NC}"
  echo

  guix package --profile="$profilePath/$profileName" --manifest="./manifest/$profileName.scm"
done