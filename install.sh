#!/usr/bin/env bash

export TECH_DIR="GF180"
export ROOT_DIR="${TECH_DIR}/workspace_setup"

# files to copy from workspace_setup
 cp_files=( ".maginit_personal"
            ".bashrc_bag"
            ".bashrc_personal")

# files to link from workspace_setup
ln_files=( ".maginit"
           ".bashrc"
           ".gitignore"
           ".spiceinit"
           "bag_startup.py"
           "start_mag.sh"
           "start_bag.sh")

# user configuration files; copy
for f in "${cp_files[@]}"; do
    cp ${ROOT_DIR}/${f} .
    git add -f ${f}
done

# standard configuration files; symlink
for f in "${ln_files[@]}"; do
    ln -s ${ROOT_DIR}/${f} .
    git add -f ${f}
done

# setup .ipython
export CUR_DIR=".ipython/profile_default"
mkdir -p ${CUR_DIR}
ln -s "../../${ROOT_DIR}/ipython_config.py" "${CUR_DIR}/ipython_config.py"
git add -f ${CUR_DIR}/ipython_config.py

# # setup gen_libs folder
# mkdir gen_libs
# touch gen_libs/.gitignore
# git add -f gen_libs/.gitignore

# # setup cds.lib
# echo 'INCLUDE $BAG_WORK_DIR/cds.lib.core' > cds.lib

# link BAG run scripts
# ln -s BAG_framework/run_scripts/start_bag_ICADV12d3.il start_bag.il
# ln -s BAG_framework/run_scripts/start_bag.sh .
# ln -s BAG_framework/run_scripts/virt_server.sh .
# ln -s BAG_framework/run_scripts/setup_submodules.py .
# git add start_bag.il
# git add start_bag.sh
# git add virt_server.sh
# git add setup_submodules.py

# # create empty template_libs.def
# touch template_libs.def
# git add -f template_libs.def

# # link test specifications
# ln -s ${TECH_DIR}/specs_test .
# git add specs_test