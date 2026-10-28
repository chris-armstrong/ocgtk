(** Collects the settings of a print dialog in a system-independent way.

    The main use for this object is that once you’ve printed you can get a
    settings object that represents the settings the user chose, and the next
    time you print you can pass that object in so that the user doesn’t have to
    re-set all his settings.

    Its also possible to enumerate the settings so that you can easily save the
    settings for the next time your app runs, or even store them in a document.
    The predefined keys try to use shared values as much as possible so that
    moving such a document between systems still works.

    Its methods, signals and properties are on {!class-type-print_settings_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Print_settings}. *)

(** {b The methods, signals and properties of a [PrintSettings].}

    Collects the settings of a print dialog in a system-independent way.

    The main use for this object is that once you’ve printed you can get a
    settings object that represents the settings the user chose, and the next
    time you print you can pass that object in so that the user doesn’t have to
    re-set all his settings.

    Its also possible to enumerate the settings so that you can easily save the
    settings for the next time your app runs, or even store them in a document.
    The predefined keys try to use shared values as much as possible so that
    moving such a document between systems still works. *)
class type print_settings_t = object
  method copy : unit -> print_settings_t
  (** Copies a [GtkPrintSettings] object. *)

  method get : string -> string option
  (** Looks up the string value associated with [key]. *)

  method get_bool : string -> bool
  (** Returns the boolean represented by the value that is associated with
      [key].

      The string “true” represents [TRUE], any other string [FALSE]. *)

  method get_collate : unit -> bool
  (** Gets the value of [GTK_PRINT_SETTINGS_COLLATE]. *)

  method get_default_source : unit -> string option
  (** Gets the value of [GTK_PRINT_SETTINGS_DEFAULT_SOURCE]. *)

  method get_dither : unit -> string option
  (** Gets the value of [GTK_PRINT_SETTINGS_DITHER]. *)

  method get_double : string -> float
  (** Returns the double value associated with [key], or 0. *)

  method get_double_with_default : string -> float -> float
  (** Returns the floating point number represented by the value that is
      associated with [key], or [default_val] if the value does not represent a
      floating point number.

      Floating point numbers are parsed with g_ascii_strtod(). *)

  method get_duplex : unit -> Enums.printduplex
  (** Gets the value of [GTK_PRINT_SETTINGS_DUPLEX]. *)

  method get_finishings : unit -> string option
  (** Gets the value of [GTK_PRINT_SETTINGS_FINISHINGS]. *)

  method get_int : string -> int
  (** Returns the integer value of [key], or 0. *)

  method get_int_with_default : string -> int -> int
  (** Returns the value of [key], interpreted as an integer, or the default
      value. *)

  method get_length : string -> Enums.unit -> float
  (** Returns the value associated with [key], interpreted as a length.

      The returned value is converted to [units]. *)

  method get_media_type : unit -> string option
  (** Gets the value of [GTK_PRINT_SETTINGS_MEDIA_TYPE].

      The set of media types is defined in PWG 5101.1-2002 PWG. *)

  method get_n_copies : unit -> int
  (** Gets the value of [GTK_PRINT_SETTINGS_N_COPIES]. *)

  method get_number_up : unit -> int
  (** Gets the value of [GTK_PRINT_SETTINGS_NUMBER_UP]. *)

  method get_number_up_layout : unit -> Enums.numberuplayout
  (** Gets the value of [GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT]. *)

  method get_orientation : unit -> Enums.pageorientation
  (** Get the value of [GTK_PRINT_SETTINGS_ORIENTATION], converted to a
      [GtkPageOrientation]. *)

  method get_output_bin : unit -> string option
  (** Gets the value of [GTK_PRINT_SETTINGS_OUTPUT_BIN]. *)

  method get_page_set : unit -> Enums.pageset
  (** Gets the value of [GTK_PRINT_SETTINGS_PAGE_SET]. *)

  method get_paper_height : Enums.unit -> float
  (** Gets the value of [GTK_PRINT_SETTINGS_PAPER_HEIGHT], converted to [unit].
  *)

  method get_paper_size : unit -> Raw.Paper_size.t option
  (** Gets the value of [GTK_PRINT_SETTINGS_PAPER_FORMAT], converted to a
      [GtkPaperSize]. *)

  method get_paper_width : Enums.unit -> float
  (** Gets the value of [GTK_PRINT_SETTINGS_PAPER_WIDTH], converted to [unit].
  *)

  method get_print_pages : unit -> Enums.printpages
  (** Gets the value of [GTK_PRINT_SETTINGS_PRINT_PAGES]. *)

  method get_printer : unit -> string option
  (** Convenience function to obtain the value of [GTK_PRINT_SETTINGS_PRINTER].
  *)

  method get_printer_lpi : unit -> float
  (** Gets the value of [GTK_PRINT_SETTINGS_PRINTER_LPI]. *)

  method get_quality : unit -> Enums.printquality
  (** Gets the value of [GTK_PRINT_SETTINGS_QUALITY]. *)

  method get_resolution : unit -> int
  (** Gets the value of [GTK_PRINT_SETTINGS_RESOLUTION]. *)

  method get_resolution_x : unit -> int
  (** Gets the value of [GTK_PRINT_SETTINGS_RESOLUTION_X]. *)

  method get_resolution_y : unit -> int
  (** Gets the value of [GTK_PRINT_SETTINGS_RESOLUTION_Y]. *)

  method get_reverse : unit -> bool
  (** Gets the value of [GTK_PRINT_SETTINGS_REVERSE]. *)

  method get_scale : unit -> float
  (** Gets the value of [GTK_PRINT_SETTINGS_SCALE]. *)

  method get_use_color : unit -> bool
  (** Gets the value of [GTK_PRINT_SETTINGS_USE_COLOR]. *)

  method has_key : string -> bool
  (** Returns [TRUE], if a value is associated with [key]. *)

  method load_file : string -> (bool, GError.t) result
  (** Reads the print settings from [file_name].

      If the file could not be loaded then error is set to either a [GFileError]
      or [GKeyFileError].

      See [Gtk.PrintSettings.to_file]. *)

  method set : string -> string option -> unit
  (** Associates [value] with [key]. *)

  method set_bool : string -> bool -> unit
  (** Sets [key] to a boolean value. *)

  method set_collate : bool -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_COLLATE]. *)

  method set_default_source : string -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_DEFAULT_SOURCE]. *)

  method set_dither : string -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_DITHER]. *)

  method set_double : string -> float -> unit
  (** Sets [key] to a double value. *)

  method set_duplex : Enums.printduplex -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_DUPLEX]. *)

  method set_finishings : string -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_FINISHINGS]. *)

  method set_int : string -> int -> unit
  (** Sets [key] to an integer value. *)

  method set_length : string -> float -> Enums.unit -> unit
  (** Associates a length in units of [unit] with [key]. *)

  method set_media_type : string -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_MEDIA_TYPE].

      The set of media types is defined in PWG 5101.1-2002 PWG. *)

  method set_n_copies : int -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_N_COPIES]. *)

  method set_number_up : int -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_NUMBER_UP]. *)

  method set_number_up_layout : Enums.numberuplayout -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_NUMBER_UP_LAYOUT]. *)

  method set_orientation : Enums.pageorientation -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_ORIENTATION]. *)

  method set_output_bin : string -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_OUTPUT_BIN]. *)

  method set_page_ranges : Raw.Page_range.t array -> int -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PAGE_RANGES]. *)

  method set_page_set : Enums.pageset -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PAGE_SET]. *)

  method set_paper_height : float -> Enums.unit -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PAPER_HEIGHT]. *)

  method set_paper_size : Raw.Paper_size.t -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PAPER_FORMAT],
      [GTK_PRINT_SETTINGS_PAPER_WIDTH] and [GTK_PRINT_SETTINGS_PAPER_HEIGHT]. *)

  method set_paper_width : float -> Enums.unit -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PAPER_WIDTH]. *)

  method set_print_pages : Enums.printpages -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PRINT_PAGES]. *)

  method set_printer : string -> unit
  (** Convenience function to set [GTK_PRINT_SETTINGS_PRINTER] to [printer]. *)

  method set_printer_lpi : float -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_PRINTER_LPI]. *)

  method set_quality : Enums.printquality -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_QUALITY]. *)

  method set_resolution : int -> unit
  (** Sets the values of [GTK_PRINT_SETTINGS_RESOLUTION],
      [GTK_PRINT_SETTINGS_RESOLUTION_X] and [GTK_PRINT_SETTINGS_RESOLUTION_Y].
  *)

  method set_resolution_xy : int -> int -> unit
  (** Sets the values of [GTK_PRINT_SETTINGS_RESOLUTION],
      [GTK_PRINT_SETTINGS_RESOLUTION_X] and [GTK_PRINT_SETTINGS_RESOLUTION_Y].
  *)

  method set_reverse : bool -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_REVERSE]. *)

  method set_scale : float -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_SCALE]. *)

  method set_use_color : bool -> unit
  (** Sets the value of [GTK_PRINT_SETTINGS_USE_COLOR]. *)

  method to_file : string -> (bool, GError.t) result
  (** This function saves the print settings from [settings] to [file_name].

      If the file could not be written then error is set to either a
      [GFileError] or [GKeyFileError]. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize print settings to an a\{sv\} variant. *)

  method unset : string -> unit
  (** Removes any value associated with [key].

      This has the same effect as setting the value to [NULL]. *)

  method as_print_settings : Raw.Print_settings.t
end

class print_settings : Raw.Print_settings.t -> print_settings_t
(** Wraps a raw handle of {!Ocgtk.Raw.Print_settings.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> print_settings_t
(** Creates a new [GtkPrintSettings] object. *)

val new_from_file : string -> (print_settings_t, GError.t) result
(** Reads the print settings from [file_name].

    Returns a new [GtkPrintSettings] object with the restored settings, or
    [NULL] if an error occurred. If the file could not be loaded then error is
    set to either a [GFileError] or [GKeyFileError].

    See [Gtk.PrintSettings.to_file]. *)

val new_from_gvariant : Gvariant.t -> print_settings_t
(** Deserialize print settings from an a\{sv\} variant.

    The variant must be in the format produced by
    [Gtk.PrintSettings.to_gvariant]. *)
