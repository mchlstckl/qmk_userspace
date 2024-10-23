#!/bin/bash




cp keyboards/converter/usb_usb/config.h ../qmk_firmware/keyboards/converter/usb_usb/config.h

cd ..

toolbox run /bin/bash -c 'cd qmk_firmware && qmk userspace-compile'

read -p "Push the little button on the converter now and press Enter to continue"


sudo ~/bin/dfu-programmer atmega32u4 erase --force

sleep 2

sudo ~/bin/dfu-programmer atmega32u4 flash ./qmk_userspace/converter_usb_usb_hasu_michaelst.hex

sleep 2

sudo ~/bin/dfu-programmer atmega32u4 reset

echo "Done"
