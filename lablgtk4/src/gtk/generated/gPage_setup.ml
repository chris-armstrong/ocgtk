(* High-level class for PageSetup *)
class page_setup (obj : Page_setup.t) = object (self)

  method get_bottom_margin : unit -> float = fun unit -> (Page_setup.get_bottom_margin obj unit)

  method get_left_margin : unit -> float = fun unit -> (Page_setup.get_left_margin obj unit)

  method get_orientation : unit -> Gtk_enums.pageorientation = fun () -> (Page_setup.get_orientation obj )

  method get_page_height : unit -> float = fun unit -> (Page_setup.get_page_height obj unit)

  method get_page_width : unit -> float = fun unit -> (Page_setup.get_page_width obj unit)

  method get_paper_height : unit -> float = fun unit -> (Page_setup.get_paper_height obj unit)

  method get_paper_size : unit -> Paper_size.t = fun () -> (Page_setup.get_paper_size obj )

  method get_paper_width : unit -> float = fun unit -> (Page_setup.get_paper_width obj unit)

  method get_right_margin : unit -> float = fun unit -> (Page_setup.get_right_margin obj unit)

  method get_top_margin : unit -> float = fun unit -> (Page_setup.get_top_margin obj unit)

  method load_file : string -> (bool, GError.t) result = fun file_name -> (Page_setup.load_file obj file_name)

  method set_bottom_margin : float -> unit -> unit = fun margin unit -> (Page_setup.set_bottom_margin obj margin unit)

  method set_left_margin : float -> unit -> unit = fun margin unit -> (Page_setup.set_left_margin obj margin unit)

  method set_orientation : Gtk_enums.pageorientation -> unit = fun orientation -> (Page_setup.set_orientation obj orientation)

  method set_paper_size : Paper_size.t -> unit = fun size -> (Page_setup.set_paper_size obj size)

  method set_paper_size_and_default_margins : Paper_size.t -> unit = fun size -> (Page_setup.set_paper_size_and_default_margins obj size)

  method set_right_margin : float -> unit -> unit = fun margin unit -> (Page_setup.set_right_margin obj margin unit)

  method set_top_margin : float -> unit -> unit = fun margin unit -> (Page_setup.set_top_margin obj margin unit)

  method to_file : string -> (bool, GError.t) result = fun file_name -> (Page_setup.to_file obj file_name)

    method as_page_setup = obj
end

