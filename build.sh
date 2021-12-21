#!/bin/bash

export KERNELNAME=RolleStrix

export LOCALVERSION=beta

export KBUILD_BUILD_USER=Xenoms

export KBUILD_BUILD_HOST=#funproject

export TOOLCHAIN=clang

export DEVICES=lavender

source helper

gen_toolchain

send_msg "Memulai Build Kernel ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do 

	build ${i} -kernel

done

END=$(date +"%s")
 
DIFF=$(( END - START ))

send_msg "BUILD telah SUKSES dalam $((DIFF / 60))m:$((DIFF % 60))s | komit akhirmu adalah: $(git log --pretty=format:'%h : %s' -5)"
