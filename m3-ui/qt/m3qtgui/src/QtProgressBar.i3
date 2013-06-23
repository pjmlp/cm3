(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtProgressBar;

FROM QtSize IMPORT QSize;
FROM QtWidget IMPORT QWidget;
FROM QtNamespace IMPORT Orientation, AlignmentFlag;


TYPE T = QProgressBar;


TYPE                             (* Enum Direction *)
  Direction = {TopToBottom, BottomToTop};

TYPE
  QProgressBar <: QProgressBarPublic;
  QProgressBarPublic = QWidget BRANDED OBJECT
                       METHODS
                         init_0          (parent: QWidget; ): QProgressBar;
                         init_1          (): QProgressBar;
                         minimum         (): INTEGER;
                         maximum         (): INTEGER;
                         value           (): INTEGER;
                         text            (): TEXT; (* virtual *)
                         setTextVisible  (visible: BOOLEAN; );
                         isTextVisible   (): BOOLEAN;
                         alignment       (): AlignmentFlag;
                         setAlignment    (alignment: AlignmentFlag; );
                         sizeHint        (): QSize; (* virtual *)
                         minimumSizeHint (): QSize; (* virtual *)
                         orientation     (): Orientation;
                         setInvertedAppearance (invert: BOOLEAN; );
                         invertedAppearance    (): BOOLEAN;
                         setTextDirection (textDirection: Direction; );
                         textDirection    (): Direction;
                         setFormat        (format: TEXT; );
                         format           (): TEXT;
                         reset            ();
                         setRange         (minimum, maximum: INTEGER; );
                         setMinimum       (minimum: INTEGER; );
                         setMaximum       (maximum: INTEGER; );
                         setValue         (value: INTEGER; );
                         setOrientation   (arg1: Orientation; );
                         destroyCxx       ();
                       END;


END QtProgressBar.
