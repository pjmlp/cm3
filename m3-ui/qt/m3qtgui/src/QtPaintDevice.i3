(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtPaintDevice;




TYPE T = QPaintDevice;


TYPE
  QPaintDevice <: QPaintDevicePublic;
  QPaintDevicePublic = BRANDED OBJECT
                         cxxObj: ADDRESS;
                       METHODS
                         devType        (): INTEGER; (* virtual *)
                         paintingActive (): BOOLEAN;
                         width          (): INTEGER;
                         height         (): INTEGER;
                         widthMM        (): INTEGER;
                         heightMM       (): INTEGER;
                         logicalDpiX    (): INTEGER;
                         logicalDpiY    (): INTEGER;
                         physicalDpiX   (): INTEGER;
                         physicalDpiY   (): INTEGER;
                         colorCount     (): INTEGER;
                         depth          (): INTEGER;
                         destroyCxx     ();
                       END;


END QtPaintDevice.
