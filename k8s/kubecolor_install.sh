#===========================
RUN_DIRECTORY=~/bin/
DIRECTORY=~/bin/kubecolor/
APPFILE=kubecolor
#LINKFILE=k   # not use, will remove [R01]
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
#ln -s ${DIRECTORY}${APPFILE} $LINKFILE    # not use, will remove [R01]
#chmod +x $LINKFILE   # not use, will remove [R01]

export PATH=$PATH:$HOME/bin

/bin/mv $HOME/bin/kubecolor $HOME/bin/kubecolor_v${GETVER} -f
/bin/cp $HOME/bin/kubecolor_v${GETVER} $HOME/bin/ -i

echo "==== kubecolor install done. ===="
