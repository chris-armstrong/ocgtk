(* GENERATED CODE - DO NOT EDIT *)
(* PrintSettings: PrintSettings *)

type t = [`print_settings | `object_] Gobject.obj

(** Create a new PrintSettings *)
external new_ : unit -> t = "ml_gtk_print_settings_new"

(** Create a new PrintSettings *)
external new_from_gvariant : unit -> t = "ml_gtk_print_settings_new_from_gvariant"

(** Removes any value associated with @key.

This has the same effect as setting the value to %NULL. *)
external unset : t -> string -> unit = "ml_gtk_print_settings_unset"

(** This function saves the print settings from @settings to @file_name.

If the file could not be written then error is set to either a
`GFileError` or `GKeyFileError`. *)
external to_file : t -> string -> (bool, GError.t) result = "ml_gtk_print_settings_to_file"

(** Sets the value of %GTK_PRINT_SETTINGS_USE_COLOR. *)
external set_use_color : t -> bool -> unit = "ml_gtk_print_settings_set_use_color"

(** Sets the value of %GTK_PRINT_SETTINGS_SCALE. *)
external set_scale : t -> float -> unit = "ml_gtk_print_settings_set_scale"

(** Sets the value of %GTK_PRINT_SETTINGS_REVERSE. *)
external set_reverse : t -> bool -> unit = "ml_gtk_print_settings_set_reverse"

(** Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
%GTK_PRINT_SETTINGS_RESOLUTION_X and
%GTK_PRINT_SETTINGS_RESOLUTION_Y. *)
external set_resolution_xy : t -> int -> int -> unit = "ml_gtk_print_settings_set_resolution_xy"

(** Sets the values of %GTK_PRINT_SETTINGS_RESOLUTION,
%GTK_PRINT_SETTINGS_RESOLUTION_X and
%GTK_PRINT_SETTINGS_RESOLUTION_Y. *)
external set_resolution : t -> int -> unit = "ml_gtk_print_settings_set_resolution"

(** Sets the value of %GTK_PRINT_SETTINGS_QUALITY. *)
external set_quality : t -> Gtk_enums.printquality -> unit = "ml_gtk_print_settings_set_quality"

(** Sets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI. *)
external set_printer_lpi : t -> float -> unit = "ml_gtk_print_settings_set_printer_lpi"

(** Convenience function to set %GTK_PRINT_SETTINGS_PRINTER
to @printer. *)
external set_printer : t -> string -> unit = "ml_gtk_print_settings_set_printer"

(** Sets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES. *)
external set_print_pages : t -> Gtk_enums.printpages -> unit = "ml_gtk_print_settings_set_print_pages"

(** Sets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH. *)
external set_paper_width : t -> float -> unit -> unit = "ml_gtk_print_settings_set_paper_width"

(** Sets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
%GTK_PRINT_SETTINGS_PAPER_WIDTH and
%GTK_PRINT_SETTINGS_PAPER_HEIGHT. *)
external set_paper_size : t -> Paper_size.t -> unit = "ml_gtk_print_settings_set_paper_size"

(** Sets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT. *)
external set_paper_height : t -> float -> unit -> unit = "ml_gtk_print_settings_set_paper_height"

(** Sets the value of %GTK_PRINT_SETTINGS_PAGE_SET. *)
external set_page_set : t -> Gtk_enums.pageset -> unit = "ml_gtk_print_settings_set_page_set"

(** Sets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN. *)
external set_output_bin : t -> string -> unit = "ml_gtk_print_settings_set_output_bin"

(** Sets the value of %GTK_PRINT_SETTINGS_ORIENTATION. *)
external set_orientation : t -> Gtk_enums.pageorientation -> unit = "ml_gtk_print_settings_set_orientation"

(** Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT. *)
external set_number_up_layout : t -> Gtk_enums.numberuplayout -> unit = "ml_gtk_print_settings_set_number_up_layout"

(** Sets the value of %GTK_PRINT_SETTINGS_NUMBER_UP. *)
external set_number_up : t -> int -> unit = "ml_gtk_print_settings_set_number_up"

(** Sets the value of %GTK_PRINT_SETTINGS_N_COPIES. *)
external set_n_copies : t -> int -> unit = "ml_gtk_print_settings_set_n_copies"

(** Sets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.

The set of media types is defined in PWG 5101.1-2002 PWG. *)
external set_media_type : t -> string -> unit = "ml_gtk_print_settings_set_media_type"

(** Associates a length in units of @unit with @key. *)
external set_length : t -> string -> float -> unit -> unit = "ml_gtk_print_settings_set_length"

(** Sets @key to an integer value. *)
external set_int : t -> string -> int -> unit = "ml_gtk_print_settings_set_int"

(** Sets the value of %GTK_PRINT_SETTINGS_FINISHINGS. *)
external set_finishings : t -> string -> unit = "ml_gtk_print_settings_set_finishings"

(** Sets the value of %GTK_PRINT_SETTINGS_DUPLEX. *)
external set_duplex : t -> Gtk_enums.printduplex -> unit = "ml_gtk_print_settings_set_duplex"

(** Sets @key to a double value. *)
external set_double : t -> string -> float -> unit = "ml_gtk_print_settings_set_double"

(** Sets the value of %GTK_PRINT_SETTINGS_DITHER. *)
external set_dither : t -> string -> unit = "ml_gtk_print_settings_set_dither"

(** Sets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE. *)
external set_default_source : t -> string -> unit = "ml_gtk_print_settings_set_default_source"

(** Sets the value of %GTK_PRINT_SETTINGS_COLLATE. *)
external set_collate : t -> bool -> unit = "ml_gtk_print_settings_set_collate"

(** Sets @key to a boolean value. *)
external set_bool : t -> string -> bool -> unit = "ml_gtk_print_settings_set_bool"

(** Associates @value with @key. *)
external set : t -> string -> string option -> unit = "ml_gtk_print_settings_set"

(** Reads the print settings from @file_name.

If the file could not be loaded then error is set to either
a `GFileError` or `GKeyFileError`.

See [method@Gtk.PrintSettings.to_file]. *)
external load_file : t -> string -> (bool, GError.t) result = "ml_gtk_print_settings_load_file"

(** Returns %TRUE, if a value is associated with @key. *)
external has_key : t -> string -> bool = "ml_gtk_print_settings_has_key"

(** Gets the value of %GTK_PRINT_SETTINGS_USE_COLOR. *)
external get_use_color : t -> bool = "ml_gtk_print_settings_get_use_color"

(** Gets the value of %GTK_PRINT_SETTINGS_SCALE. *)
external get_scale : t -> float = "ml_gtk_print_settings_get_scale"

(** Gets the value of %GTK_PRINT_SETTINGS_REVERSE. *)
external get_reverse : t -> bool = "ml_gtk_print_settings_get_reverse"

(** Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_Y. *)
external get_resolution_y : t -> int = "ml_gtk_print_settings_get_resolution_y"

(** Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION_X. *)
external get_resolution_x : t -> int = "ml_gtk_print_settings_get_resolution_x"

(** Gets the value of %GTK_PRINT_SETTINGS_RESOLUTION. *)
external get_resolution : t -> int = "ml_gtk_print_settings_get_resolution"

(** Gets the value of %GTK_PRINT_SETTINGS_QUALITY. *)
external get_quality : t -> Gtk_enums.printquality = "ml_gtk_print_settings_get_quality"

(** Gets the value of %GTK_PRINT_SETTINGS_PRINTER_LPI. *)
external get_printer_lpi : t -> float = "ml_gtk_print_settings_get_printer_lpi"

(** Convenience function to obtain the value of
%GTK_PRINT_SETTINGS_PRINTER. *)
external get_printer : t -> string option = "ml_gtk_print_settings_get_printer"

(** Gets the value of %GTK_PRINT_SETTINGS_PRINT_PAGES. *)
external get_print_pages : t -> Gtk_enums.printpages = "ml_gtk_print_settings_get_print_pages"

(** Gets the value of %GTK_PRINT_SETTINGS_PAPER_WIDTH,
converted to @unit. *)
external get_paper_width : t -> unit -> float = "ml_gtk_print_settings_get_paper_width"

(** Gets the value of %GTK_PRINT_SETTINGS_PAPER_FORMAT,
converted to a `GtkPaperSize`. *)
external get_paper_size : t -> Paper_size.t option = "ml_gtk_print_settings_get_paper_size"

(** Gets the value of %GTK_PRINT_SETTINGS_PAPER_HEIGHT,
converted to @unit. *)
external get_paper_height : t -> unit -> float = "ml_gtk_print_settings_get_paper_height"

(** Gets the value of %GTK_PRINT_SETTINGS_PAGE_SET. *)
external get_page_set : t -> Gtk_enums.pageset = "ml_gtk_print_settings_get_page_set"

(** Gets the value of %GTK_PRINT_SETTINGS_OUTPUT_BIN. *)
external get_output_bin : t -> string option = "ml_gtk_print_settings_get_output_bin"

(** Get the value of %GTK_PRINT_SETTINGS_ORIENTATION,
converted to a `GtkPageOrientation`. *)
external get_orientation : t -> Gtk_enums.pageorientation = "ml_gtk_print_settings_get_orientation"

(** Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT. *)
external get_number_up_layout : t -> Gtk_enums.numberuplayout = "ml_gtk_print_settings_get_number_up_layout"

(** Gets the value of %GTK_PRINT_SETTINGS_NUMBER_UP. *)
external get_number_up : t -> int = "ml_gtk_print_settings_get_number_up"

(** Gets the value of %GTK_PRINT_SETTINGS_N_COPIES. *)
external get_n_copies : t -> int = "ml_gtk_print_settings_get_n_copies"

(** Gets the value of %GTK_PRINT_SETTINGS_MEDIA_TYPE.

The set of media types is defined in PWG 5101.1-2002 PWG. *)
external get_media_type : t -> string option = "ml_gtk_print_settings_get_media_type"

(** Returns the value associated with @key, interpreted
as a length.

The returned value is converted to @units. *)
external get_length : t -> string -> unit -> float = "ml_gtk_print_settings_get_length"

(** Returns the value of @key, interpreted as
an integer, or the default value. *)
external get_int_with_default : t -> string -> int -> int = "ml_gtk_print_settings_get_int_with_default"

(** Returns the integer value of @key, or 0. *)
external get_int : t -> string -> int = "ml_gtk_print_settings_get_int"

(** Gets the value of %GTK_PRINT_SETTINGS_FINISHINGS. *)
external get_finishings : t -> string option = "ml_gtk_print_settings_get_finishings"

(** Gets the value of %GTK_PRINT_SETTINGS_DUPLEX. *)
external get_duplex : t -> Gtk_enums.printduplex = "ml_gtk_print_settings_get_duplex"

(** Returns the floating point number represented by
the value that is associated with @key, or @default_val
if the value does not represent a floating point number.

Floating point numbers are parsed with g_ascii_strtod(). *)
external get_double_with_default : t -> string -> float -> float = "ml_gtk_print_settings_get_double_with_default"

(** Returns the double value associated with @key, or 0. *)
external get_double : t -> string -> float = "ml_gtk_print_settings_get_double"

(** Gets the value of %GTK_PRINT_SETTINGS_DITHER. *)
external get_dither : t -> string option = "ml_gtk_print_settings_get_dither"

(** Gets the value of %GTK_PRINT_SETTINGS_DEFAULT_SOURCE. *)
external get_default_source : t -> string option = "ml_gtk_print_settings_get_default_source"

(** Gets the value of %GTK_PRINT_SETTINGS_COLLATE. *)
external get_collate : t -> bool = "ml_gtk_print_settings_get_collate"

(** Returns the boolean represented by the value
that is associated with @key.

The string “true” represents %TRUE, any other
string %FALSE. *)
external get_bool : t -> string -> bool = "ml_gtk_print_settings_get_bool"

(** Looks up the string value associated with @key. *)
external get : t -> string -> string option = "ml_gtk_print_settings_get"

