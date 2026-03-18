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

(** Sets the language for which font features are applied. *)
external set_language : t -> Ocgtk_pango.Pango.Wrappers.Language.t -> unit = "ml_gtk_font_dialog_set_language"

(** Sets the fontmap from which fonts are selected.

If @fontmap is `NULL`, the default fontmap is used. *)
external set_font_map : t -> Ocgtk_pango.Pango.Wrappers.Font_map.t option -> unit = "ml_gtk_font_dialog_set_font_map"

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

(** Returns the language for which font features are applied. *)
external get_language : t -> Ocgtk_pango.Pango.Wrappers.Language.t option = "ml_gtk_font_dialog_get_language"

(** Returns the fontmap from which fonts are selected,
or `NULL` for the default fontmap. *)
external get_font_map : t -> Ocgtk_pango.Pango.Wrappers.Font_map.t option = "ml_gtk_font_dialog_get_font_map"

(** Returns the filter that decides which fonts to display
in the font chooser dialog. *)
external get_filter : t -> Filter.t option = "ml_gtk_font_dialog_get_filter"

(** Finishes the [method@Gtk.FontDialog.choose_font] call
and returns the resulting font description. *)
external choose_font_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (Ocgtk_pango.Pango.Wrappers.Font_description.t option, GError.t) result = "ml_gtk_font_dialog_choose_font_finish"

(** Finishes the [method@Gtk.FontDialog.choose_font_and_features]
call and returns the resulting font description and font features. *)
external choose_font_and_features_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool * Ocgtk_pango.Pango.Wrappers.Font_description.t * string * Ocgtk_pango.Pango.Wrappers.Language.t, GError.t) result = "ml_gtk_font_dialog_choose_font_and_features_finish"

(** Finishes the [method@Gtk.FontDialog.choose_family] call
and returns the resulting family.

This function never returns an error. If the operation is
not finished successfully, the value passed as @initial_value
to [method@Gtk.FontDialog.choose_family] is returned. *)
external choose_family_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (Ocgtk_pango.Pango.Wrappers.Font_family.t option, GError.t) result = "ml_gtk_font_dialog_choose_family_finish"

(** Finishes the [method@Gtk.FontDialog.choose_face] call
and returns the resulting font face. *)
external choose_face_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (Ocgtk_pango.Pango.Wrappers.Font_face.t option, GError.t) result = "ml_gtk_font_dialog_choose_face_finish"

(* Properties *)

