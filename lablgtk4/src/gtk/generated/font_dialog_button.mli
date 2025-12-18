(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialogButton *)

type t = [`font_dialog_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new FontDialogButton *)
external new_ : Font_dialog.t option -> t = "ml_gtk_font_dialog_button_new"

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

(** Sets the level of detail at which this dialog
lets the user select fonts. *)
external set_level : t -> Gtk_enums.fontlevel -> unit = "ml_gtk_font_dialog_button_set_level"

(** Sets a `GtkFontDialog` object to use for
creating the font chooser dialog that is
presented when the user clicks the button. *)
external set_dialog : t -> Font_dialog.t -> unit = "ml_gtk_font_dialog_button_set_dialog"

(** Returns the level of detail at which this dialog
lets the user select fonts. *)
external get_level : t -> Gtk_enums.fontlevel = "ml_gtk_font_dialog_button_get_level"

(** Returns the `GtkFontDialog` of @self. *)
external get_dialog : t -> Font_dialog.t option = "ml_gtk_font_dialog_button_get_dialog"

