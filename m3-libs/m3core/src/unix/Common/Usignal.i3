(* Copyright (C) 1990, Digital Equipment Corporation.                 *)
(* All rights reserved.                                               *)
(* See the file COPYRIGHT for a full description.                     *)

<*EXTERNAL*> INTERFACE Usignal;

FROM Ctypes IMPORT int;
FROM Utypes IMPORT pid_t;

(*CONST*)
<*EXTERNAL "Usignal_SIGINT"*> VAR SIGINT: int;
<*EXTERNAL "Usignal_SIGKILL"*> VAR SIGKILL: int;

TYPE
  SignalHandler = PROCEDURE (sig: int);
  SignalActionHandler = PROCEDURE (sig: int; sip: siginfo_t_star; uap: ADDRESS (* Uucontext.ucontext_t_star *) );
  siginfo_t_star = ADDRESS;

PROCEDURE kill (pid: pid_t; sig: int): int;

END Usignal.
