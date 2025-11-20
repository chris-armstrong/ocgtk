(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialog *)

type t = Gtk.Widget.t

(** Create a new FontDialog *)
external new_ : unit -> t = "ml_gtk_font_dialog_new"

(* Properties *)

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_font_dialog_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_font_dialog_set_modal"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_font_dialog_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_font_dialog_set_title"

external set_language : t -> unit -> unit = "ml_gtk_font_dialog_set_language"

external set_font_map : t -> unit -> unit = "ml_gtk_font_dialog_set_font_map"

external set_filter : t -> Gtk.Widget.t option -> unit = "ml_gtk_font_dialog_set_filter"

external get_filter : t -> Gtk.Widget.t = "ml_gtk_font_dialog_get_filter"

external choose_font_and_features_finish : t -> unit -> unit -> string -> unit -> (bool, GError.t) result = "ml_gtk_font_dialog_choose_font_and_features_finish"

external choose_font_and_features : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_font_dialog_choose_font_and_features_bytecode" "ml_gtk_font_dialog_choose_font_and_features_native"

external choose_font : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_font_dialog_choose_font_bytecode" "ml_gtk_font_dialog_choose_font_native"

external choose_family : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_font_dialog_choose_family_bytecode" "ml_gtk_font_dialog_choose_family_native"

external choose_face : t -> Gtk.Widget.t option -> unit -> unit -> unit -> unit -> unit = "ml_gtk_font_dialog_choose_face_bytecode" "ml_gtk_font_dialog_choose_face_native"

