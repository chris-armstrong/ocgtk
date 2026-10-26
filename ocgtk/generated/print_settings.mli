class type print_settings_t = object
  method copy : unit -> print_settings_t
  method get : string -> string option
  method get_bool : string -> bool
  method get_collate : unit -> bool
  method get_default_source : unit -> string option
  method get_dither : unit -> string option
  method get_double : string -> float
  method get_double_with_default : string -> float -> float
  method get_duplex : unit -> Enums.printduplex
  method get_finishings : unit -> string option
  method get_int : string -> int
  method get_int_with_default : string -> int -> int
  method get_length : string -> Enums.unit -> float
  method get_media_type : unit -> string option
  method get_n_copies : unit -> int
  method get_number_up : unit -> int
  method get_number_up_layout : unit -> Enums.numberuplayout
  method get_orientation : unit -> Enums.pageorientation
  method get_output_bin : unit -> string option
  method get_page_set : unit -> Enums.pageset
  method get_paper_height : Enums.unit -> float
  method get_paper_size : unit -> Raw.Paper_size.t option
  method get_paper_width : Enums.unit -> float
  method get_print_pages : unit -> Enums.printpages
  method get_printer : unit -> string option
  method get_printer_lpi : unit -> float
  method get_quality : unit -> Enums.printquality
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
  method set_duplex : Enums.printduplex -> unit
  method set_finishings : string -> unit
  method set_int : string -> int -> unit
  method set_length : string -> float -> Enums.unit -> unit
  method set_media_type : string -> unit
  method set_n_copies : int -> unit
  method set_number_up : int -> unit
  method set_number_up_layout : Enums.numberuplayout -> unit
  method set_orientation : Enums.pageorientation -> unit
  method set_output_bin : string -> unit
  method set_page_ranges : Raw.Page_range.t array -> int -> unit
  method set_page_set : Enums.pageset -> unit
  method set_paper_height : float -> Enums.unit -> unit
  method set_paper_size : Raw.Paper_size.t -> unit
  method set_paper_width : float -> Enums.unit -> unit
  method set_print_pages : Enums.printpages -> unit
  method set_printer : string -> unit
  method set_printer_lpi : float -> unit
  method set_quality : Enums.printquality -> unit
  method set_resolution : int -> unit
  method set_resolution_xy : int -> int -> unit
  method set_reverse : bool -> unit
  method set_scale : float -> unit
  method set_use_color : bool -> unit
  method to_file : string -> (bool, GError.t) result
  method to_gvariant : unit -> Gvariant.t
  method unset : string -> unit
  method as_print_settings : Raw.Print_settings.t
end

class print_settings : Raw.Print_settings.t -> print_settings_t

val new_ : unit -> print_settings_t
val new_from_file : string -> (print_settings_t, GError.t) result
val new_from_gvariant : Gvariant.t -> print_settings_t
