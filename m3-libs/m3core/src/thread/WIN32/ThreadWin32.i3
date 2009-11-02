(* Copyright (C) 1994, Digital Equipment Corporation               *)
(* All rights reserved.                                            *)
(* See the file COPYRIGHT for a full description.                  *)
(*                                                                 *)
(* Portions Copyright 1996-2000, Critical Mass, Inc.               *)
(* See file COPYRIGHT-CMASS for details.                           *)

UNSAFE INTERFACE ThreadWin32;

FROM WinDef IMPORT BOOL(*int*);

(*----------------------------------------- Exceptions, types and globals ---*)

(* critical sections: Enter, Leave *)

<*EXTERNAL "ThreadWin32__EnterCriticalSection_giant"*>
PROCEDURE EnterCriticalSection_giant();
<*EXTERNAL "ThreadWin32__LeaveCriticalSection_giant"*>
PROCEDURE LeaveCriticalSection_giant();
    (* Global lock for internals of Mutex and Condition *)


<*EXTERNAL "ThreadWin32__EnterCriticalSection_activeMu"*>
PROCEDURE EnterCriticalSection_activeMu();
<*EXTERNAL "ThreadWin32__LeaveCriticalSection_activeMu"*>
PROCEDURE LeaveCriticalSection_activeMu();
    (* Global lock for list of active threads *)
    (* It is illegal to touch *any* traced references while
       holding activeMu because it is needed by SuspendOthers
       which is called by the collector's page fault handler. *)


<*EXTERNAL "ThreadWin32__EnterCriticalSection_slotMu"*>
PROCEDURE EnterCriticalSection_slotMu();
<*EXTERNAL "ThreadWin32__LeaveCriticalSection_slotMu"*>
PROCEDURE LeaveCriticalSection_slotMu();
    (* Global lock for thread slot table *)


(*------------------------------------------------------------------ Self ---*)

(* thread local threadIndex: TlsGetValue, TlsSetValue
   GetValue called before InitC returns 0 (aka NULL)
   SetValue called before InitC returns 0 (aka FALSE)
*)
<*EXTERNAL "ThreadWin32__TlsSetValue_threadIndex"*>
PROCEDURE TlsSetValue_threadIndex(a: INTEGER): BOOL;
<*EXTERNAL "ThreadWin32__TlsGetValue_threadIndex"*>
PROCEDURE TlsGetValue_threadIndex(): INTEGER;

(*------------------------------------------------------ ShowThread hooks ---*)

<*EXTERNAL "ThreadWin32__EnterCriticalSection_perfMu"*>
PROCEDURE EnterCriticalSection_perfMu();
<*EXTERNAL "ThreadWin32__LeaveCriticalSection_perfMu"*>
PROCEDURE LeaveCriticalSection_perfMu();

(*------------------------------------------------------------- collector ---*)
(* These procedures provide synchronization primitives for the allocator
   and collector. *)

<*EXTERNAL "ThreadWin32__EnterCriticalSection_heap"*>
PROCEDURE EnterCriticalSection_heap();
<*EXTERNAL "ThreadWin32__LeaveCriticalSection_heap"*>
PROCEDURE LeaveCriticalSection_heap();

(*---------------------------------------------------------------------------*)

<*EXTERNAL ThreadWin32__InitC*>
PROCEDURE InitC();

(*---------------------------------------------------------------------------*)

END ThreadWin32.
