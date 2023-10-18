rd /s /q ANELLGL.ane




copy /y %pathtome%..\..\ane\ANELLGL.ane .

copy /y ANELLGL.ane %pathtome%..\lib\


unzip.exe ANELLGL.ane -d ANELLGL
del ANELLGL.ane

rename ANELLGL ANELLGL.ane

exit