#!/usr/bin/env sh
#for a in $(ps -au "<name>" | gawk '/emasc/{print $1}')
#do
kill -USR1 $1 #sen usr1 signal to emacs.
#done
