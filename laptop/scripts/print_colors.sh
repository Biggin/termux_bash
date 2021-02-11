#!/usr/bin/env bash

printf '\nThis is a test of Foreground\n'
printf '%bThis is a test of Bright_Foreground%b\n\n' "${Bfg}" "${Res}"

printf '%bThis is a test of Black%b\n' "${Blk}" "${Res}"
printf '%bThis is a test of Bright_Black%b\n\n' "${Bblk}" "${Res}"

printf '%bThis is a test of Red%b\n' "${Red}" "${Res}"
printf '%bThis is a test of Bright_Red%b\n\n' "${Bred}" "${Res}"

printf '%bThis is a test of Green%b\n' "${Grn}" "${Res}"
printf '%bThis is a test of Bright_Green%b\n\n' "${Bgrn}" "${Res}"

printf '%bThis is a test of Yellow%b\n' "${Yel}" "${Res}"
printf '%bThis is a test of Bright_Yellow%b\n\n' "${Byel}" "${Res}"

printf '%bThis is a test of Blue%b\n' "${Blu}" "${Res}"
printf '%bThis is a test of Bright_Blue%b\n\n' "${Bblu}" "${Res}"

printf '%bThis is a test of Magenta%b\n' "${Mag}" "${Res}"
printf '%bThis is a test of Bright_Magenta%b\n\n' "${Bmag}" "${Res}"

printf '%bThis is a test of Cyan%b\n' "${Cya}" "${Res}"
printf '%bThis is a test of Bright_Cyan%b\n\n' "${Bcya}" "${Res}"

printf '%bThis is a test of White%b\n' "${Whi}" "${Res}"
printf '%bThis is a test of Bright_White%b\n\n' "${Bwhi}" "${Res}"
