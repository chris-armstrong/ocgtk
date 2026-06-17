(* GENERATED CODE - DO NOT EDIT *)
(* IMContextSimple: IMContextSimple *)

type t = [`im_context_simple | `im_context | `object_] Gobject.obj

(** Create a new IMContextSimple *)
external new_ : unit -> t = "ml_gtk_im_context_simple_new"

(* Methods *)
(** Adds an additional table from the X11 compose file. *)
external add_compose_file : t -> string -> unit = "ml_gtk_im_context_simple_add_compose_file"

