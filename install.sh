#!/bin/sh

#-------------------------------
# Install the extension to user gnome-shell extensions folder
#-------------------------------
cd ~
# check if the user gnome-shell extensions folder
GNOME_SHELL_DIR=".local/share/gnome-shell"
if [ -d "$GNOME_SHELL_DIR" ]; then
    echo "User gnome-shell directory found..."
else
    echo "Creating user gnome-shell directory..."
    mkdir $GNOME_SHELL_DIR
fi
GNOME_SHELL_EXT_DIR=".local/share/gnome-shell/extensions"
if [ -d "$GNOME_SHELL_EXT_DIR" ]; then
    echo "User gnome-shell extensions directory found..."
else
    echo "Creating user gnome-shell extensions directory..."
    mkdir $GNOME_SHELL_EXT_DIR
fi

UUID="gnome-shell-extension-maximized-by-default@axe1.github.com"
if [ -d "$GNOME_SHELL_EXT_DIR/$UUID" ]; then
    echo "The maximize to workspace extension directory found... Cleaning it"
    rm -rf "$GNOME_SHELL_EXT_DIR/$UUID/*"

else
    echo "Creating the maximize to workspace extension directory..."
    mkdir $GNOME_SHELL_EXT_DIR/$UUID
fi

cd -
echo "Copying the extension..."
cp src/* ~/$GNOME_SHELL_EXT_DIR/$UUID

echo "Restarting gnome-shell..."
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")'

echo "Done."
echo "/!\ Logout and log in again to see the extension in the Extensions App."
exit 1