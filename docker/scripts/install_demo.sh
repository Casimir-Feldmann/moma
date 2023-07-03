#!/bin/bash
set -o pipefail

cd $MOMA_DEP_WS/src || exit 1

# Install the MOMA, VGN, and ROBOT_HELPERS repos.
vcs import --recursive --input $SCRIPTS_PATH/moma_demo.repos

# Upgrade numpy version
pip install --upgrade numpy==1.23.0

# Pip install VGN requirements
pip install -r vgn/requirements.txt

# Pip install gdown to get google drive files
pip install gdown

# Make sure we can unzip too
apt-get install unzip

# Download the data file from google drive
gdown 1MysYHve3ooWiLq12b58Nm8FWiFBMH-bJ

# Unzip and place it in the correct place
unzip data.zip -d vgn_data
mv vgn_data/data/* vgn/assets/
rm -r vgn_data

# Hope that's it! :)
