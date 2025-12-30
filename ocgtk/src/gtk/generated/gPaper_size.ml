(* High-level class for PaperSize *)
class paper_size (obj : Paper_size.t) = object (self)

  method copy : unit -> Paper_size.t =
    fun () ->
      (Paper_size.copy obj)

  method free : unit -> unit =
    fun () ->
      (Paper_size.free obj)

  method get_default_bottom_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_default_bottom_margin obj unit)

  method get_default_left_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_default_left_margin obj unit)

  method get_default_right_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_default_right_margin obj unit)

  method get_default_top_margin : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_default_top_margin obj unit)

  method get_display_name : unit -> string =
    fun () ->
      (Paper_size.get_display_name obj)

  method get_height : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_height obj unit)

  method get_name : unit -> string =
    fun () ->
      (Paper_size.get_name obj)

  method get_ppd_name : unit -> string =
    fun () ->
      (Paper_size.get_ppd_name obj)

  method get_width : Gtk_enums.unit -> float =
    fun unit ->
      (Paper_size.get_width obj unit)

  method is_custom : unit -> bool =
    fun () ->
      (Paper_size.is_custom obj)

  method is_equal : Paper_size.t -> bool =
    fun size2 ->
      (Paper_size.is_equal obj size2)

  method is_ipp : unit -> bool =
    fun () ->
      (Paper_size.is_ipp obj)

  method set_size : float -> float -> Gtk_enums.unit -> unit =
    fun width height unit ->
      (Paper_size.set_size obj width height unit)

    method as_paper_size = obj
end

