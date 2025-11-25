(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IMContextSimple *)

type t = Gtk.widget

(** Create a new IMContextSimple *)
external gtk_im_context_simple_new : unit -> t = "ml_gtk_im_context_simple_new"

(** Adds an additional table from the X11 compose file. *)
external gtk_im_context_simple_add_compose_file : t -> string -> unit = "ml_gtk_im_context_simple_add_compose_file"

