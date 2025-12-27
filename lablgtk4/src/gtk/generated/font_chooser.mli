(* GENERATED CODE - DO NOT EDIT *)
(* FontChooser: FontChooser *)

type t = [`font_chooser] Gobject.obj

(* Methods *)
(** Shows or hides the editable preview entry. *)
external set_show_preview_entry : t -> bool -> unit = "ml_gtk_font_chooser_set_show_preview_entry"

(** Sets the text displayed in the preview area.

The @text is used to show how the selected font looks. *)
external set_preview_text : t -> string -> unit = "ml_gtk_font_chooser_set_preview_text"

(** Sets the desired level of granularity for selecting fonts. *)
external set_level : t -> Gtk_enums.fontchooserlevel -> unit = "ml_gtk_font_chooser_set_level"

(** Sets the language to use for font features. *)
external set_language : t -> string -> unit = "ml_gtk_font_chooser_set_language"

(** Sets the currently-selected font. *)
external set_font : t -> string -> unit = "ml_gtk_font_chooser_set_font"

(** Returns whether the preview entry is shown or not. *)
external get_show_preview_entry : t -> bool = "ml_gtk_font_chooser_get_show_preview_entry"

(** Gets the text displayed in the preview area. *)
external get_preview_text : t -> string = "ml_gtk_font_chooser_get_preview_text"

(** Returns the current level of granularity for selecting fonts. *)
external get_level : t -> Gtk_enums.fontchooserlevel = "ml_gtk_font_chooser_get_level"

(** Gets the language that is used for font features. *)
external get_language : t -> string = "ml_gtk_font_chooser_get_language"

(** The selected font size. *)
external get_font_size : t -> int = "ml_gtk_font_chooser_get_font_size"

(** Gets the currently-selected font features.

The format of the returned string is compatible with the
[CSS font-feature-settings property](https://www.w3.org/TR/css-fonts-4/#font-rend-desc).
It can be passed to [func@Pango.AttrFontFeatures.new]. *)
external get_font_features : t -> string = "ml_gtk_font_chooser_get_font_features"

(** Gets the currently-selected font name.

Note that this can be a different string than what you set with
[method@Gtk.FontChooser.set_font], as the font chooser widget may
normalize font names and thus return a string with a different
structure. For example, “Helvetica Italic Bold 12” could be
normalized to “Helvetica Bold Italic 12”.

Use [method@Pango.FontDescription.equal] if you want to compare two
font descriptions. *)
external get_font : t -> string option = "ml_gtk_font_chooser_get_font"

(* Properties *)

