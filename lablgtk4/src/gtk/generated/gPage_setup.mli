class page_setup : Page_setup.t ->
  object
    method get_bottom_margin : Gtk_enums.unit -> float
    method get_left_margin : Gtk_enums.unit -> float
    method get_orientation : unit -> Gtk_enums.pageorientation
    method get_page_height : Gtk_enums.unit -> float
    method get_page_width : Gtk_enums.unit -> float
    method get_paper_height : Gtk_enums.unit -> float
    method get_paper_size : unit -> Paper_size.t
    method get_paper_width : Gtk_enums.unit -> float
    method get_right_margin : Gtk_enums.unit -> float
    method get_top_margin : Gtk_enums.unit -> float
    method set_bottom_margin : float -> Gtk_enums.unit -> unit
    method set_left_margin : float -> Gtk_enums.unit -> unit
    method set_orientation : Gtk_enums.pageorientation -> unit
    method set_paper_size : Paper_size.t -> unit
    method set_paper_size_and_default_margins : Paper_size.t -> unit
    method set_right_margin : float -> Gtk_enums.unit -> unit
    method set_top_margin : float -> Gtk_enums.unit -> unit
    method as_page_setup : Page_setup.t
  end

