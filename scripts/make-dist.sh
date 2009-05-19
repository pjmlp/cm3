#!/bin/sh
# $Id: make-dist.sh,v 1.3 2009-05-19 20:56:48 wagner Exp $

if [ -n "$ROOT" -a -d "$ROOT" ] ; then
  sysinfo="$ROOT/scripts/sysinfo.sh"
else
  root=`pwd`
  while [ -n "$root" -a ! -f "$root/scripts/sysinfo.sh" ] ; do
    root=`dirname $root`
  done
  sysinfo="$root/scripts/sysinfo.sh"
  if [ ! -f "$sysinfo" ] ; then
    echo "scripts/sysinfo.sh not found" 1>&2
    exit 1
  fi
  export root
fi

. "$sysinfo"
. "$ROOT/scripts/pkginfo.sh"

STAGE="${STAGE:-${TMPDIR}}"
INSTALLROOT="${STAGE}/cm3"
rm -rf ${INSTALLROOT}

DS="RC1"; export DS
DIST=min  NOCLEAN=yes SYSINFO_DONE="" "$ROOT/scripts/make-bin-dist-min.sh"
DIST=core NOCLEAN=yes SYSINFO_DONE="" "$ROOT/scripts/make-bin-dist-min.sh"

PATH="${INSTALLROOT}/bin:${PATH}"
"$ROOT/scripts/do-cm3-all.sh" buildship -no-m3ship-resolution -group-writable

PKG_COLLECTIONS="devlib m3devtool m3gdb webdev gui anim database cvsup obliq juno caltech-parser demo tool math game core"

cd "${ROOT}"
for c in ${PKG_COLLECTIONS}; do
  P=`fgrep " $c" $ROOT/scripts/pkginfo.txt | awk "{print \\$1}" | tr '\\n' ' '`
  PKGS=""
  for x in $P; do
    if [ -d "$x" ] ; then
      PKGS="${PKGS} $x"
    else
      p=`pkgpath $x`
      if [ -d "$p" ] ; then
        PKGS="${PKGS} $p"
      else
        echo " *** cannot find package $x / $p" 1>&2
        exit 1
      fi
    fi
  done
  (
    echo '#!/bin/sh'
    echo 'HERE=`pwd`'
    echo "for p in ${PKGS}; do"
      echo 'cd $p'
      echo 'cm3 -ship ${SHIPARGS}'
      echo 'cd $HERE'
    echo "done"
  ) > install.sh
  chmod 755 install.sh
  ARCHIVE="${STAGE}/cm3-bin-ws-${c}-${TARGET}-${CM3VERSION}-${DS}.tgz"
  "${TAR}"  --exclude '*.o' --exclude '*.mo' --exclude '*.io' \
    -czf "${ARCHIVE}" install.sh ${PKGS}
  ls -l "${ARCHIVE}"
done
if [ "$SHIPRC" = "y" -o "$SHIPRC" = "yes" ]; then
  scp ${STAGE}/cm3-*-${DS}.tgz birch:/var/www/modula3.elegosoft.com/cm3/releng
fi