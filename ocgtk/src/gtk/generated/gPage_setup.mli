class type page_setup_t = object
    method copy : unit -> page_setup_t
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
    method load_file : string -> (bool, GError.t) result
    method set_bottom_margin : float -> Gtk_enums.unit -> unit
    method set_left_margin : float -> Gtk_enums.unit -> unit
    method set_orientation : Gtk_enums.pageorientation -> unit
    method set_paper_size : Paper_size.t -> unit
    method set_paper_size_and_default_margins : Paper_size.t -> unit
    method set_right_margin : float -> Gtk_enums.unit -> unit
    method set_top_margin : float -> Gtk_enums.unit -> unit
    method to_file : string -> (bool, GError.t) result
    method to_gvariant : unit -> Gvariant.t
    method as_page_setup : Page_setup.t
end

class page_setup : Page_setup.t -> page_setup_t

val new_ : unit -> page_setup_t
val new_from_file : string -> (page_setup_t, GError.t) result
val new_from_gvariant : Gvariant.t -> page_setup_t
