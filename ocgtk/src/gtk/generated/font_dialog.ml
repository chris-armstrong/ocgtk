(* GENERATED CODE - DO NOT EDIT *)
(* FontDialog: FontDialog *)

type t = [`font_dialog | `object_] Gobject.obj

(** Create a new FontDialog *)
external new_ : unit -> t = "ml_gtk_font_dialog_new"

(* Methods *)
(** Sets the title that will be shown on the
font chooser dialog. *)
external set_title : t -> string -> unit = "ml_gtk_font_dialog_set_title"

(** Sets whether the font chooser dialog
blocks interaction with the parent window
while it is presented. *)
external set_modal : t -> bool -> unit = "ml_gtk_font_dialog_set_modal"

(** Adds a filter that decides which fonts to display
in the font chooser dialog.

The `GtkFilter` must be able to handle both `PangoFontFamily`
and `PangoFontFace` objects. *)
external set_filter : t -> Filter.t option -> unit = "ml_gtk_font_dialog_set_filter"

(** Returns the title that will be shown on the
font chooser dialog. *)
external get_title : t -> string = "ml_gtk_font_dialog_get_title"

(** Returns whether the font chooser dialog
blocks interaction with the parent window
while it is presented. *)
external get_modal : t -> bool = "ml_gtk_font_dialog_get_modal"

(** Returns the filter that decides which fonts to display
in the font chooser dialog. *)
external get_filter : t -> Filter.t option = "ml_gtk_font_dialog_get_filter"

(* Properties *)

