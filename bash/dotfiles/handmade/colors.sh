#!/data/data/com.termux/files/usr/bin/env bash

    ##########################################################
    #                                                        #
    #   Author: clnelson@github.com                          #
    #   Date: Jan/25/2021                                    #
    #   License: GPLv3                                       #
    #                                                        #
    #   Special thanks to everyone that I've 'borrowed'      #
    #   code from, 'Akhil Narang', 'Nathan Chancellor',      #
    #   'osm0sis', 'enesuzun2002' & anyone else that I've    #
    #   missed. Without these guys my code would'nt be       #
    #   here, THANK YOU OPENSOURCE SOFTWARE!                 #
    #  ----------------------------------------------------  #
    #   My modified version of the BASH 'ANSI escape'        #
    #   color variables to fit my environment and            #
    #   coding style.                                        #
    #                                                        #
    ##########################################################

#: Regular colors are listed first and BOLD colors are listed second,
#: 'echo' command compatible color codes are listed last!
export Res="\033[0m"
export Bfg="\033[1m"
export Eres='\e[0m'

export Blk="\033[30m"
export Bblk="\033[1;30m"
export Eblk='\e[30m'

export Red="\033[31m"
export Bred="\033[1;31m"
export Ered='\e[31m'

export Grn="\033[32m"
export Bgrn="\033[1;32m"
export Egrn='\e[32m'

export Yel="\033[33m"
export Byel="\033[1;33m"
export Eyel='\e[33m'

export Blu="\033[34m"
export Bblu="\033[1;34m"
export Eblu='\e[34m'

export Mag="\033[35m"
export Bmag="\033[1;35m"
export Emag='\e[35m'

export Cya="\033[36m"
export Bcya="\033[1;36m"
export Ecya='\e[36m'

export Whi="\033[37m"
export Bwhi="\033[1;37m"
export Ewhi='\e[37m'
