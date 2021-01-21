blk='\e[30m'
red='\e[31m'
yel='\e[32m'
grn='\e[33m'
blu='\e[34m'
mag='\e[35m'
cya='\e[36m'
whi='\e[37m'
res='\e[00m'

## Function to display uptime of a system. All credits to the original author.
function upinfo() {
    echo -ne "${blu}${HOSTNAME} ${mag}uptime is ${yel} \\t "
    uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10,$11}'
}

## Extract any compressed file type with one universal command 
function extract {
 if [ -z "$1" ]; then
      # display usage if no parameters given
      echo -e $yel"Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
      echo -e $yel"       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"$res
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
                            echo -e $red"extract: '$n' - unknown archive method"$res
                            return 1
                            ;;
             esac
         else
             echo -e $red"'$n' - file does not exist"$res
             return 1
        fi
      done
 fi
}

## Make a new directory and change into it
function go () {
	mkdir -p $1
	cd $1
}

## Testing a new clone function to prevent having to type the full domain name each time
function clone () {
	git clone https://github.com/"$@"
}

function lab () {
	git clone https://gitlab.com/"$@"
}