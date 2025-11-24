(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialogButton *)

type t = Gtk.Widget.t

(** Create a new FontDialogButton *)
external new_ : Gtk.Widget.t option -> t = "ml_gtk_font_dialog_button_new"

(* Properties *)

(** Get property: font-features *)
external get_font_features : t -> string = "ml_gtk_font_dialog_button_get_font_features"

(** Set property: font-features *)
external set_font_features : t -> string -> unit = "ml_gtk_font_dialog_button_set_font_features"

(** Get property: use-font *)
external get_use_font : t -> bool = "ml_gtk_font_dialog_button_get_use_font"

(** Set property: use-font *)
external set_use_font : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_font"

(** Get property: use-size *)
external get_use_size : t -> bool = "ml_gtk_font_dialog_button_get_use_size"

(** Set property: use-size *)
external set_use_size : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_size"

external set_level : t -> Gtk_enums.fontlevel -> unit = "ml_gtk_font_dialog_button_set_level"

external set_dialog : t -> Gtk.Widget.t -> unit = "ml_gtk_font_dialog_button_set_dialog"

external get_level : t -> Gtk_enums.fontlevel = "ml_gtk_font_dialog_button_get_level"

external get_dialog : t -> Gtk.Widget.t = "ml_gtk_font_dialog_button_get_dialog"

