(* GENERATED CODE - DO NOT EDIT *)
(* FontDialog: FontDialog *)

type t = [`font_dialog | `object_] Gobject.obj

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

(** Adds a filter that decides which fonts to display
in the font chooser dialog.

The `GtkFilter` must be able to handle both `PangoFontFamily`
and `PangoFontFace` objects. *)
external set_filter : t -> Filter.t option -> unit = "ml_gtk_font_dialog_set_filter"

(** Returns the filter that decides which fonts to display
in the font chooser dialog. *)
external get_filter : t -> Filter.t option = "ml_gtk_font_dialog_get_filter"

