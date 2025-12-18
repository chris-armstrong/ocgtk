class paper_size : Paper_size.t ->
  object
    method copy : unit -> Paper_size.t
    method free : unit -> unit
    method get_default_bottom_margin : unit -> float
    method get_default_left_margin : unit -> float
    method get_default_right_margin : unit -> float
    method get_default_top_margin : unit -> float
    method get_display_name : unit -> string
    method get_height : unit -> float
    method get_name : unit -> string
    method get_ppd_name : unit -> string
    method get_width : unit -> float
    method is_custom : unit -> bool
    method is_equal : Paper_size.t -> bool
    method is_ipp : unit -> bool
    method set_size : float -> float -> unit -> unit
    method as_paper_size : Paper_size.t
  end

