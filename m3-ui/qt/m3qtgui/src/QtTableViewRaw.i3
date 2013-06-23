(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtTableViewRaw;


IMPORT Ctypes AS C;




<* EXTERNAL New_QTableView0 *>
PROCEDURE New_QTableView0 (parent: ADDRESS; ): QTableView;

<* EXTERNAL New_QTableView1 *>
PROCEDURE New_QTableView1 (): QTableView;

<* EXTERNAL Delete_QTableView *>
PROCEDURE Delete_QTableView (self: QTableView; );

<* EXTERNAL QTableView_setModel *>
PROCEDURE QTableView_setModel (self: QTableView; model: ADDRESS; );

<* EXTERNAL QTableView_setRootIndex *>
PROCEDURE QTableView_setRootIndex (self: QTableView; index: ADDRESS; );

<* EXTERNAL QTableView_setSelectionModel *>
PROCEDURE QTableView_setSelectionModel
  (self: QTableView; selectionModel: ADDRESS; );

<* EXTERNAL QTableView_horizontalHeader *>
PROCEDURE QTableView_horizontalHeader (self: QTableView; ): ADDRESS;

<* EXTERNAL QTableView_verticalHeader *>
PROCEDURE QTableView_verticalHeader (self: QTableView; ): ADDRESS;

<* EXTERNAL QTableView_setHorizontalHeader *>
PROCEDURE QTableView_setHorizontalHeader
  (self: QTableView; header: ADDRESS; );

<* EXTERNAL QTableView_setVerticalHeader *>
PROCEDURE QTableView_setVerticalHeader
  (self: QTableView; header: ADDRESS; );

<* EXTERNAL QTableView_rowViewportPosition *>
PROCEDURE QTableView_rowViewportPosition (self: QTableView; row: C.int; ):
  C.int;

<* EXTERNAL QTableView_rowAt *>
PROCEDURE QTableView_rowAt (self: QTableView; y: C.int; ): C.int;

<* EXTERNAL QTableView_setRowHeight *>
PROCEDURE QTableView_setRowHeight (self: QTableView; row, height: C.int; );

<* EXTERNAL QTableView_rowHeight *>
PROCEDURE QTableView_rowHeight (self: QTableView; row: C.int; ): C.int;

<* EXTERNAL QTableView_columnViewportPosition *>
PROCEDURE QTableView_columnViewportPosition
  (self: QTableView; column: C.int; ): C.int;

<* EXTERNAL QTableView_columnAt *>
PROCEDURE QTableView_columnAt (self: QTableView; x: C.int; ): C.int;

<* EXTERNAL QTableView_setColumnWidth *>
PROCEDURE QTableView_setColumnWidth
  (self: QTableView; column, width: C.int; );

<* EXTERNAL QTableView_columnWidth *>
PROCEDURE QTableView_columnWidth (self: QTableView; column: C.int; ):
  C.int;

<* EXTERNAL QTableView_isRowHidden *>
PROCEDURE QTableView_isRowHidden (self: QTableView; row: C.int; ): BOOLEAN;

<* EXTERNAL QTableView_setRowHidden *>
PROCEDURE QTableView_setRowHidden
  (self: QTableView; row: C.int; hide: BOOLEAN; );

<* EXTERNAL QTableView_isColumnHidden *>
PROCEDURE QTableView_isColumnHidden (self: QTableView; column: C.int; ):
  BOOLEAN;

<* EXTERNAL QTableView_setColumnHidden *>
PROCEDURE QTableView_setColumnHidden
  (self: QTableView; column: C.int; hide: BOOLEAN; );

<* EXTERNAL QTableView_setSortingEnabled *>
PROCEDURE QTableView_setSortingEnabled
  (self: QTableView; enable: BOOLEAN; );

<* EXTERNAL QTableView_isSortingEnabled *>
PROCEDURE QTableView_isSortingEnabled (self: QTableView; ): BOOLEAN;

<* EXTERNAL QTableView_showGrid *>
PROCEDURE QTableView_showGrid (self: QTableView; ): BOOLEAN;

<* EXTERNAL QTableView_gridStyle *>
PROCEDURE QTableView_gridStyle (self: QTableView; ): C.int;

<* EXTERNAL QTableView_setGridStyle *>
PROCEDURE QTableView_setGridStyle (self: QTableView; style: C.int; );

<* EXTERNAL QTableView_setWordWrap *>
PROCEDURE QTableView_setWordWrap (self: QTableView; on: BOOLEAN; );

<* EXTERNAL QTableView_wordWrap *>
PROCEDURE QTableView_wordWrap (self: QTableView; ): BOOLEAN;

<* EXTERNAL QTableView_setCornerButtonEnabled *>
PROCEDURE QTableView_setCornerButtonEnabled
  (self: QTableView; enable: BOOLEAN; );

<* EXTERNAL QTableView_isCornerButtonEnabled *>
PROCEDURE QTableView_isCornerButtonEnabled (self: QTableView; ): BOOLEAN;

<* EXTERNAL QTableView_visualRect *>
PROCEDURE QTableView_visualRect (self: QTableView; index: ADDRESS; ):
  ADDRESS;

<* EXTERNAL QTableView_scrollTo *>
PROCEDURE QTableView_scrollTo
  (self: QTableView; index: ADDRESS; hint: C.int; );

<* EXTERNAL QTableView_scrollTo1 *>
PROCEDURE QTableView_scrollTo1 (self: QTableView; index: ADDRESS; );

<* EXTERNAL QTableView_setSpan *>
PROCEDURE QTableView_setSpan
  (self: QTableView; row, column, rowSpan, columnSpan: C.int; );

<* EXTERNAL QTableView_rowSpan *>
PROCEDURE QTableView_rowSpan (self: QTableView; row, column: C.int; ):
  C.int;

<* EXTERNAL QTableView_columnSpan *>
PROCEDURE QTableView_columnSpan (self: QTableView; row, column: C.int; ):
  C.int;

<* EXTERNAL QTableView_clearSpans *>
PROCEDURE QTableView_clearSpans (self: QTableView; );

<* EXTERNAL QTableView_sortByColumn *>
PROCEDURE QTableView_sortByColumn
  (self: QTableView; column, order: C.int; );

<* EXTERNAL QTableView_selectRow *>
PROCEDURE QTableView_selectRow (self: QTableView; row: C.int; );

<* EXTERNAL QTableView_selectColumn *>
PROCEDURE QTableView_selectColumn (self: QTableView; column: C.int; );

<* EXTERNAL QTableView_hideRow *>
PROCEDURE QTableView_hideRow (self: QTableView; row: C.int; );

<* EXTERNAL QTableView_hideColumn *>
PROCEDURE QTableView_hideColumn (self: QTableView; column: C.int; );

<* EXTERNAL QTableView_showRow *>
PROCEDURE QTableView_showRow (self: QTableView; row: C.int; );

<* EXTERNAL QTableView_showColumn *>
PROCEDURE QTableView_showColumn (self: QTableView; column: C.int; );

<* EXTERNAL QTableView_resizeRowToContents *>
PROCEDURE QTableView_resizeRowToContents (self: QTableView; row: C.int; );

<* EXTERNAL QTableView_resizeRowsToContents *>
PROCEDURE QTableView_resizeRowsToContents (self: QTableView; );

<* EXTERNAL QTableView_resizeColumnToContents *>
PROCEDURE QTableView_resizeColumnToContents
  (self: QTableView; column: C.int; );

<* EXTERNAL QTableView_resizeColumnsToContents *>
PROCEDURE QTableView_resizeColumnsToContents (self: QTableView; );

<* EXTERNAL QTableView_sortByColumn1 *>
PROCEDURE QTableView_sortByColumn1 (self: QTableView; column: C.int; );

<* EXTERNAL QTableView_setShowGrid *>
PROCEDURE QTableView_setShowGrid (self: QTableView; show: BOOLEAN; );

TYPE QTableView = ADDRESS;

END QtTableViewRaw.
