MODULE Main;

(* generate a C .h file that corresponds to M3CG_Binary.  *)

IMPORT M3CG_Binary, Wr, Stdio, Text, ASCII, Fmt;

TYPE
  Op   = M3CG_Binary.Op;

PROCEDURE Out (a, b, c, d, e, f, g : TEXT := NIL) =
  <*FATAL ANY*>
  VAR wr := Stdio.stdout;
  BEGIN
    IF (a # NIL) THEN Wr.PutText (wr, a); END;
    IF (b # NIL) THEN Wr.PutText (wr, b); END;
    IF (c # NIL) THEN Wr.PutText (wr, c); END;
    IF (d # NIL) THEN Wr.PutText (wr, d); END;
    IF (e # NIL) THEN Wr.PutText (wr, e); END;
    IF (f # NIL) THEN Wr.PutText (wr, f); END;
    IF (g # NIL) THEN Wr.PutText (wr, g); END;
    Wr.PutText (wr, Wr.EOL);
    Wr.Flush (wr);
  END Out;

PROCEDURE Pad (txt: TEXT): TEXT =
  CONST z = ARRAY [0..22] OF TEXT {
    "                      ", 
    "                     ", 
    "                    ", 
    "                   ", 
    "                  ", 
    "                 ", 
    "                ", 
    "               ", 
    "              ", 
    "             ", 
    "            ", 
    "           ", 
    "          ", 
    "         ", 
    "        ", 
    "       ", 
    "      ", 
    "     ", 
    "    ", 
    "   ", 
    "  ", 
    " ", 
    "" };
  BEGIN
    RETURN z [MAX (FIRST (z), MIN (Text.Length (txt), LAST(z)))];
  END Pad;

PROCEDURE Upper (txt: TEXT): TEXT =
  VAR
    len := Text.Length (txt);
    buf : ARRAY [0..99] OF CHAR;
  BEGIN
    <*ASSERT len <= NUMBER (buf) *>
    Text.SetChars (buf, txt);
    FOR i := 0 TO len-1 DO
      buf[i] := ASCII.Upper [buf[i]];
    END;
    RETURN Text.FromChars (SUBARRAY (buf, 0, len));
  END Upper;

BEGIN
  Out ("/* C version of M3CG_Binary. */");
  Out ("/* This file is generated by m3cggen. */");
  Out ("");

  Out ("#define M3CG_Version  0x", Fmt.Int (M3CG_Binary.Version, 16));
  Out ("");

  Out ("typedef enum {");
  FOR op := Op.begin_unit TO Op.widechar_size DO
    Out ("  M3CG_", Upper (M3CG_Binary.OpText(op)), ", ",
         Pad (M3CG_Binary.OpText(op)), "/* ", Fmt.Int (ORD (op)), " */");
  END;
  Out ("  LAST_OPCODE } M3CG_opcode;");
  Out ("");

  Out ("static const char *M3CG_opnames[] = {");
  FOR op := Op.begin_unit TO Op.widechar_size DO
    Out ("  \"", M3CG_Binary.OpText(op), "\", ",
         Pad(M3CG_Binary.OpText(op)), "/* ", Fmt.Int (ORD (op)), " */");
  END;
  Out ("  0 };");
  Out ("");

  Out ("");
  Out ("#define M3CG_Int1        ", Fmt.Int (M3CG_Binary.Int1));
  Out ("#define M3CG_NInt1       ", Fmt.Int (M3CG_Binary.NInt1));
  Out ("#define M3CG_Int2        ", Fmt.Int (M3CG_Binary.Int2));
  Out ("#define M3CG_NInt2       ", Fmt.Int (M3CG_Binary.NInt2));
  Out ("#define M3CG_Int4        ", Fmt.Int (M3CG_Binary.Int4));
  Out ("#define M3CG_NInt4       ", Fmt.Int (M3CG_Binary.NInt4));
  Out ("#define M3CG_Int8        ", Fmt.Int (M3CG_Binary.Int8));
  Out ("#define M3CG_NInt8       ", Fmt.Int (M3CG_Binary.NInt8));
  Out ("#define M3CG_LastRegular ", Fmt.Int (M3CG_Binary.LastRegular));
  
END Main.
