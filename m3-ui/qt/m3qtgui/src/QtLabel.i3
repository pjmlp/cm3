(*******************************************************************************
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
*******************************************************************************)

INTERFACE QtLabel;

FROM QtSize IMPORT QSize;
FROM QtPixmap IMPORT QPixmap;
FROM QtWidget IMPORT QWidget;
FROM QtMovie IMPORT QMovie;
FROM QtNamespace IMPORT WindowTypes, AlignmentFlag, TextInteractionFlags,
                        TextFormat;
FROM QtPicture IMPORT QPicture;


FROM QtFrame IMPORT QFrame;

TYPE T = QLabel;


TYPE
  QLabel <: QLabelPublic;
  QLabelPublic =
    QFrame BRANDED OBJECT
    METHODS
      init_0     (parent: QWidget; f: WindowTypes; ): QLabel;
      init_1     (parent: QWidget; ): QLabel;
      init_2     (): QLabel;
      init_3     (text: TEXT; parent: QWidget; f: WindowTypes; ): QLabel;
      init_4     (text: TEXT; parent: QWidget; ): QLabel;
      init_5     (text: TEXT; ): QLabel;
      text       (): TEXT;
      pixmap     (): QPixmap;
      picture    (): QPicture;
      movie      (): QMovie;
      textFormat (): TextFormat;
      setTextFormat           (arg1: TextFormat; );
      alignment               (): AlignmentFlag;
      setAlignment            (arg1: AlignmentFlag; );
      setWordWrap             (on: BOOLEAN; );
      wordWrap                (): BOOLEAN;
      indent                  (): INTEGER;
      setIndent               (arg1: INTEGER; );
      margin                  (): INTEGER;
      setMargin               (arg1: INTEGER; );
      hasScaledContents       (): BOOLEAN;
      setScaledContents       (arg1: BOOLEAN; );
      sizeHint                (): QSize; (* virtual *)
      minimumSizeHint         (): QSize; (* virtual *)
      setBuddy                (arg1: QWidget; );
      buddy                   (): QWidget;
      heightForWidth          (arg1: INTEGER; ): INTEGER; (* virtual *)
      openExternalLinks       (): BOOLEAN;
      setOpenExternalLinks    (open: BOOLEAN; );
      setTextInteractionFlags (flags: TextInteractionFlags; );
      textInteractionFlags    (): TextInteractionFlags;
      setText                 (arg1: TEXT; );
      setPixmap               (arg1: QPixmap; );
      setPicture              (arg1: QPicture; );
      setMovie                (movie: QMovie; );
      setNum                  (arg1: INTEGER; );
      setNum1                 (arg1: LONGREAL; );
      clear                   ();
      destroyCxx              ();
    END;


END QtLabel.
