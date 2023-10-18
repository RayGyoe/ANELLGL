del Windows-x86\ANELLGL.dll
del Windows-x86-64\ANELLGL.dll

copy /y %pathtome%..\native\ANELLGL\x64\Release\ANELLGL.dll "./Windows-x86-64"
copy /y %pathtome%..\native\ANELLGL\Release\ANELLGL.dll "./Windows-x86"