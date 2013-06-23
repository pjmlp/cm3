(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

UNSAFE MODULE QtGridLayout;


FROM QtSize IMPORT QSize;
FROM QtLayoutItem IMPORT QLayoutItem;
FROM QtLayout IMPORT QLayout;
IMPORT QtGridLayoutRaw;
FROM QtWidget IMPORT QWidget;
FROM QtRect IMPORT QRect;
FROM QtNamespace IMPORT Corner, Orientation, AlignmentFlag, Orientations;


IMPORT WeakRef;
IMPORT Ctypes AS C;

PROCEDURE New_QGridLayout0 (self: QGridLayout; parent: QWidget; ):
  QGridLayout =
  VAR
    result : ADDRESS;
    arg1tmp          := LOOPHOLE(parent.cxxObj, ADDRESS);
  BEGIN
    result := QtGridLayoutRaw.New_QGridLayout0(arg1tmp);

    self.cxxObj := result;
    EVAL WeakRef.FromRef(self, Cleanup_QGridLayout);

    RETURN self;
  END New_QGridLayout0;

PROCEDURE New_QGridLayout1 (self: QGridLayout; ): QGridLayout =
  VAR result: ADDRESS;
  BEGIN
    result := QtGridLayoutRaw.New_QGridLayout1();

    self.cxxObj := result;
    EVAL WeakRef.FromRef(self, Cleanup_QGridLayout);

    RETURN self;
  END New_QGridLayout1;

PROCEDURE Delete_QGridLayout (self: QGridLayout; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.Delete_QGridLayout(selfAdr);
  END Delete_QGridLayout;

PROCEDURE QGridLayout_sizeHint (self: QGridLayout; ): QSize =
  VAR
    ret    : ADDRESS;
    result : QSize;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_sizeHint(selfAdr);

    result := NEW(QSize);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_sizeHint;

PROCEDURE QGridLayout_minimumSize (self: QGridLayout; ): QSize =
  VAR
    ret    : ADDRESS;
    result : QSize;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_minimumSize(selfAdr);

    result := NEW(QSize);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_minimumSize;

PROCEDURE QGridLayout_maximumSize (self: QGridLayout; ): QSize =
  VAR
    ret    : ADDRESS;
    result : QSize;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_maximumSize(selfAdr);

    result := NEW(QSize);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_maximumSize;

PROCEDURE QGridLayout_setHorizontalSpacing
  (self: QGridLayout; spacing: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setHorizontalSpacing(selfAdr, spacing);
  END QGridLayout_setHorizontalSpacing;

PROCEDURE QGridLayout_horizontalSpacing (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_horizontalSpacing(selfAdr);
  END QGridLayout_horizontalSpacing;

PROCEDURE QGridLayout_setVerticalSpacing
  (self: QGridLayout; spacing: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setVerticalSpacing(selfAdr, spacing);
  END QGridLayout_setVerticalSpacing;

PROCEDURE QGridLayout_verticalSpacing (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_verticalSpacing(selfAdr);
  END QGridLayout_verticalSpacing;

PROCEDURE QGridLayout_setSpacing (self: QGridLayout; spacing: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setSpacing(selfAdr, spacing);
  END QGridLayout_setSpacing;

PROCEDURE QGridLayout_spacing (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_spacing(selfAdr);
  END QGridLayout_spacing;

PROCEDURE QGridLayout_setRowStretch
  (self: QGridLayout; row, stretch: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setRowStretch(selfAdr, row, stretch);
  END QGridLayout_setRowStretch;

PROCEDURE QGridLayout_setColumnStretch
  (self: QGridLayout; column, stretch: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setColumnStretch(selfAdr, column, stretch);
  END QGridLayout_setColumnStretch;

PROCEDURE QGridLayout_rowStretch (self: QGridLayout; row: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_rowStretch(selfAdr, row);
  END QGridLayout_rowStretch;

PROCEDURE QGridLayout_columnStretch (self: QGridLayout; column: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_columnStretch(selfAdr, column);
  END QGridLayout_columnStretch;

PROCEDURE QGridLayout_setRowMinimumHeight
  (self: QGridLayout; row, minSize: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setRowMinimumHeight(selfAdr, row, minSize);
  END QGridLayout_setRowMinimumHeight;

PROCEDURE QGridLayout_setColumnMinimumWidth
  (self: QGridLayout; column, minSize: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setColumnMinimumWidth(
      selfAdr, column, minSize);
  END QGridLayout_setColumnMinimumWidth;

PROCEDURE QGridLayout_rowMinimumHeight (self: QGridLayout; row: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_rowMinimumHeight(selfAdr, row);
  END QGridLayout_rowMinimumHeight;

PROCEDURE QGridLayout_columnMinimumWidth
  (self: QGridLayout; column: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_columnMinimumWidth(selfAdr, column);
  END QGridLayout_columnMinimumWidth;

PROCEDURE QGridLayout_columnCount (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_columnCount(selfAdr);
  END QGridLayout_columnCount;

PROCEDURE QGridLayout_rowCount (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_rowCount(selfAdr);
  END QGridLayout_rowCount;

PROCEDURE QGridLayout_cellRect (self: QGridLayout; row, column: INTEGER; ):
  QRect =
  VAR
    ret    : ADDRESS;
    result : QRect;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_cellRect(selfAdr, row, column);

    result := NEW(QRect);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_cellRect;

PROCEDURE QGridLayout_hasHeightForWidth (self: QGridLayout; ): BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_hasHeightForWidth(selfAdr);
  END QGridLayout_hasHeightForWidth;

PROCEDURE QGridLayout_heightForWidth (self: QGridLayout; arg2: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_heightForWidth(selfAdr, arg2);
  END QGridLayout_heightForWidth;

PROCEDURE QGridLayout_minimumHeightForWidth
  (self: QGridLayout; arg2: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN
      QtGridLayoutRaw.QGridLayout_minimumHeightForWidth(selfAdr, arg2);
  END QGridLayout_minimumHeightForWidth;

PROCEDURE QGridLayout_expandingDirections (self: QGridLayout; ):
  Orientations =
  VAR
    ret    : INTEGER;
    result : Orientations;
    selfAdr: ADDRESS      := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_expandingDirections(selfAdr);
    result := VAL(ret, Orientations);
    RETURN result;
  END QGridLayout_expandingDirections;

PROCEDURE QGridLayout_invalidate (self: QGridLayout; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_invalidate(selfAdr);
  END QGridLayout_invalidate;

PROCEDURE QGridLayout_addWidget (self: QGridLayout; w: QWidget; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(w.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addWidget(selfAdr, arg2tmp);
  END QGridLayout_addWidget;

PROCEDURE QGridLayout_addWidget1 (self       : QGridLayout;
                                  arg2       : QWidget;
                                  row, column: INTEGER;
                                  arg5       : AlignmentFlag; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addWidget1(
      selfAdr, arg2tmp, row, column, ORD(arg5));
  END QGridLayout_addWidget1;

PROCEDURE QGridLayout_addWidget2
  (self: QGridLayout; arg2: QWidget; row, column: INTEGER; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addWidget2(selfAdr, arg2tmp, row, column);
  END QGridLayout_addWidget2;

PROCEDURE QGridLayout_addWidget3
  (self                            : QGridLayout;
   arg2                            : QWidget;
   row, column, rowSpan, columnSpan: INTEGER;
   arg7                            : AlignmentFlag; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addWidget3(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan, ORD(arg7));
  END QGridLayout_addWidget3;

PROCEDURE QGridLayout_addWidget4
  (self                            : QGridLayout;
   arg2                            : QWidget;
   row, column, rowSpan, columnSpan: INTEGER;     ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addWidget4(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan);
  END QGridLayout_addWidget4;

PROCEDURE QGridLayout_addLayout (self       : QGridLayout;
                                 arg2       : QLayout;
                                 row, column: INTEGER;
                                 arg5       : AlignmentFlag; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addLayout(
      selfAdr, arg2tmp, row, column, ORD(arg5));
  END QGridLayout_addLayout;

PROCEDURE QGridLayout_addLayout1
  (self: QGridLayout; arg2: QLayout; row, column: INTEGER; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addLayout1(selfAdr, arg2tmp, row, column);
  END QGridLayout_addLayout1;

PROCEDURE QGridLayout_addLayout2
  (self                            : QGridLayout;
   arg2                            : QLayout;
   row, column, rowSpan, columnSpan: INTEGER;
   arg7                            : AlignmentFlag; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addLayout2(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan, ORD(arg7));
  END QGridLayout_addLayout2;

PROCEDURE QGridLayout_addLayout3
  (self                            : QGridLayout;
   arg2                            : QLayout;
   row, column, rowSpan, columnSpan: INTEGER;     ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addLayout3(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan);
  END QGridLayout_addLayout3;

PROCEDURE QGridLayout_setOriginCorner (self: QGridLayout; arg2: Corner; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setOriginCorner(selfAdr, ORD(arg2));
  END QGridLayout_setOriginCorner;

PROCEDURE QGridLayout_originCorner (self: QGridLayout; ): Corner =
  VAR
    ret    : INTEGER;
    result : Corner;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_originCorner(selfAdr);
    result := VAL(ret, Corner);
    RETURN result;
  END QGridLayout_originCorner;

PROCEDURE QGridLayout_itemAt (self: QGridLayout; index: INTEGER; ):
  QLayoutItem =
  VAR
    ret    : ADDRESS;
    result : QLayoutItem;
    selfAdr: ADDRESS     := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_itemAt(selfAdr, index);

    result := NEW(QLayoutItem);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_itemAt;

PROCEDURE QGridLayout_itemAtPosition
  (self: QGridLayout; row, column: INTEGER; ): QLayoutItem =
  VAR
    ret    : ADDRESS;
    result : QLayoutItem;
    selfAdr: ADDRESS     := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret :=
      QtGridLayoutRaw.QGridLayout_itemAtPosition(selfAdr, row, column);

    result := NEW(QLayoutItem);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_itemAtPosition;

PROCEDURE QGridLayout_takeAt (self: QGridLayout; index: INTEGER; ):
  QLayoutItem =
  VAR
    ret    : ADDRESS;
    result : QLayoutItem;
    selfAdr: ADDRESS     := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtGridLayoutRaw.QGridLayout_takeAt(selfAdr, index);

    result := NEW(QLayoutItem);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QGridLayout_takeAt;

PROCEDURE QGridLayout_count (self: QGridLayout; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtGridLayoutRaw.QGridLayout_count(selfAdr);
  END QGridLayout_count;

PROCEDURE QGridLayout_setGeometry (self: QGridLayout; arg2: QRect; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(arg2.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setGeometry(selfAdr, arg2tmp);
  END QGridLayout_setGeometry;

PROCEDURE QGridLayout_addItem (self: QGridLayout;
                               item: QLayoutItem;
                               row, column, rowSpan, columnSpan: INTEGER;
                               arg7: AlignmentFlag; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(item.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addItem(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan, ORD(arg7));
  END QGridLayout_addItem;

PROCEDURE QGridLayout_addItem1
  (self                            : QGridLayout;
   item                            : QLayoutItem;
   row, column, rowSpan, columnSpan: INTEGER;     ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(item.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addItem1(
      selfAdr, arg2tmp, row, column, rowSpan, columnSpan);
  END QGridLayout_addItem1;

PROCEDURE QGridLayout_addItem2
  (self: QGridLayout; item: QLayoutItem; row, column, rowSpan: INTEGER; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(item.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addItem2(
      selfAdr, arg2tmp, row, column, rowSpan);
  END QGridLayout_addItem2;

PROCEDURE QGridLayout_addItem3
  (self: QGridLayout; item: QLayoutItem; row, column: INTEGER; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(item.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_addItem3(selfAdr, arg2tmp, row, column);
  END QGridLayout_addItem3;

PROCEDURE QGridLayout_setDefaultPositioning
  (self: QGridLayout; n: INTEGER; orient: Orientation; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtGridLayoutRaw.QGridLayout_setDefaultPositioning(
      selfAdr, n, ORD(orient));
  END QGridLayout_setDefaultPositioning;

PROCEDURE QGridLayout_getItemPosition
  (    self                            : QGridLayout;
       idx                             : INTEGER;
   VAR row, column, rowSpan, columnSpan: INTEGER;     ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg3tmp: C.int;
    arg4tmp: C.int;
    arg5tmp: C.int;
    arg6tmp: C.int;
  BEGIN
    arg3tmp := row;
    arg4tmp := column;
    arg5tmp := rowSpan;
    arg6tmp := columnSpan;
    QtGridLayoutRaw.QGridLayout_getItemPosition(
      selfAdr, idx, arg3tmp, arg4tmp, arg5tmp, arg6tmp);
    row := arg3tmp;
    column := arg4tmp;
    rowSpan := arg5tmp;
    columnSpan := arg6tmp;
  END QGridLayout_getItemPosition;

PROCEDURE Cleanup_QGridLayout
  (<* UNUSED *> READONLY self: WeakRef.T; ref: REFANY) =
  VAR obj: QGridLayout := ref;
  BEGIN
    Delete_QGridLayout(obj);
  END Cleanup_QGridLayout;

PROCEDURE Destroy_QGridLayout (self: QGridLayout) =
  BEGIN
    EVAL WeakRef.FromRef(self, Cleanup_QGridLayout);
  END Destroy_QGridLayout;

REVEAL
  QGridLayout =
    QGridLayoutPublic BRANDED OBJECT
    OVERRIDES
      init_0                := New_QGridLayout0;
      init_1                := New_QGridLayout1;
      sizeHint              := QGridLayout_sizeHint;
      minimumSize           := QGridLayout_minimumSize;
      maximumSize           := QGridLayout_maximumSize;
      setHorizontalSpacing  := QGridLayout_setHorizontalSpacing;
      horizontalSpacing     := QGridLayout_horizontalSpacing;
      setVerticalSpacing    := QGridLayout_setVerticalSpacing;
      verticalSpacing       := QGridLayout_verticalSpacing;
      setSpacing            := QGridLayout_setSpacing;
      spacing               := QGridLayout_spacing;
      setRowStretch         := QGridLayout_setRowStretch;
      setColumnStretch      := QGridLayout_setColumnStretch;
      rowStretch            := QGridLayout_rowStretch;
      columnStretch         := QGridLayout_columnStretch;
      setRowMinimumHeight   := QGridLayout_setRowMinimumHeight;
      setColumnMinimumWidth := QGridLayout_setColumnMinimumWidth;
      rowMinimumHeight      := QGridLayout_rowMinimumHeight;
      columnMinimumWidth    := QGridLayout_columnMinimumWidth;
      columnCount           := QGridLayout_columnCount;
      rowCount              := QGridLayout_rowCount;
      cellRect              := QGridLayout_cellRect;
      hasHeightForWidth     := QGridLayout_hasHeightForWidth;
      heightForWidth        := QGridLayout_heightForWidth;
      minimumHeightForWidth := QGridLayout_minimumHeightForWidth;
      expandingDirections   := QGridLayout_expandingDirections;
      invalidate            := QGridLayout_invalidate;
      addWidget             := QGridLayout_addWidget;
      addWidget1            := QGridLayout_addWidget1;
      addWidget2            := QGridLayout_addWidget2;
      addWidget3            := QGridLayout_addWidget3;
      addWidget4            := QGridLayout_addWidget4;
      addLayout             := QGridLayout_addLayout;
      addLayout1            := QGridLayout_addLayout1;
      addLayout2            := QGridLayout_addLayout2;
      addLayout3            := QGridLayout_addLayout3;
      setOriginCorner       := QGridLayout_setOriginCorner;
      originCorner          := QGridLayout_originCorner;
      itemAt                := QGridLayout_itemAt;
      itemAtPosition        := QGridLayout_itemAtPosition;
      takeAt                := QGridLayout_takeAt;
      count                 := QGridLayout_count;
      setGeometry           := QGridLayout_setGeometry;
      addItem               := QGridLayout_addItem;
      addItem1              := QGridLayout_addItem1;
      addItem2              := QGridLayout_addItem2;
      addItem3              := QGridLayout_addItem3;
      setDefaultPositioning := QGridLayout_setDefaultPositioning;
      getItemPosition       := QGridLayout_getItemPosition;
      destroyCxx            := Destroy_QGridLayout;
    END;


BEGIN
END QtGridLayout.
