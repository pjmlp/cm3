(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtStackedLayout;

FROM QtLayoutItem IMPORT QLayoutItem;
FROM QtSize IMPORT QSize;
FROM QtLayout IMPORT QLayout;
FROM QtWidget IMPORT QWidget;
FROM QtRect IMPORT QRect;


TYPE T = QStackedLayout;


TYPE                             (* Enum StackingMode *)
  StackingMode = {StackOne, StackAll};

TYPE
  QStackedLayout <: QStackedLayoutPublic;
  QStackedLayoutPublic =
    QLayout BRANDED OBJECT
    METHODS
      init_0           (): QStackedLayout;
      init_1           (parent: QWidget; ): QStackedLayout;
      init_2           (parentLayout: QLayout; ): QStackedLayout;
      addWidget        (w: QWidget; ): INTEGER;
      insertWidget     (index: INTEGER; w: QWidget; ): INTEGER;
      currentWidget    (): QWidget;
      currentIndex     (): INTEGER;
      widget0_0        (): QWidget; (* virtual *)
      widget1          (arg1: INTEGER; ): QWidget;
      count            (): INTEGER; (* virtual *)
      stackingMode     (): StackingMode;
      setStackingMode  (stackingMode: StackingMode; );
      addItem          (item: QLayoutItem; ); (* virtual *)
      sizeHint         (): QSize; (* virtual *)
      minimumSize      (): QSize; (* virtual *)
      itemAt           (arg1: INTEGER; ): QLayoutItem; (* virtual *)
      takeAt           (arg1: INTEGER; ): QLayoutItem; (* virtual *)
      setGeometry      (rect: QRect; ); (* virtual *)
      setCurrentIndex  (index: INTEGER; );
      setCurrentWidget (w: QWidget; );
      destroyCxx       ();
    END;


END QtStackedLayout.
