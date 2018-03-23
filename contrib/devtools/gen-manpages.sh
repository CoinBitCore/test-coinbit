#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

COINBITD=${COINBITD:-$SRCDIR/coinbitd}
COINBITCLI=${COINBITCLI:-$SRCDIR/coinbit-cli}
COINBITTX=${COINBITTX:-$SRCDIR/coinbit-tx}
COINBITQT=${COINBITQT:-$SRCDIR/qt/coinbit-qt}

[ ! -x $COINBITD ] && echo "$COINBITD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
CTBVER=($($COINBITCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for coinbitd if --version-string is not set,
# but has different outcomes for coinbit-qt and coinbit-cli.
echo "[COPYRIGHT]" > footer.h2m
$COINBITD --version | sed -n '1!p' >> footer.h2m

for cmd in $COINBITD $COINBITCLI $COINBITTX $COINBITQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${CTBVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${CTBVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
