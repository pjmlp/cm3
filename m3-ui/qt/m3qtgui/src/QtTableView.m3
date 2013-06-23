(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

UNSAFE MODULE QtTableView;


IMPORT QtTableViewRaw;
FROM QtAbstractItemModel IMPORT QAbstractItemModel, QModelIndex;
FROM QtWidget IMPORT QWidget;
FROM QtItemSelectionModel IMPORT QItemSelectionModel;
FROM QtHeaderView IMPORT QHeaderView;
FROM QtNamespace IMPORT PenStyle, SortOrder;
FROM QtRect IMPORT QRect;
FROM QtAbstractItemView IMPORT ScrollHint;


IMPORT WeakRef;

PROCEDURE New_QTableView0 (self: QTableView; parent: QWidget; ):
  QTableView =
  VAR
    result : ADDRESS;
    arg1tmp          := LOOPHOLE(parent.cxxObj, ADDRESS);
  BEGIN
    result := QtTableViewRaw.New_QTableView0(arg1tmp);

    self.cxxObj := result;
    EVAL WeakRef.FromRef(self, Cleanup_QTableView);

    RETURN self;
  END New_QTableView0;

PROCEDURE New_QTableView1 (self: QTableView; ): QTableView =
  VAR result: ADDRESS;
  BEGIN
    result := QtTableViewRaw.New_QTableView1();

    self.cxxObj := result;
    EVAL WeakRef.FromRef(self, Cleanup_QTableView);

    RETURN self;
  END New_QTableView1;

PROCEDURE Delete_QTableView (self: QTableView; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.Delete_QTableView(selfAdr);
  END Delete_QTableView;

PROCEDURE QTableView_setModel
  (self: QTableView; model: QAbstractItemModel; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(model.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setModel(selfAdr, arg2tmp);
  END QTableView_setModel;

PROCEDURE QTableView_setRootIndex
  (self: QTableView; index: QModelIndex; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(index.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setRootIndex(selfAdr, arg2tmp);
  END QTableView_setRootIndex;

PROCEDURE QTableView_setSelectionModel
  (self: QTableView; selectionModel: QItemSelectionModel; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(selectionModel.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setSelectionModel(selfAdr, arg2tmp);
  END QTableView_setSelectionModel;

PROCEDURE QTableView_horizontalHeader (self: QTableView; ): QHeaderView =
  VAR
    ret    : ADDRESS;
    result : QHeaderView;
    selfAdr: ADDRESS     := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtTableViewRaw.QTableView_horizontalHeader(selfAdr);

    result := NEW(QHeaderView);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QTableView_horizontalHeader;

PROCEDURE QTableView_verticalHeader (self: QTableView; ): QHeaderView =
  VAR
    ret    : ADDRESS;
    result : QHeaderView;
    selfAdr: ADDRESS     := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtTableViewRaw.QTableView_verticalHeader(selfAdr);

    result := NEW(QHeaderView);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QTableView_verticalHeader;

PROCEDURE QTableView_setHorizontalHeader
  (self: QTableView; header: QHeaderView; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(header.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setHorizontalHeader(selfAdr, arg2tmp);
  END QTableView_setHorizontalHeader;

PROCEDURE QTableView_setVerticalHeader
  (self: QTableView; header: QHeaderView; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(header.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setVerticalHeader(selfAdr, arg2tmp);
  END QTableView_setVerticalHeader;

PROCEDURE QTableView_rowViewportPosition
  (self: QTableView; row: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_rowViewportPosition(selfAdr, row);
  END QTableView_rowViewportPosition;

PROCEDURE QTableView_rowAt (self: QTableView; y: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_rowAt(selfAdr, y);
  END QTableView_rowAt;

PROCEDURE QTableView_setRowHeight
  (self: QTableView; row, height: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setRowHeight(selfAdr, row, height);
  END QTableView_setRowHeight;

PROCEDURE QTableView_rowHeight (self: QTableView; row: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_rowHeight(selfAdr, row);
  END QTableView_rowHeight;

PROCEDURE QTableView_columnViewportPosition
  (self: QTableView; column: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN
      QtTableViewRaw.QTableView_columnViewportPosition(selfAdr, column);
  END QTableView_columnViewportPosition;

PROCEDURE QTableView_columnAt (self: QTableView; x: INTEGER; ): INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_columnAt(selfAdr, x);
  END QTableView_columnAt;

PROCEDURE QTableView_setColumnWidth
  (self: QTableView; column, width: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setColumnWidth(selfAdr, column, width);
  END QTableView_setColumnWidth;

PROCEDURE QTableView_columnWidth (self: QTableView; column: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_columnWidth(selfAdr, column);
  END QTableView_columnWidth;

PROCEDURE QTableView_isRowHidden (self: QTableView; row: INTEGER; ):
  BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_isRowHidden(selfAdr, row);
  END QTableView_isRowHidden;

PROCEDURE QTableView_setRowHidden
  (self: QTableView; row: INTEGER; hide: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setRowHidden(selfAdr, row, hide);
  END QTableView_setRowHidden;

PROCEDURE QTableView_isColumnHidden (self: QTableView; column: INTEGER; ):
  BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_isColumnHidden(selfAdr, column);
  END QTableView_isColumnHidden;

PROCEDURE QTableView_setColumnHidden
  (self: QTableView; column: INTEGER; hide: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setColumnHidden(selfAdr, column, hide);
  END QTableView_setColumnHidden;

PROCEDURE QTableView_setSortingEnabled
  (self: QTableView; enable: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setSortingEnabled(selfAdr, enable);
  END QTableView_setSortingEnabled;

PROCEDURE QTableView_isSortingEnabled (self: QTableView; ): BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_isSortingEnabled(selfAdr);
  END QTableView_isSortingEnabled;

PROCEDURE QTableView_showGrid (self: QTableView; ): BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_showGrid(selfAdr);
  END QTableView_showGrid;

PROCEDURE QTableView_gridStyle (self: QTableView; ): PenStyle =
  VAR
    ret    : INTEGER;
    result : PenStyle;
    selfAdr: ADDRESS  := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    ret := QtTableViewRaw.QTableView_gridStyle(selfAdr);
    result := VAL(ret, PenStyle);
    RETURN result;
  END QTableView_gridStyle;

PROCEDURE QTableView_setGridStyle (self: QTableView; style: PenStyle; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setGridStyle(selfAdr, ORD(style));
  END QTableView_setGridStyle;

PROCEDURE QTableView_setWordWrap (self: QTableView; on: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setWordWrap(selfAdr, on);
  END QTableView_setWordWrap;

PROCEDURE QTableView_wordWrap (self: QTableView; ): BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_wordWrap(selfAdr);
  END QTableView_wordWrap;

PROCEDURE QTableView_setCornerButtonEnabled
  (self: QTableView; enable: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setCornerButtonEnabled(selfAdr, enable);
  END QTableView_setCornerButtonEnabled;

PROCEDURE QTableView_isCornerButtonEnabled (self: QTableView; ): BOOLEAN =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_isCornerButtonEnabled(selfAdr);
  END QTableView_isCornerButtonEnabled;

PROCEDURE QTableView_visualRect (self: QTableView; index: QModelIndex; ):
  QRect =
  VAR
    ret    : ADDRESS;
    result : QRect;
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(index.cxxObj, ADDRESS);
  BEGIN
    ret := QtTableViewRaw.QTableView_visualRect(selfAdr, arg2tmp);

    result := NEW(QRect);
    result.cxxObj := ret;
    result.destroyCxx();

    RETURN result;
  END QTableView_visualRect;

PROCEDURE QTableView_scrollTo
  (self: QTableView; index: QModelIndex; hint: ScrollHint; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(index.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_scrollTo(selfAdr, arg2tmp, ORD(hint));
  END QTableView_scrollTo;

PROCEDURE QTableView_scrollTo1 (self: QTableView; index: QModelIndex; ) =
  VAR
    selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
    arg2tmp          := LOOPHOLE(index.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_scrollTo1(selfAdr, arg2tmp);
  END QTableView_scrollTo1;

PROCEDURE QTableView_setSpan
  (self: QTableView; row, column, rowSpan, columnSpan: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setSpan(
      selfAdr, row, column, rowSpan, columnSpan);
  END QTableView_setSpan;

PROCEDURE QTableView_rowSpan (self: QTableView; row, column: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_rowSpan(selfAdr, row, column);
  END QTableView_rowSpan;

PROCEDURE QTableView_columnSpan (self: QTableView; row, column: INTEGER; ):
  INTEGER =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    RETURN QtTableViewRaw.QTableView_columnSpan(selfAdr, row, column);
  END QTableView_columnSpan;

PROCEDURE QTableView_clearSpans (self: QTableView; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_clearSpans(selfAdr);
  END QTableView_clearSpans;

PROCEDURE QTableView_sortByColumn
  (self: QTableView; column: INTEGER; order: SortOrder; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_sortByColumn(selfAdr, column, ORD(order));
  END QTableView_sortByColumn;

PROCEDURE QTableView_selectRow (self: QTableView; row: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_selectRow(selfAdr, row);
  END QTableView_selectRow;

PROCEDURE QTableView_selectColumn (self: QTableView; column: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_selectColumn(selfAdr, column);
  END QTableView_selectColumn;

PROCEDURE QTableView_hideRow (self: QTableView; row: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_hideRow(selfAdr, row);
  END QTableView_hideRow;

PROCEDURE QTableView_hideColumn (self: QTableView; column: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_hideColumn(selfAdr, column);
  END QTableView_hideColumn;

PROCEDURE QTableView_showRow (self: QTableView; row: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_showRow(selfAdr, row);
  END QTableView_showRow;

PROCEDURE QTableView_showColumn (self: QTableView; column: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_showColumn(selfAdr, column);
  END QTableView_showColumn;

PROCEDURE QTableView_resizeRowToContents
  (self: QTableView; row: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_resizeRowToContents(selfAdr, row);
  END QTableView_resizeRowToContents;

PROCEDURE QTableView_resizeRowsToContents (self: QTableView; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_resizeRowsToContents(selfAdr);
  END QTableView_resizeRowsToContents;

PROCEDURE QTableView_resizeColumnToContents
  (self: QTableView; column: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_resizeColumnToContents(selfAdr, column);
  END QTableView_resizeColumnToContents;

PROCEDURE QTableView_resizeColumnsToContents (self: QTableView; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_resizeColumnsToContents(selfAdr);
  END QTableView_resizeColumnsToContents;

PROCEDURE QTableView_sortByColumn1 (self: QTableView; column: INTEGER; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_sortByColumn1(selfAdr, column);
  END QTableView_sortByColumn1;

PROCEDURE QTableView_setShowGrid (self: QTableView; show: BOOLEAN; ) =
  VAR selfAdr: ADDRESS := LOOPHOLE(self.cxxObj, ADDRESS);
  BEGIN
    QtTableViewRaw.QTableView_setShowGrid(selfAdr, show);
  END QTableView_setShowGrid;

PROCEDURE Cleanup_QTableView
  (<* UNUSED *> READONLY self: WeakRef.T; ref: REFANY) =
  VAR obj: QTableView := ref;
  BEGIN
    Delete_QTableView(obj);
  END Cleanup_QTableView;

PROCEDURE Destroy_QTableView (self: QTableView) =
  BEGIN
    EVAL WeakRef.FromRef(self, Cleanup_QTableView);
  END Destroy_QTableView;

REVEAL
  QTableView =
    QTableViewPublic BRANDED OBJECT
    OVERRIDES
      init_0                  := New_QTableView0;
      init_1                  := New_QTableView1;
      setModel                := QTableView_setModel;
      setRootIndex            := QTableView_setRootIndex;
      setSelectionModel       := QTableView_setSelectionModel;
      horizontalHeader        := QTableView_horizontalHeader;
      verticalHeader          := QTableView_verticalHeader;
      setHorizontalHeader     := QTableView_setHorizontalHeader;
      setVerticalHeader       := QTableView_setVerticalHeader;
      rowViewportPosition     := QTableView_rowViewportPosition;
      rowAt                   := QTableView_rowAt;
      setRowHeight            := QTableView_setRowHeight;
      rowHeight               := QTableView_rowHeight;
      columnViewportPosition  := QTableView_columnViewportPosition;
      columnAt                := QTableView_columnAt;
      setColumnWidth          := QTableView_setColumnWidth;
      columnWidth             := QTableView_columnWidth;
      isRowHidden             := QTableView_isRowHidden;
      setRowHidden            := QTableView_setRowHidden;
      isColumnHidden          := QTableView_isColumnHidden;
      setColumnHidden         := QTableView_setColumnHidden;
      setSortingEnabled       := QTableView_setSortingEnabled;
      isSortingEnabled        := QTableView_isSortingEnabled;
      showGrid                := QTableView_showGrid;
      gridStyle               := QTableView_gridStyle;
      setGridStyle            := QTableView_setGridStyle;
      setWordWrap             := QTableView_setWordWrap;
      wordWrap                := QTableView_wordWrap;
      setCornerButtonEnabled  := QTableView_setCornerButtonEnabled;
      isCornerButtonEnabled   := QTableView_isCornerButtonEnabled;
      visualRect              := QTableView_visualRect;
      scrollTo                := QTableView_scrollTo;
      scrollTo1               := QTableView_scrollTo1;
      setSpan                 := QTableView_setSpan;
      rowSpan                 := QTableView_rowSpan;
      columnSpan              := QTableView_columnSpan;
      clearSpans              := QTableView_clearSpans;
      sortByColumn            := QTableView_sortByColumn;
      selectRow               := QTableView_selectRow;
      selectColumn            := QTableView_selectColumn;
      hideRow                 := QTableView_hideRow;
      hideColumn              := QTableView_hideColumn;
      showRow                 := QTableView_showRow;
      showColumn              := QTableView_showColumn;
      resizeRowToContents     := QTableView_resizeRowToContents;
      resizeRowsToContents    := QTableView_resizeRowsToContents;
      resizeColumnToContents  := QTableView_resizeColumnToContents;
      resizeColumnsToContents := QTableView_resizeColumnsToContents;
      sortByColumn1           := QTableView_sortByColumn1;
      setShowGrid             := QTableView_setShowGrid;
      destroyCxx              := Destroy_QTableView;
    END;


BEGIN
END QtTableView.
