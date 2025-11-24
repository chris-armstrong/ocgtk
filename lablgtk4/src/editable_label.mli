(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EditableLabel *)

type t = Gtk.Widget.t

(** Create a new EditableLabel *)
external new_ : string -> t = "ml_gtk_editable_label_new"

(* Properties *)

(** Get property: editing *)
external get_editing : t -> bool = "ml_gtk_editable_label_get_editing"

(** Set property: editing *)
external set_editing : t -> bool -> unit = "ml_gtk_editable_label_set_editing"

external stop_editing : t -> bool -> unit = "ml_gtk_editable_label_stop_editing"

external start_editing : t -> unit = "ml_gtk_editable_label_start_editing"

