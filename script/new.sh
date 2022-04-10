#!/usr/bin/env bash

# Usage:
# ./script/new.sh $SCRIPT_NAME
SCRIPT_NAME=$1

SHEBANG_PREFIX='#!/usr/bin/env'

# Set default shell
SHELL='bash'

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --bash)
      SHELL='bash'
      shift
      ;;
    --sh)
      SHELL='sh'
      shift
      ;;
    --zsh)
      SHELL='zsh'
      shift
      ;;
    --fish)
      SHELL='fish'
      shift
      ;;
    --*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
  esac
done

SCRIPT_NAME=$POSITIONAL_ARGS

# 1. Create $SCRIPT_NAME file with shebang and chosen shell
echo "$SHEBANG_PREFIX $SHELL" > $SCRIPT_NAME

# 2. Make it an executable
chmod +x $SCRIPT_NAME
