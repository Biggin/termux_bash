# ${HOME}/.bash_function sourced by ${HOME}/.bashrc upon login for my custom functions to make life a little easier...
#
# Sets the color variables used for printing text during function calls
BLK=\033[30m
RED=\033[31m
YEL=\033[32m
GRN=\033[33m
BLU=\033[34m
MAG=\033[35m
CYA=\033[36m
WHI=\033[37m
RES=\033[00m

## Function to display uptime of a system. All credits to the original author.
function upinfo() {
    echo -ne "\t\tHello, ${CYA}${USER}${RES}!\nYour machine, ${YEL}${HOSTNAME},${RES} has been in use for${YEL} \\t ${RED}"
    "uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10,$11}'${RES}"
}

## Extract any compressed file type with one universal command 
function extract {
 if [ -z "$1" ]; then
      # display usage if no parameters given
      echo -e "${WHI}Usage: ${RED}extract ${CYA}<path/file_name>${WHI}.${MAG}<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>${RES}"
      echo -e "       ${RED}extract ${CYA}<path/file_name_1.ext> ${YEL}[path/file_name_2.ext] [path/file_name_3.ext]${RES}"
      return 1
 else
      for n in $@
      do
        if [ -f "$n" ] ; then
             case "${n%,}" in
               *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                            tar xvf "$n"       ;;
               *.lzma)      unlzma ./"$n"      ;;
               *.bz2)       bunzip2 ./"$n"     ;;
               *.rar)       unrar x -ad ./"$n" ;;
               *.gz)        gunzip ./"$n"      ;;
               *.zip)       unzip ./"$n"       ;;
               *.z)         uncompress ./"$n"  ;;
                *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                            7z x ./"$n"        ;;
               *.xz)        unxz ./"$n"        ;;
               *.exe)       cabextract ./"$n"  ;;
               *)
                            echo "extract: '$n' - unknown archive method"
                            return 1
                            ;;
             esac
         else
             echo -e "${GRN}'$n' ${WHI}- ${RED}file does not exist.${RES}" 
             return 1 
        fi 
      done
 fi
}

## Make a new directory and change into it
function go () {
	mkdir -p $1
	cd $1
        echo -e "${YEL}You're now inside of your new dir at ${BLU}$(pwd)${RES}"
}

## Testing a new clone function to prevent having to type the full domain name each time
function clone () {
	git clone https://github.com/$1
}
