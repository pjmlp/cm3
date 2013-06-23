(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtPoint;



TYPE T = QPoint;


TYPE
  QPoint <: QPointPublic;
  QPointPublic = BRANDED OBJECT
                   cxxObj: ADDRESS;
                 METHODS
                   init_0          (): QPoint;
                   init_1          (xpos, ypos: INTEGER; ): QPoint;
                   isNull          (): BOOLEAN;
                   x               (): INTEGER;
                   y               (): INTEGER;
                   setX            (x: INTEGER; );
                   setY            (y: INTEGER; );
                   manhattanLength (): INTEGER;
                   rx              (): UNTRACED REF INTEGER;
                   ry              (): UNTRACED REF INTEGER;
                   PlusEqual       (p: QPoint; ): QPoint;
                   MinusEqual      (p: QPoint; ): QPoint;
                   MultiplyEqual   (c: LONGREAL; ): QPoint;
                   DivideEqual     (c: LONGREAL; ): QPoint;
                   destroyCxx      ();
                 END;

  QPointF <: QPointFPublic;
  QPointFPublic = BRANDED OBJECT
                    cxxObj: ADDRESS;
                  METHODS
                    init_0          (): QPointF;
                    init_1          (p: QPoint; ): QPointF;
                    init_2          (xpos, ypos: LONGREAL; ): QPointF;
                    manhattanLength (): LONGREAL;
                    isNull          (): BOOLEAN;
                    x               (): LONGREAL;
                    y               (): LONGREAL;
                    setX            (x: LONGREAL; );
                    setY            (y: LONGREAL; );
                    rx              (): UNTRACED REF LONGREAL;
                    ry              (): UNTRACED REF LONGREAL;
                    PlusEqual       (p: QPointF; ): QPointF;
                    MinusEqual      (p: QPointF; ): QPointF;
                    MultiplyEqual   (c: LONGREAL; ): QPointF;
                    DivideEqual     (c: LONGREAL; ): QPointF;
                    toPoint         (): QPoint;
                    destroyCxx      ();
                  END;


END QtPoint.
