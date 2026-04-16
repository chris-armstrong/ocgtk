(* GENERATED CODE - DO NOT EDIT *)
(* Converter: Converter *)

type t = [ `converter ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_converter_from_gobject"

(* Methods *)

external reset : t -> unit = "ml_g_converter_reset"
(** Resets all internal state in the converter, making it behave as if it was
    just created. If the converter has any internal state that would produce
    output then that output is lost. *)
