(* GENERATED CODE - DO NOT EDIT *)
(* IMContextSimple: IMContextSimple *)

type t = [`i_m_context_simple | `i_m_context | `object_] Gobject.obj

(** Create a new IMContextSimple *)
external gtk_im_context_simple_new : unit -> t = "ml_gtk_im_context_simple_new"

(** Adds an additional table from the X11 compose file. *)
external gtk_im_context_simple_add_compose_file : t -> string -> unit = "ml_gtk_im_context_simple_add_compose_file"

