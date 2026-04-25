(* OS/platform filter for conditional compilation guards. *)

open Sexplib.Std

type t = Os_only of string list | Os_except of string list
[@@deriving sexp, eq]
