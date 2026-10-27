class type page_setup_t = object
  method copy : unit -> page_setup_t
  method get_bottom_margin : Enums.unit -> float
  method get_left_margin : Enums.unit -> float
  method get_orientation : unit -> Enums.pageorientation
  method get_page_height : Enums.unit -> float
  method get_page_width : Enums.unit -> float
  method get_paper_height : Enums.unit -> float
  method get_paper_size : unit -> Raw.Paper_size.t
  method get_paper_width : Enums.unit -> float
  method get_right_margin : Enums.unit -> float
  method get_top_margin : Enums.unit -> float
  method load_file : string -> (bool, GError.t) result
  method set_bottom_margin : float -> Enums.unit -> unit
  method set_left_margin : float -> Enums.unit -> unit
  method set_orientation : Enums.pageorientation -> unit
  method set_paper_size : Raw.Paper_size.t -> unit
  method set_paper_size_and_default_margins : Raw.Paper_size.t -> unit
  method set_right_margin : float -> Enums.unit -> unit
  method set_top_margin : float -> Enums.unit -> unit
  method to_file : string -> (bool, GError.t) result
  method to_gvariant : unit -> Gvariant.t
  method as_page_setup : Raw.Page_setup.t
end

class page_setup : Raw.Page_setup.t -> page_setup_t

val new_ : unit -> page_setup_t
val new_from_file : string -> (page_setup_t, GError.t) result
val new_from_gvariant : Gvariant.t -> page_setup_t
