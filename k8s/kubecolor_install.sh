#===========================
RUN_DIRECTORY=~/bin/
DIRECTORY=~/bin/kubecolor/
APPFILE=kubecolor
LINKDIRECTORY=~/.local/bin/
LINKFILE=kubecolor
#===========================
if [ ! -d "$DIRECTORY" ]; then
  # echo $DIRECTORY not exist.
  mkdir -p $DIRECTORY
fi
cd $DIRECTORY
#--- old
#GETVER=$(curl -L  -s https://github.com/hidetatz/kubecolor/releases/latest | egrep "<title>Release" | awk '{print $2}' | tr -d 'v')
#curl -L -s https://github.com/hidetatz/kubecolor/releases/download/v${GETVER}/kubecolor_${GETVER}_Linux_x86_64.tar.gz | tar -zx
#
#--- new
GETVER=0.0.25   #https://github.com/netios/kubecolor/releases/tag/v0.0.25
curl -L -s https://github.com/netios/kubecolor/releases/download/v${GETVER}/kubecolor_${GETVER}_Linux_x86_64.tar.gz | tar -zx
cd $RUN_DIRECTORY
if [ -f "$LINKFILE" ]; then
  # echo $LINKFILE exist.
  rm $LINKFILE
  # ln -s -f ${DIRECTORY}${APPFILE} $LINKFILE
fi
ln -s ${DIRECTORY}${APPFILE} ${LINKDIRECTORY}${LINKFILE}
chmod +x ${LINKDIRECTORY}${LINKFILE}

#export PATH=$PATH:$HOME/.local/bin

echo "==== kubecolor install done. ===="
