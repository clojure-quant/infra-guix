clear

echo Started dev environment

ls "$GUIX_ENVIRONMENT/bin"

echo "node version" (node --version)
java -version

./env/env.sh

set PATH $PATH:/home/andreas/pinkgorilla/infra-guix/cljenv/bin/