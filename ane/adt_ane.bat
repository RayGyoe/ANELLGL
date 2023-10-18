REM Get the path to the script and trim to get the directory.
@echo off
SET projectName=ANELLGL
echo Setting path to current directory to:
SET pathtome=%~dp0


del ANELLGL.ane

call copyswc.bat
call copydll.bat

echo start adt ane

adt -package -tsa none -storetype pkcs12 -keystore cert.p12 -storepass fd -target ane ANELLGL.ane extension.xml -swc ANELLGL.swc -platform Windows-x86 -C Windows-x86 .  -platform Windows-x86-64 -C Windows-x86-64 . -platform default -C default .

echo end adt ane