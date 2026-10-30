(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                         *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License version 2, as published by the                       *)
(*    Free Software Foundation with the exception described in file       *)
(*    COPYING which comes with the library.                               *)
(*                                                                        *)
(**************************************************************************)

(** GTK version information — runtime and compile-time *)

(** {2 Runtime Version}

    The version of the GTK shared library that is actually loaded at runtime.
    Use this to gate calls to APIs that may not be present on the installed GTK.
*)

val runtime_major : unit -> int
val runtime_minor : unit -> int
val runtime_micro : unit -> int

val runtime : unit -> int * int * int
(** [runtime ()] returns [(major, minor, micro)] for the running GTK library. *)

val runtime_at_least : int -> int -> int -> bool
(** [runtime_at_least major minor micro] returns [true] when the running GTK
    library is at least the given version. *)

(** {2 Compile-Time Version}

    The version of GTK whose headers were used when building this library.
    Identical to the macros [GTK_MAJOR_VERSION] / [GTK_MINOR_VERSION] /
    [GTK_MICRO_VERSION]. *)

val compile_major : unit -> int
val compile_minor : unit -> int
val compile_micro : unit -> int

val compile_time : unit -> int * int * int
(** [compile_time ()] returns [(major, minor, micro)] from the build-time GTK
    headers. *)
