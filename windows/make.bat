@echo off

msbuild BreakpadTools.sln /p:Configuration=Release /p:Platform=x86 /t:Clean,Build

pushd Release
dump_syms crash.pdb > crash.sym
crash
ren *.dmp mini.dmp
popd
