APPNAME=keetonshop
APPDIR=/var/www/oscar/
LOGFILE=$APPDIR'gunicorn.log'
ERRORFILE=$APPDIR'gunicorn-error.log'

NUM_WORKERS=3

ADDRESS=0.0.0.0:8000

cd $APPDIR

source ~/.bashrc
. ./oscar/bin/activate

exec gunicorn $APPNAME.wsgi:application \
-w $NUM_WORKERS --bind=$ADDRESS \ --log-level=debug \
--log-file=$LOGFILE 2>>$LOGFILE  1>>$ERRORFILE &
