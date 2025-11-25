(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FontDialogButton *)

type t = [`font_dialog_button | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new FontDialogButton *)
external new_ : Gtk.widget option -> t = "ml_gtk_font_dialog_button_new"

(* Properties *)

(** If @use_size is `TRUE`, the font name will be written
using the selected font size. *)
external set_use_size : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_size"

(** If @use_font is `TRUE`, the font name will be written
using the selected font. *)
external set_use_font : t -> bool -> unit = "ml_gtk_font_dialog_button_set_use_font"

(** Sets the level of detail at which this dialog
lets the user select fonts. *)
external set_level : t -> Gtk_enums.fontlevel -> unit = "ml_gtk_font_dialog_button_set_level"

(** Sets the font features of the button. *)
external set_font_features : t -> string option -> unit = "ml_gtk_font_dialog_button_set_font_features"

(** Sets a `GtkFontDialog` object to use for
creating the font chooser dialog that is
presented when the user clicks the button. *)
external set_dialog : t -> Gtk.widget -> unit = "ml_gtk_font_dialog_button_set_dialog"

(** Returns whether the selected font size is used in the label. *)
external get_use_size : t -> bool = "ml_gtk_font_dialog_button_get_use_size"

(** Returns whether the selected font is used in the label. *)
external get_use_font : t -> bool = "ml_gtk_font_dialog_button_get_use_font"

(** Returns the level of detail at which this dialog
lets the user select fonts. *)
external get_level : t -> Gtk_enums.fontlevel = "ml_gtk_font_dialog_button_get_level"

(** Returns the font features of the button.

This function is what should be used to obtain the font features
that were chosen by the user. To get informed about changes, listen
to "notify::font-features".

Note that the button will only let users choose font features
if [property@Gtk.FontDialogButton:level] is set to
`GTK_FONT_LEVEL_FEATURES`. *)
external get_font_features : t -> string = "ml_gtk_font_dialog_button_get_font_features"

(** Returns the `GtkFontDialog` of @self. *)
external get_dialog : t -> Gtk.widget = "ml_gtk_font_dialog_button_get_dialog"

