#!/bin/bash

# ./script/new.sh $SCRIPT_NAME
SCRIPT_NAME=$1

# 1. Create $SCRIPT_NAME file with shebang
#
# TODO: accept different options such as:
# --sh
# --mac
# --fish
# --zsh
echo '#!/bin/bash' > $SCRIPT_NAME

# 2. Make it an executable
chmod +x $SCRIPT_NAME
