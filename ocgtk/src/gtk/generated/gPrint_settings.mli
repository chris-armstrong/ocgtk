class print_settings : Print_settings.t ->
  object
    method get : string -> string option
    method get_bool : string -> bool
    method get_collate : unit -> bool
    method get_default_source : unit -> string option
    method get_dither : unit -> string option
    method get_double : string -> float
    method get_double_with_default : string -> float -> float
    method get_duplex : unit -> Gtk_enums.printduplex
    method get_finishings : unit -> string option
    method get_int : string -> int
    method get_int_with_default : string -> int -> int
    method get_length : string -> Gtk_enums.unit -> float
    method get_media_type : unit -> string option
    method get_n_copies : unit -> int
    method get_number_up : unit -> int
    method get_number_up_layout : unit -> Gtk_enums.numberuplayout
    method get_orientation : unit -> Gtk_enums.pageorientation
    method get_output_bin : unit -> string option
    method get_page_set : unit -> Gtk_enums.pageset
    method get_paper_height : Gtk_enums.unit -> float
    method get_paper_size : unit -> Paper_size.t option
    method get_paper_width : Gtk_enums.unit -> float
    method get_print_pages : unit -> Gtk_enums.printpages
    method get_printer : unit -> string option
    method get_printer_lpi : unit -> float
    method get_quality : unit -> Gtk_enums.printquality
    method get_resolution : unit -> int
    method get_resolution_x : unit -> int
    method get_resolution_y : unit -> int
    method get_reverse : unit -> bool
    method get_scale : unit -> float
    method get_use_color : unit -> bool
    method has_key : string -> bool
    method load_file : string -> (bool, GError.t) result
    method set : string -> string option -> unit
    method set_bool : string -> bool -> unit
    method set_collate : bool -> unit
    method set_default_source : string -> unit
    method set_dither : string -> unit
    method set_double : string -> float -> unit
    method set_duplex : Gtk_enums.printduplex -> unit
    method set_finishings : string -> unit
    method set_int : string -> int -> unit
    method set_length : string -> float -> Gtk_enums.unit -> unit
    method set_media_type : string -> unit
    method set_n_copies : int -> unit
    method set_number_up : int -> unit
    method set_number_up_layout : Gtk_enums.numberuplayout -> unit
    method set_orientation : Gtk_enums.pageorientation -> unit
    method set_output_bin : string -> unit
    method set_page_ranges : Page_range.t array -> int -> unit
    method set_page_set : Gtk_enums.pageset -> unit
    method set_paper_height : float -> Gtk_enums.unit -> unit
    method set_paper_size : Paper_size.t -> unit
    method set_paper_width : float -> Gtk_enums.unit -> unit
    method set_print_pages : Gtk_enums.printpages -> unit
    method set_printer : string -> unit
    method set_printer_lpi : float -> unit
    method set_quality : Gtk_enums.printquality -> unit
    method set_resolution : int -> unit
    method set_resolution_xy : int -> int -> unit
    method set_reverse : bool -> unit
    method set_scale : float -> unit
    method set_use_color : bool -> unit
    method to_file : string -> (bool, GError.t) result
    method unset : string -> unit
    method as_print_settings : Print_settings.t
  end

