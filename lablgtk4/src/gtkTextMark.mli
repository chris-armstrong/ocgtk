(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextMark *)

type t = Gtk.Widget.t

(** Get the name of the mark *)
external get_name : t -> string option = "ml_gtk_text_mark_get_name"

(** Get whether the mark has been deleted *)
external get_deleted : t -> bool = "ml_gtk_text_mark_get_deleted"

(** Get the buffer this mark belongs to *)
external get_buffer : t -> Gtk.Widget.t option = "ml_gtk_text_mark_get_buffer"
