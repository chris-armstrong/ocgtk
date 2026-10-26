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
