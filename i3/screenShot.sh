#!/bin/bash

fileName=Screenshot_$(date '+%d_%m_%Y_%H_%M_%S.png');
scrot $fileName -e 'mv $f ~/Pictures/Screenshots'
dunstify "Screenshot saved at $location/$fileName"

