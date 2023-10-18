rd /s /q swc
del ANELLGL.swc

copy /y %pathtome%..\swc\lib\ANELLGL.swc .

unzip.exe ANELLGL.swc -d swc

copy /y swc\library.swf .
copy /y library.swf default
copy /y library.swf Windows-x86
copy /y library.swf Windows-x86-64

rd /s /q swc