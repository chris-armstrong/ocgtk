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

(* Runtime version — from the linked GTK shared library *)
external runtime_major : unit -> int = "ml_gtk_get_major_version"
external runtime_minor : unit -> int = "ml_gtk_get_minor_version"
external runtime_micro : unit -> int = "ml_gtk_get_micro_version"

(* Compile-time version — from GTK headers used to build this library *)
external compile_major : unit -> int = "ml_gtk_compile_major_version"
external compile_minor : unit -> int = "ml_gtk_compile_minor_version"
external compile_micro : unit -> int = "ml_gtk_compile_micro_version"

let runtime () = (runtime_major (), runtime_minor (), runtime_micro ())
let compile_time () = (compile_major (), compile_minor (), compile_micro ())
let runtime_at_least major minor micro = runtime () >= (major, minor, micro)
