###########################################################
#
# Aliases for Android flashing and development work
# Utilizing the adb & fastboot packages
#
###########################################################
alias adb_='adb devices -l'
alias adbk='adb kill-server'
alias adb.rt='adb root'
alias adb.urt='adb unroot'
alias adb.sh='adb shell'
alias adb.pu='adb push'
alias adb.pus='adb push --sync'
alias adb.ll='adb pull'
alias adb.lla='adb pull -a'
alias adb.syl='adb sync -l'
alias adb.syd='adb sync -n'
alias adb.sd="adb shell 'ls -AFC --color=always /storage/emulated/0/'"
alias adb.sys="adb shell 'ls -AFC --color=always /system/'"
alias adb.ven="adb shell 'ls -AFC --color=always /vendor/'"
alias adb.dat="adb shell 'ls -AFC --color=always /data/'"
alias adb.ins='adb install -rg --instant --streaming'
alias adb.un='adb uninstall'
alias adb.unk='adb uninstall -k' # Keep app files on device
alias adb.log='adb logcat --file="~/$(getprop ro.product.vendor.device)_$(date +%-I:%M_%_b-%_d-%_y).log" --format=raw,thread,color,descriptive -D --buffer=main,system,events,crash,security -S'
alias adb.re='adb reboot'
alias adb.rb='adb reboot bootloader'
alias adb.rr='adb reboot recovery'
alias adb.off='adb reconnect offline'
alias adb.num='adb get-serialno'
alias adb.con='adb tcpip && adb connect "$@":5555'

## Fastboot aliases for working with mobile devices
alias fast='fastboot'
alias fast_='fastboot devices -l'
alias fast.o='fastboot oem'
alias fast.re='fastboot reboot'
alias fast.rb='fastboot reboot bootloader'
alias fast.fb='fastboot flash boot'
alias fast.fr='fastboot flash recovery'
alias fast.fs='fastboot flash system'
alias fast.var='fastboot getvar all'
