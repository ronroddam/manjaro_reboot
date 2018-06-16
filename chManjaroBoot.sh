#!/bin/sh
# This script compares available kernel vs. running kernal
# and recommends reboot if there's a difference.
# Ron Roddam 2018
NEXTLINE=0
FIND=""
for I in `file /boot/vmlinuz-4.1*`; do
  if [ ${NEXTLINE} -eq 1 ]; then
    FIND="${I}"
    NEXTLINE=0
   else
    if [ "${I}" = "version" ]; then NEXTLINE=1; fi
  fi
done
echo "Bootable Kernel =" ${FIND}
if [ ! "${FIND}" = "" ]; then
  CURRENT_KERNEL=`uname -r`
  if [ ! "${CURRENT_KERNEL}" = "${FIND}" ]; then
    echo "Running Kernel = "${CURRENT_KERNEL} "MISMATCH! - Boot required"
  fi
fi
