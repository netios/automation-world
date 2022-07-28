#===========================
RUN_DIRECTORY=~/bin/
DIRECTORY=~/bin/kubecolor/
APPFILE=kubecolor
LINKFILE=k
#===========================
if [ ! -d "$DIRECTORY" ]; then
  # echo $DIRECTORY not exist.
  mkdir -p $DIRECTORY
fi
cd $DIRECTORY
curl -L -s $(curl -L  -s https://github.com/hidetatz/kubecolor/releases/latest | egrep '<a.+Linux_x86_64.tar.gz' | awk -F\" '{print "https://github.com"$2}') | tar -zx
cd $RUN_DIRECTORY
if [ -f "$LINKFILE" ]; then
  # echo $LINKFILE exist.
  rm $LINKFILE
  # ln -s -f ${DIRECTORY}${APPFILE} $LINKFILE
fi
ln -s ${DIRECTORY}${APPFILE} $LINKFILE
chmod +x $LINKFILE
export PATH=$PATH:$HOME/bin
echo "==== kubecolor install done. ===="
