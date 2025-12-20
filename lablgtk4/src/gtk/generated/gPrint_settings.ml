(* High-level class for PrintSettings *)
class print_settings (obj : Print_settings.t) = object (self)

  method get : string -> string option =
    fun key ->
      (Print_settings.get obj key)

  method get_bool : string -> bool =
    fun key ->
      (Print_settings.get_bool obj key)

  method get_collate : unit -> bool =
    fun () ->
      (Print_settings.get_collate obj)

  method get_default_source : unit -> string option =
    fun () ->
      (Print_settings.get_default_source obj)

  method get_dither : unit -> string option =
    fun () ->
      (Print_settings.get_dither obj)

  method get_double : string -> float =
    fun key ->
      (Print_settings.get_double obj key)

  method get_double_with_default : string -> float -> float =
    fun key def ->
      (Print_settings.get_double_with_default obj key def)

  method get_duplex : unit -> Gtk_enums.printduplex =
    fun () ->
      (Print_settings.get_duplex obj)

  method get_finishings : unit -> string option =
    fun () ->
      (Print_settings.get_finishings obj)

  method get_int : string -> int =
    fun key ->
      (Print_settings.get_int obj key)

  method get_int_with_default : string -> int -> int =
    fun key def ->
      (Print_settings.get_int_with_default obj key def)

  method get_length : string -> Gtk_enums.unit -> float =
    fun key unit ->
      (Print_settings.get_length obj key unit)

  method get_media_type : unit -> string option =
    fun () ->
      (Print_settings.get_media_type obj)

  method get_n_copies : unit -> int =
    fun () ->
      (Print_settings.get_n_copies obj)

  method get_number_up : unit -> int =
    fun () ->
      (Print_settings.get_number_up obj)

  method get_number_up_layout : unit -> Gtk_enums.numberuplayout =
    fun () ->
      (Print_settings.get_number_up_layout obj)

  method get_orientation : unit -> Gtk_enums.pageorientation =
    fun () ->
      (Print_settings.get_orientation obj)

  method get_output_bin : unit -> string option =
    fun () ->
      (Print_settings.get_output_bin obj)

  method get_page_set : unit -> Gtk_enums.pageset =
    fun () ->
      (Print_settings.get_page_set obj)

  method get_paper_height : Gtk_enums.unit -> float =
    fun unit ->
      (Print_settings.get_paper_height obj unit)

  method get_paper_size : unit -> Paper_size.t option =
    fun () ->
      (Print_settings.get_paper_size obj)

  method get_paper_width : Gtk_enums.unit -> float =
    fun unit ->
      (Print_settings.get_paper_width obj unit)

  method get_print_pages : unit -> Gtk_enums.printpages =
    fun () ->
      (Print_settings.get_print_pages obj)

  method get_printer : unit -> string option =
    fun () ->
      (Print_settings.get_printer obj)

  method get_printer_lpi : unit -> float =
    fun () ->
      (Print_settings.get_printer_lpi obj)

  method get_quality : unit -> Gtk_enums.printquality =
    fun () ->
      (Print_settings.get_quality obj)

  method get_resolution : unit -> int =
    fun () ->
      (Print_settings.get_resolution obj)

  method get_resolution_x : unit -> int =
    fun () ->
      (Print_settings.get_resolution_x obj)

  method get_resolution_y : unit -> int =
    fun () ->
      (Print_settings.get_resolution_y obj)

  method get_reverse : unit -> bool =
    fun () ->
      (Print_settings.get_reverse obj)

  method get_scale : unit -> float =
    fun () ->
      (Print_settings.get_scale obj)

  method get_use_color : unit -> bool =
    fun () ->
      (Print_settings.get_use_color obj)

  method has_key : string -> bool =
    fun key ->
      (Print_settings.has_key obj key)

  method set : string -> string option -> unit =
    fun key value ->
      (Print_settings.set obj key value)

  method set_bool : string -> bool -> unit =
    fun key value ->
      (Print_settings.set_bool obj key value)

  method set_collate : bool -> unit =
    fun collate ->
      (Print_settings.set_collate obj collate)

  method set_default_source : string -> unit =
    fun default_source ->
      (Print_settings.set_default_source obj default_source)

  method set_dither : string -> unit =
    fun dither ->
      (Print_settings.set_dither obj dither)

  method set_double : string -> float -> unit =
    fun key value ->
      (Print_settings.set_double obj key value)

  method set_duplex : Gtk_enums.printduplex -> unit =
    fun duplex ->
      (Print_settings.set_duplex obj duplex)

  method set_finishings : string -> unit =
    fun finishings ->
      (Print_settings.set_finishings obj finishings)

  method set_int : string -> int -> unit =
    fun key value ->
      (Print_settings.set_int obj key value)

  method set_length : string -> float -> Gtk_enums.unit -> unit =
    fun key value unit ->
      (Print_settings.set_length obj key value unit)

  method set_media_type : string -> unit =
    fun media_type ->
      (Print_settings.set_media_type obj media_type)

  method set_n_copies : int -> unit =
    fun num_copies ->
      (Print_settings.set_n_copies obj num_copies)

  method set_number_up : int -> unit =
    fun number_up ->
      (Print_settings.set_number_up obj number_up)

  method set_number_up_layout : Gtk_enums.numberuplayout -> unit =
    fun number_up_layout ->
      (Print_settings.set_number_up_layout obj number_up_layout)

  method set_orientation : Gtk_enums.pageorientation -> unit =
    fun orientation ->
      (Print_settings.set_orientation obj orientation)

  method set_output_bin : string -> unit =
    fun output_bin ->
      (Print_settings.set_output_bin obj output_bin)

  method set_page_set : Gtk_enums.pageset -> unit =
    fun page_set ->
      (Print_settings.set_page_set obj page_set)

  method set_paper_height : float -> Gtk_enums.unit -> unit =
    fun height unit ->
      (Print_settings.set_paper_height obj height unit)

  method set_paper_size : Paper_size.t -> unit =
    fun paper_size ->
      (Print_settings.set_paper_size obj paper_size)

  method set_paper_width : float -> Gtk_enums.unit -> unit =
    fun width unit ->
      (Print_settings.set_paper_width obj width unit)

  method set_print_pages : Gtk_enums.printpages -> unit =
    fun pages ->
      (Print_settings.set_print_pages obj pages)

  method set_printer : string -> unit =
    fun printer ->
      (Print_settings.set_printer obj printer)

  method set_printer_lpi : float -> unit =
    fun lpi ->
      (Print_settings.set_printer_lpi obj lpi)

  method set_quality : Gtk_enums.printquality -> unit =
    fun quality ->
      (Print_settings.set_quality obj quality)

  method set_resolution : int -> unit =
    fun resolution ->
      (Print_settings.set_resolution obj resolution)

  method set_resolution_xy : int -> int -> unit =
    fun resolution_x resolution_y ->
      (Print_settings.set_resolution_xy obj resolution_x resolution_y)

  method set_reverse : bool -> unit =
    fun reverse ->
      (Print_settings.set_reverse obj reverse)

  method set_scale : float -> unit =
    fun scale ->
      (Print_settings.set_scale obj scale)

  method set_use_color : bool -> unit =
    fun use_color ->
      (Print_settings.set_use_color obj use_color)

  method unset : string -> unit =
    fun key ->
      (Print_settings.unset obj key)

    method as_print_settings = obj
end

