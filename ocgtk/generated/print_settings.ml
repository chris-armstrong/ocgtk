class type print_settings_t = object
  (** {2:methods Methods} *)

  method copy : unit -> print_settings_t
  (** Copies a [GtkPrintSettings] object. *)

  method get : string -> string option
  (** Looks up the string value associated with [key]. *)

  method get_bool : string -> bool
  (** Returns the boolean represented by the value that is associated with
      [key].

      The string “true” represents [true], any other string [false]. *)

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

      Floating point numbers are parsed with [g_ascii_strtod ()]. *)

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
  (** Returns [true], if a value is associated with [key]. *)

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

      This has the same effect as setting the value to [None]. *)

  (** {2:conversions Conversions} *)

  method as_print_settings : Raw.Print_settings.t
end

(* High-level class for PrintSettings *)
class print_settings (obj : Raw.Print_settings.t) : print_settings_t =
  object (self)
    method copy : unit -> print_settings_t =
      fun () -> new print_settings (Raw.Print_settings.copy obj)

    method get : string -> string option =
      fun key -> Raw.Print_settings.get obj key

    method get_bool : string -> bool =
      fun key -> Raw.Print_settings.get_bool obj key

    method get_collate : unit -> bool =
      fun () -> Raw.Print_settings.get_collate obj

    method get_default_source : unit -> string option =
      fun () -> Raw.Print_settings.get_default_source obj

    method get_dither : unit -> string option =
      fun () -> Raw.Print_settings.get_dither obj

    method get_double : string -> float =
      fun key -> Raw.Print_settings.get_double obj key

    method get_double_with_default : string -> float -> float =
      fun key def -> Raw.Print_settings.get_double_with_default obj key def

    method get_duplex : unit -> Enums.printduplex =
      fun () -> Raw.Print_settings.get_duplex obj

    method get_finishings : unit -> string option =
      fun () -> Raw.Print_settings.get_finishings obj

    method get_int : string -> int =
      fun key -> Raw.Print_settings.get_int obj key

    method get_int_with_default : string -> int -> int =
      fun key def -> Raw.Print_settings.get_int_with_default obj key def

    method get_length : string -> Enums.unit -> float =
      fun key unit -> Raw.Print_settings.get_length obj key unit

    method get_media_type : unit -> string option =
      fun () -> Raw.Print_settings.get_media_type obj

    method get_n_copies : unit -> int =
      fun () -> Raw.Print_settings.get_n_copies obj

    method get_number_up : unit -> int =
      fun () -> Raw.Print_settings.get_number_up obj

    method get_number_up_layout : unit -> Enums.numberuplayout =
      fun () -> Raw.Print_settings.get_number_up_layout obj

    method get_orientation : unit -> Enums.pageorientation =
      fun () -> Raw.Print_settings.get_orientation obj

    method get_output_bin : unit -> string option =
      fun () -> Raw.Print_settings.get_output_bin obj

    method get_page_set : unit -> Enums.pageset =
      fun () -> Raw.Print_settings.get_page_set obj

    method get_paper_height : Enums.unit -> float =
      fun unit -> Raw.Print_settings.get_paper_height obj unit

    method get_paper_size : unit -> Raw.Paper_size.t option =
      fun () -> Raw.Print_settings.get_paper_size obj

    method get_paper_width : Enums.unit -> float =
      fun unit -> Raw.Print_settings.get_paper_width obj unit

    method get_print_pages : unit -> Enums.printpages =
      fun () -> Raw.Print_settings.get_print_pages obj

    method get_printer : unit -> string option =
      fun () -> Raw.Print_settings.get_printer obj

    method get_printer_lpi : unit -> float =
      fun () -> Raw.Print_settings.get_printer_lpi obj

    method get_quality : unit -> Enums.printquality =
      fun () -> Raw.Print_settings.get_quality obj

    method get_resolution : unit -> int =
      fun () -> Raw.Print_settings.get_resolution obj

    method get_resolution_x : unit -> int =
      fun () -> Raw.Print_settings.get_resolution_x obj

    method get_resolution_y : unit -> int =
      fun () -> Raw.Print_settings.get_resolution_y obj

    method get_reverse : unit -> bool =
      fun () -> Raw.Print_settings.get_reverse obj

    method get_scale : unit -> float =
      fun () -> Raw.Print_settings.get_scale obj

    method get_use_color : unit -> bool =
      fun () -> Raw.Print_settings.get_use_color obj

    method has_key : string -> bool =
      fun key -> Raw.Print_settings.has_key obj key

    method load_file : string -> (bool, GError.t) result =
      fun file_name -> Raw.Print_settings.load_file obj file_name

    method set : string -> string option -> unit =
      fun key value -> Raw.Print_settings.set obj key value

    method set_bool : string -> bool -> unit =
      fun key value -> Raw.Print_settings.set_bool obj key value

    method set_collate : bool -> unit =
      fun collate -> Raw.Print_settings.set_collate obj collate

    method set_default_source : string -> unit =
      fun default_source ->
        Raw.Print_settings.set_default_source obj default_source

    method set_dither : string -> unit =
      fun dither -> Raw.Print_settings.set_dither obj dither

    method set_double : string -> float -> unit =
      fun key value -> Raw.Print_settings.set_double obj key value

    method set_duplex : Enums.printduplex -> unit =
      fun duplex -> Raw.Print_settings.set_duplex obj duplex

    method set_finishings : string -> unit =
      fun finishings -> Raw.Print_settings.set_finishings obj finishings

    method set_int : string -> int -> unit =
      fun key value -> Raw.Print_settings.set_int obj key value

    method set_length : string -> float -> Enums.unit -> unit =
      fun key value unit -> Raw.Print_settings.set_length obj key value unit

    method set_media_type : string -> unit =
      fun media_type -> Raw.Print_settings.set_media_type obj media_type

    method set_n_copies : int -> unit =
      fun num_copies -> Raw.Print_settings.set_n_copies obj num_copies

    method set_number_up : int -> unit =
      fun number_up -> Raw.Print_settings.set_number_up obj number_up

    method set_number_up_layout : Enums.numberuplayout -> unit =
      fun number_up_layout ->
        Raw.Print_settings.set_number_up_layout obj number_up_layout

    method set_orientation : Enums.pageorientation -> unit =
      fun orientation -> Raw.Print_settings.set_orientation obj orientation

    method set_output_bin : string -> unit =
      fun output_bin -> Raw.Print_settings.set_output_bin obj output_bin

    method set_page_ranges : Raw.Page_range.t array -> int -> unit =
      fun page_ranges num_ranges ->
        Raw.Print_settings.set_page_ranges obj page_ranges num_ranges

    method set_page_set : Enums.pageset -> unit =
      fun page_set -> Raw.Print_settings.set_page_set obj page_set

    method set_paper_height : float -> Enums.unit -> unit =
      fun height unit -> Raw.Print_settings.set_paper_height obj height unit

    method set_paper_size : Raw.Paper_size.t -> unit =
      fun paper_size -> Raw.Print_settings.set_paper_size obj paper_size

    method set_paper_width : float -> Enums.unit -> unit =
      fun width unit -> Raw.Print_settings.set_paper_width obj width unit

    method set_print_pages : Enums.printpages -> unit =
      fun pages -> Raw.Print_settings.set_print_pages obj pages

    method set_printer : string -> unit =
      fun printer -> Raw.Print_settings.set_printer obj printer

    method set_printer_lpi : float -> unit =
      fun lpi -> Raw.Print_settings.set_printer_lpi obj lpi

    method set_quality : Enums.printquality -> unit =
      fun quality -> Raw.Print_settings.set_quality obj quality

    method set_resolution : int -> unit =
      fun resolution -> Raw.Print_settings.set_resolution obj resolution

    method set_resolution_xy : int -> int -> unit =
      fun resolution_x resolution_y ->
        Raw.Print_settings.set_resolution_xy obj resolution_x resolution_y

    method set_reverse : bool -> unit =
      fun reverse -> Raw.Print_settings.set_reverse obj reverse

    method set_scale : float -> unit =
      fun scale -> Raw.Print_settings.set_scale obj scale

    method set_use_color : bool -> unit =
      fun use_color -> Raw.Print_settings.set_use_color obj use_color

    method to_file : string -> (bool, GError.t) result =
      fun file_name -> Raw.Print_settings.to_file obj file_name

    method to_gvariant : unit -> Gvariant.t =
      fun () -> Raw.Print_settings.to_gvariant obj

    method unset : string -> unit = fun key -> Raw.Print_settings.unset obj key
    method as_print_settings = obj
  end

let new_ () : print_settings_t = new print_settings (Raw.Print_settings.new_ ())

let new_from_file (file_name : string) : (print_settings_t, GError.t) result =
  let obj_ = Raw.Print_settings.new_from_file file_name in
  Result.map (fun obj_ -> new print_settings obj_) obj_

let new_from_gvariant (variant : Gvariant.t) : print_settings_t =
  let obj_ = Raw.Print_settings.new_from_gvariant variant in
  new print_settings obj_
