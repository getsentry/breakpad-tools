@echo off

pushd windows
make
7z a breakpad-tools-windows.zip Release/*
popd
