#!/bin/zsh
white="rgb(255,255,255)"
red="rgb(255,0,0)"
green="rgb(0,255,0)"
blue="rgb(0,0,255)"
black="rgb(0,0,0)"
sudo liquidctl \
  --match Corsair \
  set led color super-fixed \
    $white $white $white \
    $blue $blue $blue $blue $blue $blue $blue $blue $blue $blue $blue $blue $blue \
    $red $red $red $red \
    $red $red $red $red
