(* GENERATED CODE - DO NOT EDIT *)
(* Converter: Converter *)

type t = [`converter] Gobject.obj

(* Methods *)
(** Resets all internal state in the converter, making it behave
as if it was just created. If the converter has any internal
state that would produce output then that output is lost. *)
external reset : t -> unit = "ml_g_converter_reset"

