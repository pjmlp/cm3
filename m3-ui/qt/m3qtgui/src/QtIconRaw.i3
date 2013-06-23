(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtIconRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QIcon0 *>
PROCEDURE New_QIcon0 (): QIcon;

<* EXTERNAL New_QIcon1 *>
PROCEDURE New_QIcon1 (pixmap: ADDRESS; ): QIcon;

<* EXTERNAL New_QIcon2 *>
PROCEDURE New_QIcon2 (other: ADDRESS; ): QIcon;

<* EXTERNAL New_QIcon3 *>
PROCEDURE New_QIcon3 (fileName: ADDRESS; ): QIcon;

<* EXTERNAL New_QIcon4 *>
PROCEDURE New_QIcon4 (engine: ADDRESS; ): QIcon;

<* EXTERNAL New_QIcon5 *>
PROCEDURE New_QIcon5 (engine: ADDRESS; ): QIcon;

<* EXTERNAL Delete_QIcon *>
PROCEDURE Delete_QIcon (self: QIcon; );

<* EXTERNAL QIcon_pixmap *>
PROCEDURE QIcon_pixmap (self: QIcon; size: ADDRESS; mode, state: C.int; ):
  ADDRESS;

<* EXTERNAL QIcon_pixmap1 *>
PROCEDURE QIcon_pixmap1 (self: QIcon; size: ADDRESS; mode: C.int; ):
  ADDRESS;

<* EXTERNAL QIcon_pixmap2 *>
PROCEDURE QIcon_pixmap2 (self: QIcon; size: ADDRESS; ): ADDRESS;

<* EXTERNAL QIcon_pixmap3 *>
PROCEDURE QIcon_pixmap3 (self: QIcon; w, h, mode, state: C.int; ): ADDRESS;

<* EXTERNAL QIcon_pixmap4 *>
PROCEDURE QIcon_pixmap4 (self: QIcon; w, h, mode: C.int; ): ADDRESS;

<* EXTERNAL QIcon_pixmap5 *>
PROCEDURE QIcon_pixmap5 (self: QIcon; w, h: C.int; ): ADDRESS;

<* EXTERNAL QIcon_pixmap6 *>
PROCEDURE QIcon_pixmap6 (self: QIcon; extent, mode, state: C.int; ):
  ADDRESS;

<* EXTERNAL QIcon_pixmap7 *>
PROCEDURE QIcon_pixmap7 (self: QIcon; extent, mode: C.int; ): ADDRESS;

<* EXTERNAL QIcon_pixmap8 *>
PROCEDURE QIcon_pixmap8 (self: QIcon; extent: C.int; ): ADDRESS;

<* EXTERNAL QIcon_actualSize *>
PROCEDURE QIcon_actualSize
  (self: QIcon; size: ADDRESS; mode, state: C.int; ): ADDRESS;

<* EXTERNAL QIcon_actualSize1 *>
PROCEDURE QIcon_actualSize1 (self: QIcon; size: ADDRESS; mode: C.int; ):
  ADDRESS;

<* EXTERNAL QIcon_actualSize2 *>
PROCEDURE QIcon_actualSize2 (self: QIcon; size: ADDRESS; ): ADDRESS;

<* EXTERNAL QIcon_paint *>
PROCEDURE QIcon_paint
  (self: QIcon; painter, rect: ADDRESS; alignment, mode, state: C.int; );

<* EXTERNAL QIcon_paint1 *>
PROCEDURE QIcon_paint1
  (self: QIcon; painter, rect: ADDRESS; alignment, mode: C.int; );

<* EXTERNAL QIcon_paint2 *>
PROCEDURE QIcon_paint2
  (self: QIcon; painter, rect: ADDRESS; alignment: C.int; );

<* EXTERNAL QIcon_paint3 *>
PROCEDURE QIcon_paint3 (self: QIcon; painter, rect: ADDRESS; );

<* EXTERNAL QIcon_paint4 *>
PROCEDURE QIcon_paint4 (self                              : QIcon;
                        painter                           : ADDRESS;
                        x, y, w, h, alignment, mode, state: C.int;   );

<* EXTERNAL QIcon_paint5 *>
PROCEDURE QIcon_paint5
  (self: QIcon; painter: ADDRESS; x, y, w, h, alignment, mode: C.int; );

<* EXTERNAL QIcon_paint6 *>
PROCEDURE QIcon_paint6
  (self: QIcon; painter: ADDRESS; x, y, w, h, alignment: C.int; );

<* EXTERNAL QIcon_paint7 *>
PROCEDURE QIcon_paint7
  (self: QIcon; painter: ADDRESS; x, y, w, h: C.int; );

<* EXTERNAL QIcon_isNull *>
PROCEDURE QIcon_isNull (self: QIcon; ): BOOLEAN;

<* EXTERNAL QIcon_isDetached *>
PROCEDURE QIcon_isDetached (self: QIcon; ): BOOLEAN;

<* EXTERNAL QIcon_detach *>
PROCEDURE QIcon_detach (self: QIcon; );

<* EXTERNAL QIcon_serialNumber *>
PROCEDURE QIcon_serialNumber (self: QIcon; ): C.int;

<* EXTERNAL QIcon_cacheKey *>
PROCEDURE QIcon_cacheKey (self: QIcon; ): C.unsigned_long;

<* EXTERNAL QIcon_addPixmap *>
PROCEDURE QIcon_addPixmap
  (self: QIcon; pixmap: ADDRESS; mode, state: C.int; );

<* EXTERNAL QIcon_addPixmap1 *>
PROCEDURE QIcon_addPixmap1 (self: QIcon; pixmap: ADDRESS; mode: C.int; );

<* EXTERNAL QIcon_addPixmap2 *>
PROCEDURE QIcon_addPixmap2 (self: QIcon; pixmap: ADDRESS; );

<* EXTERNAL QIcon_addFile *>
PROCEDURE QIcon_addFile
  (self: QIcon; fileName, size: ADDRESS; mode, state: C.int; );

<* EXTERNAL QIcon_addFile1 *>
PROCEDURE QIcon_addFile1
  (self: QIcon; fileName, size: ADDRESS; mode: C.int; );

<* EXTERNAL QIcon_addFile2 *>
PROCEDURE QIcon_addFile2 (self: QIcon; fileName, size: ADDRESS; );

<* EXTERNAL QIcon_addFile3 *>
PROCEDURE QIcon_addFile3 (self: QIcon; fileName: ADDRESS; );

<* EXTERNAL FromTheme *>
PROCEDURE FromTheme (name, fallback: ADDRESS; ): ADDRESS;

<* EXTERNAL FromTheme1 *>
PROCEDURE FromTheme1 (name: ADDRESS; ): ADDRESS;

<* EXTERNAL HasThemeIcon *>
PROCEDURE HasThemeIcon (name: ADDRESS; ): BOOLEAN;

<* EXTERNAL ThemeSearchPaths *>
PROCEDURE ThemeSearchPaths (): ADDRESS;

<* EXTERNAL SetThemeSearchPaths *>
PROCEDURE SetThemeSearchPaths (searchpath: ADDRESS; );

<* EXTERNAL ThemeName *>
PROCEDURE ThemeName (): ADDRESS;

<* EXTERNAL SetThemeName *>
PROCEDURE SetThemeName (path: ADDRESS; );

TYPE QIcon <: ADDRESS;

END QtIconRaw.
