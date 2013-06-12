# ddicon.mak
# Created by IBM WorkFrame/2 MakeMake at 20:01:15 on 29 Sept 1999
#
# The actions included in this make file are:
#  Compile::Resource Compiler
#  Compile::SOM Compiler
#  Compile::C++ Compiler
#  Link::Linker
#  Bind::Resource Bind

.SUFFIXES:

.SUFFIXES: \
    .IDL .c .obj .rc .res

.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|fF.RES

{F:\home\Jens\Programming\Som\DDIcon\Helpers}.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|fF.RES

{F:\home\Jens\Programming\Som\DDIcon}.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|fF.RES

.IDL.c:
    @echo " Compile::SOM Compiler "
    sc.exe -p -mnoint %s

{F:\home\Jens\Programming\Som\DDIcon\Helpers}.IDL.c:
    @echo " Compile::SOM Compiler "
    sc.exe -p -mnoint %s

{F:\home\Jens\Programming\Som\DDIcon}.IDL.c:
    @echo " Compile::SOM Compiler "
    sc.exe -p -mnoint %s

.c.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Q /Ti /Gm /Ge- /G5 /Ms /C %s

{F:\home\Jens\Programming\Som\DDIcon\Helpers}.c.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Q /Ti /Gm /Ge- /G5 /Ms /C %s

{F:\home\Jens\Programming\Som\DDIcon}.c.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Q /Ti /Gm /Ge- /G5 /Ms /C %s

all: \
    .\ddicon.dll

.\ddicon.dll: \
    .\prfh.obj \
    .\winh.obj \
    .\DDICON.obj \
    .\dosh.obj \
    .\gpih.obj \
    .\DDIcon.res \
    {$(LIB)}somtk.lib \
    {$(LIB)}ddicon.def
    @echo " Link::Linker "
    @echo " Bind::Resource Bind "
    icc.exe @<<
     /B" /de /noe"
     /Feddicon.dll
     somtk.lib
     ddicon.def
     .\prfh.obj
     .\winh.obj
     .\DDICON.obj
     .\dosh.obj
     .\gpih.obj
<<
    rc.exe .\DDIcon.res ddicon.dll

.\DDIcon.res: \
    F:\home\Jens\Programming\Som\DDIcon\DDIcon.rc \
    {F:\home\Jens\Programming\Som\DDIcon;$(INCLUDE)}DDIconIDS.h

.\DDICON.c: \
    F:\home\Jens\Programming\Som\DDIcon\DDICON.IDL

.\prfh.obj: \
    F:\home\Jens\Programming\Som\DDIcon\Helpers\prfh.c \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}dosh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}prfh.h

.\gpih.obj: \
    F:\home\Jens\Programming\Som\DDIcon\Helpers\gpih.c \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}winh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}gpih.h

.\dosh.obj: \
    F:\home\Jens\Programming\Som\DDIcon\Helpers\dosh.c \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}dosh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}pmprintf.h

.\DDICON.obj: \
    .\DDICON.c

.\winh.obj: \
    F:\home\Jens\Programming\Som\DDIcon\Helpers\winh.c \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}dosh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}winh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}prfh.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}gpih.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}undoc.h \
    {F:\home\Jens\Programming\Som\DDIcon\Helpers;$(INCLUDE);}pmprintf.h
