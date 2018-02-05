#!/bin/bash
# START - Configuration
DRIVE_TO_MOUNT=( 'DriveOne' 'DriveTwo' )
PATH_WHERE_MOUNT=( 'mounthPathOne' 'mounthPathTwo' )
MOUNT_TYPE=( 'DriveOneType' 'DriveTwoType' )
# END - Configuration

# ========================================================================================================================
# ========================================================================================================================
# ========================================================================================================================

# START - Check that the size of the arrays is the same
COUNT_DRIVE_TO_MOUNT=${#DRIVE_TO_MOUNT[@]}
COUNT_PATH_WHERE_MOUNT=${#PATH_WHERE_MOUNT[@]}
COUNT_MOUNT_TYPE=${#MOUNT_TYPE[@]}

echo "Verify configuration..."
if [ "$COUNT_DRIVE_TO_MOUNT" != "$COUNT_PATH_WHERE_MOUNT" ] ||
   [ "$COUNT_PATH_WHERE_MOUNT" != "$COUNT_MOUNT_TYPE" ];
then
  echo 'Invalid configuration...!'
  exit
fi
echo "[OK] Configuration are valid!"
# END - Check that the size of the arrays is the same

# START - Verify that the all value of PATH_WHERE_MOUNT array exist
echo "Verify mount path..."
for currentPath in "${PATH_WHERE_MOUNT[@]}"
do
  if [ ! -d "$currentPath" ]; then
    echo "Directory '$currentPath' not exist!!"
    echo "Please, create the missing folder and restart the script!"
    exit
  fi
done
echo "[OK] Mount path are valid!"
# END - Verify that the all value of PATH_WHERE_MOUNT array exist

# START - Verify the availability of the network drive
ARRAY_INDEX=0
for currentDriveToMount in "${DRIVE_TO_MOUNT[@]}"
do
  echo "===== ===== ===== ===== ===== ===== ===== ===== ===== ====="
  # START - Verify if the current Drive is already mounted
  if mount | grep "${DRIVE_TO_MOUNT[$ARRAY_INDEX]}" > /dev/null; then
    echo "Current Drive is already mounted! Skip to next drive..."
  else
    echo "Starting MOUNT operations for drive '${DRIVE_TO_MOUNT[$ARRAY_INDEX]}'"

    echo "Now try to MOUNT the drive..."
    MOUNT_COMMAND="sudo mount -t ${MOUNT_TYPE[$ARRAY_INDEX]} ${DRIVE_TO_MOUNT[$ARRAY_INDEX]} ${PATH_WHERE_MOUNT[$ARRAY_INDEX]}"
    echo `$MOUNT_COMMAND`
  fi
  ((ARRAY_INDEX = ARRAY_INDEX + 1))
done # for currentDriveToMount in "${DRIVE_TO_MOUNT[@]}"
# END - Verify the availability of the network drive

echo 'End script!! Bye bye...'
