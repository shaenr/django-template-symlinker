#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SCRIPT:  ./djangsymtmp.sh
#
#                             # # #   README   # # #
# AUTHOR:  shanerowden
# LICENSE:  gpl 3.0
#
# DESCRIPTION: a django utility for consolidating templates
#               to a single directory using symlinks.
#
#              Given specified django apps in your project.
#              Script will name the links in this pattern:
#              '<appname>.<basename>' ... to avoid any
#              possibility of namespace issues.
#
#              Original files are of course left alone.
#
# SETUP AND USAGE
#                        T h i s   i s   i m p o r t a n t
#
# SETUP: you will need to manually add the paths to your
#        actual template directories before running the script.
#
#   1) Add template dir variables on their own lines,
#      like these two; use any names you like...
#      You may use relative or absolute paths.
# # # # # # # # # # # # # # # # # # # # # # # #


MAIN_DIR="$(readlink -f '../app1/templates/app1')"
USERS_DIR="$(readlink -f '../app2/templates/app2')"
# YOUR_VAR="$(readlink -f '../yourapp/templates/yourapp')"


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   2) don't forget to add any added variables to this line, as
#      below! Otherwise, script won't know what you configured.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


TEMPLATE_DIRS=("$MAIN_DIR" "$USERS_DIR")
# TEMPLATE_DIRS=("$MAIN_DIR" "$USERS_DIR" "$YOUR_VAR")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# USAGE: Just Execute the script inside your Django project from:
#        "$DJANGO_PROJECT/templates/djangsymtmp.sh"
#        Just one level of depth in from your manage.py
#        Takes no arguments.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#   AGAIN:  PLEASE EXECUTE THE SCRIPT FROM THE CORRECT DIRECTORY!
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  DEMO:
#
#
#
#  (venv) [user@host]$ ls -l
#  total 20
#  -rwxr-xr-x 1 shaen shaen 2967 Aug 19 17:11 djangsymtmp.sh
#  lrwxrwxrwx 1 shaen shaen   89 Aug 19 17:11 main.base.html -> /home/shaen/PycharmProjects/SoulBondingGame/SoulBondingGame/main/templates/main/base.html
#  lrwxrwxrwx 1 shaen shaen   95 Aug 19 17:11 main.main_index.html -> /home/shaen/PycharmProjects/SoulBondingGame/SoulBondingGame/main/templates/main/main_index.html
#  lrwxrwxrwx 1 shaen shaen   96 Aug 19 17:11 users.user_home.html -> /home/shaen/PycharmProjects/SoulBondingGame/SoulBondingGame/users/templates/users/user_home.html
#  lrwxrwxrwx 1 shaen shaen   99 Aug 19 17:11 users.user_profile.html -> /home/shaen/PycharmProjects/SoulBondingGame/SoulBondingGame/users/templates/users/user_profile.html
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


echo
echo "【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】"
echo "【﻿ Django Template Symlinks 】"
echo "【﻿utility for consolidating templates to one place 】"
echo "【﻿cat djangsymtmp.sh】--【﻿for more info and config 】"
echo

read -p "Press enter to continue / CTRL+C to Stop "
echo

echo "【﻿STARTING -- finding config in djangsymtmp.sh 】"
LINKED_TEMPLATES_DIR="$(pwd)"

# Construct Array of dir paths and glob HTML files.
TEMPLATE_GLOB=()
for DIRECTORY in "${TEMPLATE_DIRS[@]}"; do
  if [ -d "$DIRECTORY" ]; then
    TEMPLATE_GLOB+=("${DIRECTORY}"/*.html)
  fi
done

# Using the Array to iterate over files.
for SRC_PATH in "${TEMPLATE_GLOB[@]}"; do

  # Constructing variables for path manipulation
  FILENAME=$(basename "$SRC_PATH")
  PARENTDIR="$(basename "$(dirname "$SRC_PATH")")"
  SYMLINK_PATH="$LINKED_TEMPLATES_DIR/$PARENTDIR.$FILENAME"

  # Payload action and feedback
  [[ ! -f $SYMLINK_PATH ]] && {
    echo "【﻿LOOKING at 】... '$PARENTDIR/$FILENAME'...";
    echo "【﻿SOFT LINKING 】... '$PARENTDIR/$FILENAME' at 【﻿'$SYMLINK_PATH' 】";
    ln -s "$SRC_PATH" "$SYMLINK_PATH";
  } || {
    echo "【﻿SKIPPING 】'templates/$PARENTDIR.$FILENAME' -- 【﻿already exists or failed. 】";
  }

done

echo
echo "【﻿Finished. Have a look... 】"
echo "【 DEMO: 】"
echo

BRC="$HOME/.bashrc"
[[ -f $BRC ]] && {
  source $BRC;
  ls -l --color=auto;
} || ls -l --color=auto

echo
echo "【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】"
echo
