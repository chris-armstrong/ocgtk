(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ComboBoxText *)

type t = Gtk.widget

(** Create a new ComboBoxText *)
external new_ : unit -> t = "ml_gtk_combo_box_text_new"

(** Create a new ComboBoxText *)
external new_with_entry : unit -> t = "ml_gtk_combo_box_text_new_with_entry"

external remove_all : t -> unit = "ml_gtk_combo_box_text_remove_all"

external remove : t -> int -> unit = "ml_gtk_combo_box_text_remove"

external prepend_text : t -> string -> unit = "ml_gtk_combo_box_text_prepend_text"

external prepend : t -> string option -> string -> unit = "ml_gtk_combo_box_text_prepend"

external insert_text : t -> int -> string -> unit = "ml_gtk_combo_box_text_insert_text"

external insert : t -> int -> string option -> string -> unit = "ml_gtk_combo_box_text_insert"

external append_text : t -> string -> unit = "ml_gtk_combo_box_text_append_text"

external append : t -> string option -> string -> unit = "ml_gtk_combo_box_text_append"

