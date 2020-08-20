# django-template-symlinker
【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】 --  【﻿a simple Django-Template-Symlinker】
This script automates the process of consolidating the infinitely many template directories that exist.

+ [djangsymtmp.sh](https://github.com/shanerowden/django-template-symlinker/blob/master/project/templates/djangsymtmp.sh)
+ [django-official](https://www.djangoproject.com/)

![【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】1](https://github.com/shanerowden/django-template-symlinker/blob/master/imgs/djangsymtmp.sh-visual00.png)

## DEMO
Take a look at the tree style project structure in the pictures in the `img` directory.

All of the things highlighted in blue are the places where various apps and their templates exist in a Django web application. In fact, in this project, there are only two examples of such apps, but a Django project can become many more of these areas of blue.

![【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】2](https://github.com/shanerowden/django-template-symlinker/blob/master/imgs/djangsymtmp.sh-visual11.png)

You will find this kind of path everywhere in a Django project:
`projec1_root/project1/app-one/templates/app-one/index.html`

It requires this structure, despite not seeming like there is a good reason for it. 
Let us just say that there is a good reason for it. But it's nevertheless a lot to deal with.

The red files (by coincidence) are marked noticably as the result of my script on this project... 
these files are symbolically linked and connected to actual HTML templates that exist in the blue spaces. 
You can see this more clearly in some of the pictures, with visual aids and/or actual path examples.

![【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】3](https://github.com/shanerowden/django-template-symlinker/blob/master/imgs/djangsymtmp.sh-visual1.png)

While you must still install your templates where they go, you can manage them with these name-spacing solutions in a single, relatively top-level directory that makes the entire thing more maintainable.

# README
```bash
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


MAIN_DIR="$(readlink -f '../main/templates/main')"
USERS_DIR="$(readlink -f '../users/templates/users')"
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
#【﻿STARTING -- finding config in djangsymtmp.sh 】
#【﻿LOOKING at 】... 'app1/base.html'...
#【﻿SOFT LINKING 】... 'app1/base.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app1.base.html' 】
#【﻿LOOKING at 】... 'app1/index.html'...
#【﻿SOFT LINKING 】... 'app1/index.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app1.index.html' 】
#【﻿LOOKING at 】... 'app1/menu.html'...
#【﻿SOFT LINKING 】... 'app1/menu.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app1.menu.html' 】
#【﻿LOOKING at 】... 'app2/base.html'...
#【﻿SOFT LINKING 】... 'app2/base.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app2.base.html' 】
#【﻿LOOKING at 】... 'app2/index.html'...
#【﻿SOFT LINKING 】... 'app2/index.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app2.index.html' 】
#【﻿LOOKING at 】... 'app2/menu.html'...
#【﻿SOFT LINKING 】... 'app2/menu.html' at 【﻿'/home/shaen/projects/djangsymtmp.sh/project/templates/app2.menu.html' 】
#
#【﻿Finished. Have a look... 】
#【 DEMO: 】
#
#total 32
#lrwxrwxrwx 1 shaen shaen   73 Aug 19 18:57 app1.base.html -> /home/shaen/projects/djangsymtmp.sh/project/app1/templates/app1/base.html
#lrwxrwxrwx 1 shaen shaen   74 Aug 19 18:57 app1.index.html -> /home/shaen/projects/djangsymtmp.sh/project/app1/templates/app1/index.html
#lrwxrwxrwx 1 shaen shaen   73 Aug 19 18:57 app1.menu.html -> /home/shaen/projects/djangsymtmp.sh/project/app1/templates/app1/menu.html
#lrwxrwxrwx 1 shaen shaen   73 Aug 19 18:57 app2.base.html -> /home/shaen/projects/djangsymtmp.sh/project/app2/templates/app2/base.html
#lrwxrwxrwx 1 shaen shaen   74 Aug 19 18:57 app2.index.html -> /home/shaen/projects/djangsymtmp.sh/project/app2/templates/app2/index.html
#lrwxrwxrwx 1 shaen shaen   73 Aug 19 18:57 app2.menu.html -> /home/shaen/projects/djangsymtmp.sh/project/app2/templates/app2/menu.html
#-rwxr-xr-x 1 shaen shaen 4504 Aug 19 18:52 djangsymtmp.sh#
#
#【﻿ｄｊａｎｇｓｙｍｔｍｐ．ｓｈ】
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
```
