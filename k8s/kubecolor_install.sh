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
GETVER=$(curl -L  -s https://github.com/hidetatz/kubecolor/releases/latest | egrep "<title>Release" | awk '{print $2}' | tr -d 'v')
curl -L -s https://github.com/hidetatz/kubecolor/releases/download/v${GETVER}/kubecolor_${GETVER}_Linux_x86_64.tar.gz | tar -zx
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
