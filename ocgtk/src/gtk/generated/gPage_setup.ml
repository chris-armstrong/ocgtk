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

(* High-level class for PageSetup *)
class page_setup (obj : Page_setup.t) : page_setup_t = object (self)

  method copy : unit -> page_setup_t =
    fun () ->
      new  page_setup(Page_setup.copy obj)

  method get_bottom_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_bottom_margin obj unit)

  method get_left_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_left_margin obj unit)

  method get_orientation : unit -> Gtk_enums.pageorientation =
    fun () ->
      (Page_setup.get_orientation obj)

  method get_page_height : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_page_height obj unit)

  method get_page_width : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_page_width obj unit)

  method get_paper_height : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_paper_height obj unit)

  method get_paper_size : unit -> Paper_size.t =
    fun () ->
      (Page_setup.get_paper_size obj)

  method get_paper_width : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_paper_width obj unit)

  method get_right_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_right_margin obj unit)

  method get_top_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Page_setup.get_top_margin obj unit)

  method load_file : string -> (bool, GError.t) result =
    fun file_name ->
      (Page_setup.load_file obj file_name)

  method set_bottom_margin : float -> Gtk_enums.unit -> unit =
    fun margin unit ->
      (Page_setup.set_bottom_margin obj margin unit)

  method set_left_margin : float -> Gtk_enums.unit -> unit =
    fun margin unit ->
      (Page_setup.set_left_margin obj margin unit)

  method set_orientation : Gtk_enums.pageorientation -> unit =
    fun orientation ->
      (Page_setup.set_orientation obj orientation)

  method set_paper_size : Paper_size.t -> unit =
    fun size ->
      (Page_setup.set_paper_size obj size)

  method set_paper_size_and_default_margins : Paper_size.t -> unit =
    fun size ->
      (Page_setup.set_paper_size_and_default_margins obj size)

  method set_right_margin : float -> Gtk_enums.unit -> unit =
    fun margin unit ->
      (Page_setup.set_right_margin obj margin unit)

  method set_top_margin : float -> Gtk_enums.unit -> unit =
    fun margin unit ->
      (Page_setup.set_top_margin obj margin unit)

  method to_file : string -> (bool, GError.t) result =
    fun file_name ->
      (Page_setup.to_file obj file_name)

  method to_gvariant : unit -> Gvariant.t =
    fun () ->
      (Page_setup.to_gvariant obj)

    method as_page_setup = obj
end

let new_ () : page_setup_t =
  new page_setup (Page_setup.new_ ())

let new_from_file (file_name : string) : (page_setup_t, GError.t) result =
  let obj_ = Page_setup.new_from_file file_name in
Result.map (fun obj_ ->  new page_setup obj_) obj_

let new_from_gvariant (variant : Gvariant.t) : page_setup_t =
  let obj_ = Page_setup.new_from_gvariant variant in
  new page_setup obj_

