if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

##
# Your previous /Users/tamac/.bash_profile file was backed up as /Users/tamac/.bash_profile.macports-saved_2013-11-19_at_20:52:37
##

# MacPorts Installer addition on 2013-11-19_at_20:52:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

source .bashrc

export PATH="$PATH:/Applications/microchip/xc8/v1.44/bin"
