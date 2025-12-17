class page_setup : Page_setup.t ->
  object
    method get_bottom_margin : unit -> float
    method get_left_margin : unit -> float
    method get_orientation : unit -> Gtk_enums.pageorientation
    method get_page_height : unit -> float
    method get_page_width : unit -> float
    method get_paper_height : unit -> float
    method get_paper_size : unit -> Paper_size.t
    method get_paper_width : unit -> float
    method get_right_margin : unit -> float
    method get_top_margin : unit -> float
    method load_file : string -> (bool, GError.t) result
    method set_bottom_margin : float -> unit -> unit
    method set_left_margin : float -> unit -> unit
    method set_orientation : Gtk_enums.pageorientation -> unit
    method set_paper_size : Paper_size.t -> unit
    method set_paper_size_and_default_margins : Paper_size.t -> unit
    method set_right_margin : float -> unit -> unit
    method set_top_margin : float -> unit -> unit
    method to_file : string -> (bool, GError.t) result
    method as_page_setup : Page_setup.t
  end

