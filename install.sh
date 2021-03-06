#!/bin/sh

expand_path() {
  READLINK=`which greadlink`
  if [ ! -e ${READLINK} ]; then
    READLINK=`which readlink`
    if [ ! -e ${READLINK} ]; then
      echo "cannot find readlink: abort"
      exit 1
    fi
  fi

  echo `${READLINK} -f $1`
}

main() {
  DIR=`dirname $(expand_path $0)`
  for f in ${DIR}/dot_*; do
    linkname=`basename $f | sed -e 's/dot_\(.*\)$/\1/'`
    [[ ! -e ~/.$linkname ]] && ln -s $f ~/.$linkname
  done

  return 0
}

main
