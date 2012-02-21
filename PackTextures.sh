#!/bin/bash

#  PackTextures.sh
#  CVS-Tycoon
#
#  Created by ZHANG ZHE on 1/11/12.
#  Copyright (c) 2012 AvalonGameArt. All rights reserved.

#!/bin/sh

TP="/usr/local/bin/TexturePacker"

#BEGIN NEW ADDITION
if [ -e ${TP} ]; then
echo “TexturePacker found. Compressing images.”
else
echo “TexturePacker does not exist. You can download it from http://texturepacker.com”
exit 0
fi
#END NEW ADDITION

if [ "${ACTION}" = "clean" ]
then
echo "cleaning..."

#rm CVS-Tycoon/Images/scene1atlas.pvr.ccz
#rm CVS-Tycoon/Images/scene1atlas.plist

# ....
# add all files to be removed in clean phase
# ....
else
echo "building..."

# create hd assets
${TP} --smart-update \
--format cocos2d \
--data CVS-Tycoon/Images/scene1atlas.plist \
--sheet CVS-Tycoon/Images/scene1atlas.pvr.ccz \
--trim-sprite-names \
--algorithm MaxRects \
--maxrects-heuristics best \
--max-size 1024 \
--dither-fs-alpha \
--opt RGBA4444 \
--premultiply-alpha \
Assets/Images/*.png

#${TP} --smart-update \
#--format cocos2d \
#--data CVS-Tycoon/Images/scene1atlas.plist \
#--sheet CVS-Tycoon/Images/scene1atlas.pvr.ccz \
#--dither-fs-alpha \
#--opt RGB565 \
#Assets/Images/*.png

# ....
# add other sheets to create here
# ....
fi
exit 0