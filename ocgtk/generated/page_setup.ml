class type page_setup_t = object
  method copy : unit -> page_setup_t
  (** Copies a [GtkPageSetup]. *)

  method get_bottom_margin : Enums.unit -> float
  (** Gets the bottom margin in units of [unit]. *)

  method get_left_margin : Enums.unit -> float
  (** Gets the left margin in units of [unit]. *)

  method get_orientation : unit -> Enums.pageorientation
  (** Gets the page orientation of the [GtkPageSetup]. *)

  method get_page_height : Enums.unit -> float
  (** Returns the page height in units of [unit].

      Note that this function takes orientation and margins into consideration.
      See [Gtk.PageSetup.get_paper_height]. *)

  method get_page_width : Enums.unit -> float
  (** Returns the page width in units of [unit].

      Note that this function takes orientation and margins into consideration.
      See [Gtk.PageSetup.get_paper_width]. *)

  method get_paper_height : Enums.unit -> float
  (** Returns the paper height in units of [unit].

      Note that this function takes orientation, but not margins into
      consideration. See [Gtk.PageSetup.get_page_height]. *)

  method get_paper_size : unit -> Raw.Paper_size.t
  (** Gets the paper size of the [GtkPageSetup]. *)

  method get_paper_width : Enums.unit -> float
  (** Returns the paper width in units of [unit].

      Note that this function takes orientation, but not margins into
      consideration. See [Gtk.PageSetup.get_page_width]. *)

  method get_right_margin : Enums.unit -> float
  (** Gets the right margin in units of [unit]. *)

  method get_top_margin : Enums.unit -> float
  (** Gets the top margin in units of [unit]. *)

  method load_file : string -> (bool, GError.t) result
  (** Reads the page setup from the file [file_name].

      See [Gtk.PageSetup.to_file]. *)

  method set_bottom_margin : float -> Enums.unit -> unit
  (** Sets the bottom margin of the [GtkPageSetup]. *)

  method set_left_margin : float -> Enums.unit -> unit
  (** Sets the left margin of the [GtkPageSetup]. *)

  method set_orientation : Enums.pageorientation -> unit
  (** Sets the page orientation of the [GtkPageSetup]. *)

  method set_paper_size : Raw.Paper_size.t -> unit
  (** Sets the paper size of the [GtkPageSetup] without changing the margins.

      See [Gtk.PageSetup.set_paper_size_and_default_margins]. *)

  method set_paper_size_and_default_margins : Raw.Paper_size.t -> unit
  (** Sets the paper size of the [GtkPageSetup] and modifies the margins
      according to the new paper size. *)

  method set_right_margin : float -> Enums.unit -> unit
  (** Sets the right margin of the [GtkPageSetup]. *)

  method set_top_margin : float -> Enums.unit -> unit
  (** Sets the top margin of the [GtkPageSetup]. *)

  method to_file : string -> (bool, GError.t) result
  (** This function saves the information from [setup] to [file_name]. *)

  method to_gvariant : unit -> Gvariant.t
  (** Serialize page setup to an a\{sv\} variant. *)

  method as_page_setup : Raw.Page_setup.t
end

(* High-level class for PageSetup *)
class page_setup (obj : Raw.Page_setup.t) : page_setup_t =
  object (self)
    method copy : unit -> page_setup_t =
      fun () -> new page_setup (Raw.Page_setup.copy obj)

    method get_bottom_margin : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_bottom_margin obj unit

    method get_left_margin : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_left_margin obj unit

    method get_orientation : unit -> Enums.pageorientation =
      fun () -> Raw.Page_setup.get_orientation obj

    method get_page_height : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_page_height obj unit

    method get_page_width : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_page_width obj unit

    method get_paper_height : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_paper_height obj unit

    method get_paper_size : unit -> Raw.Paper_size.t =
      fun () -> Raw.Page_setup.get_paper_size obj

    method get_paper_width : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_paper_width obj unit

    method get_right_margin : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_right_margin obj unit

    method get_top_margin : Enums.unit -> float =
      fun unit -> Raw.Page_setup.get_top_margin obj unit

    method load_file : string -> (bool, GError.t) result =
      fun file_name -> Raw.Page_setup.load_file obj file_name

    method set_bottom_margin : float -> Enums.unit -> unit =
      fun margin unit -> Raw.Page_setup.set_bottom_margin obj margin unit

    method set_left_margin : float -> Enums.unit -> unit =
      fun margin unit -> Raw.Page_setup.set_left_margin obj margin unit

    method set_orientation : Enums.pageorientation -> unit =
      fun orientation -> Raw.Page_setup.set_orientation obj orientation

    method set_paper_size : Raw.Paper_size.t -> unit =
      fun size -> Raw.Page_setup.set_paper_size obj size

    method set_paper_size_and_default_margins : Raw.Paper_size.t -> unit =
      fun size -> Raw.Page_setup.set_paper_size_and_default_margins obj size

    method set_right_margin : float -> Enums.unit -> unit =
      fun margin unit -> Raw.Page_setup.set_right_margin obj margin unit

    method set_top_margin : float -> Enums.unit -> unit =
      fun margin unit -> Raw.Page_setup.set_top_margin obj margin unit

    method to_file : string -> (bool, GError.t) result =
      fun file_name -> Raw.Page_setup.to_file obj file_name

    method to_gvariant : unit -> Gvariant.t =
      fun () -> Raw.Page_setup.to_gvariant obj

    method as_page_setup = obj
  end

let new_ () : page_setup_t = new page_setup (Raw.Page_setup.new_ ())

let new_from_file (file_name : string) : (page_setup_t, GError.t) result =
  let obj_ = Raw.Page_setup.new_from_file file_name in
  Result.map (fun obj_ -> new page_setup obj_) obj_

let new_from_gvariant (variant : Gvariant.t) : page_setup_t =
  let obj_ = Raw.Page_setup.new_from_gvariant variant in
  new page_setup obj_
