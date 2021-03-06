# This patch script should only be used for a clean installation.
# It doesn't patch existing databases.
echo "******************************************************************************"
echo "Patch Oracle Software." `date`
echo "******************************************************************************"
 
# Adjust to suit your patch level.
export PATH=${ORACLE_HOME}/OPatch:${PATH}
export OPATCH_FILE="p6880880_190000_Linux-x86-64.zip"
export PATCH_FILE="p30783543_190000_Linux-x86-64.zip"
export PATCH_TOP=/u01/software/30783543
export PATCH_PATH1=${PATCH_TOP}/30869156
export PATCH_PATH2=${PATCH_TOP}/30805684

echo "******************************************************************************"
echo "Prepare opatch." `date`
echo "******************************************************************************"

cd ${ORACLE_HOME}
unzip -oq /vagrant_software/${OPATCH_FILE}

echo "******************************************************************************"
echo "Unzip software." `date`
echo "******************************************************************************"

mkdir /u01/software
cp /vagrant_software/${PATCH_FILE} /u01/software
cd /u01/software
unzip -oq ${PATCH_FILE}

echo "******************************************************************************"
echo "Apply patches." `date`
echo "******************************************************************************"

cd ${PATCH_PATH1}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent

cd ${PATCH_PATH2}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent
