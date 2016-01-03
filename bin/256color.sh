#!/bin/bash
function 256colortest() {
    for i in {0..255} ; do
        printf "\x1b[48;05;${i}m ${i} "
    done
}

256colortest
