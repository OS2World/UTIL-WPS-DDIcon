DDIcon version 1.00
====================

Copyright (C) 1999 Jens Borch Christiansen

Important!!!
----------
Remember to take a desktop backup before installing this software

Purpose
-------
A replacement class for WPIcon, which makes it possible to change the icon of
one or more objects, by dropping them on an icon object. I got the idea for
this program from another program called MMIcon created by Makoto Nagata. MMIcon
does exactly the same thing as this program, but I could not make it work, so I
decided to create my own version of MMIcon. Fortunately MMIcon was provided with
full source, so it was quite easy to create DDIcon.

Installation
-----------
Installing DDIcon is simple, just copy the files to a directory of your choice
and run install.cmd. After the installation script has terminated reboot your
machine (or alternatively restart the desktop). To deinstall run uninstall.cmd
and reboot (or restart the desktop).

Compiling DDIcon
----------------
In order to compile DDIcon you need pmprintf and the helper functions from
Xfolder version 0.85. From Xfolder the following files are needed (can be
found in helpers directory in the Xfolder source package):

dosh.c
gpih.h
prfh.c
winh.c
dosh.h
gpih.c
prfh.h
undoc.h
winh.h

Pmprintf can be found at hobbes (http://hobbes.nmsu.edu/) and the Xfolder source
code can be obtained at the Xfolder homepage
(http://www2.rz.hu-berlin.de/~h0444vnd/). Pmprintf is used for debugging and can
be turned off by uncommenting #define _PMPRINTF_ and by not linking with
pmprintf.lib in ddicon.mak. The make file is created with makemake, so you
probably need to edit it anyway.

DDIcon currently only uses two functions from Xfolder, so if you do not want to
download the Xfolder source you can just paste the following code into ddicon.c:

/*
 * Xfolder helper function
 */
SHORT winhInsertMenuItem(HWND hwndMenu,     // in:  menu to insert item into
                         SHORT iPosition,   // in:  zero-based index of where to
                                            //      insert or MIT_END
                         SHORT sItemId,     // in:  ID of new menu item
                         PSZ pszItemTitle,  // in:  title of new menu item
                         SHORT afStyle,     // in:  MIS_* style flags
                         SHORT afAttr)      // in:  MIA_* attribute flags
{
    MENUITEM mi;
    SHORT    src = MIT_ERROR;

    mi.iPosition = iPosition;
    mi.afStyle = afStyle;
    mi.afAttribute = afAttr;
    mi.id = sItemId;
    mi.hwndSubMenu = 0;
    mi.hItem = 0;
    src = SHORT1FROMMR(WinSendMsg(hwndMenu, MM_INSERTITEM, (MPARAM)&mi, (MPARAM)pszItemTitle));
    return (src);
}

/*
 * Xfolder helper function
 */
SHORT winhInsertMenuSeparator(HWND hMenu,       // in: menu to add separator to
                              SHORT iPosition,  // in: index where to add separator or MIT_END
                              SHORT sId)        // in: separator menu ID (doesn't really matter)
{
    MENUITEM mi;
    mi.iPosition = iPosition;
    mi.afStyle = MIS_SEPARATOR;             // append separator
    mi.afAttribute = 0;
    mi.id = sId;
    mi.hwndSubMenu = 0;
    mi.hItem = 0;

    return (SHORT1FROMMR(WinSendMsg(hMenu,
                    MM_INSERTITEM,
                    (MPARAM)&mi,
                    (MPARAM)"")));
}

Acknowledgments
---------------
Makoto Nagata - Creator of MMIcon
Torsten Balle Koefoed - For providing installation scripts
Tema OS/2 Aalborg, Denmark - For testing this software

Bugs
----
Emphasis is not set correctly after a drag operation has ended. I do not really
know why this is happening, since wpDrop returns RC_DROP_ITEMCOMPLETE if the
drag operation was successful. If anyone know how to fix this problem I would
like to know.

Author
------
Jens Borch Christiansen
jgbc@mail1.stofanet.dk


License Agreement
-----------------
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of
the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
02111-1307  USA
