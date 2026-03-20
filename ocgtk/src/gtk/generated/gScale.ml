class type scale_t = object
    method add_mark : float -> Gtk_enums.positiontype -> string option -> unit
    method clear_marks : unit -> unit
    method get_digits : unit -> int
    method get_draw_value : unit -> bool
    method get_has_origin : unit -> bool
    method get_layout : unit -> Ocgtk_pango.Pango.layout_t option
    method get_value_pos : unit -> Gtk_enums.positiontype
    method set_digits : int -> unit
    method set_draw_value : bool -> unit
    method set_has_origin : bool -> unit
    method set_value_pos : Gtk_enums.positiontype -> unit
    method as_scale : Scale.t
end

(* High-level class for Scale *)
class scale (obj : Scale.t) : scale_t = object (self)

  method add_mark : float -> Gtk_enums.positiontype -> string option -> unit =
    fun value position markup ->
      (Scale.add_mark obj value position markup)

  method clear_marks : unit -> unit =
    fun () ->
      (Scale.clear_marks obj)

  method get_digits : unit -> int =
    fun () ->
      (Scale.get_digits obj)

  method get_draw_value : unit -> bool =
    fun () ->
      (Scale.get_draw_value obj)

  method get_has_origin : unit -> bool =
    fun () ->
      (Scale.get_has_origin obj)

  method get_layout : unit -> Ocgtk_pango.Pango.layout_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.layout ret) (Scale.get_layout obj)

  method get_value_pos : unit -> Gtk_enums.positiontype =
    fun () ->
      (Scale.get_value_pos obj)

  method set_digits : int -> unit =
    fun digits ->
      (Scale.set_digits obj digits)

  method set_draw_value : bool -> unit =
    fun draw_value ->
      (Scale.set_draw_value obj draw_value)

  method set_has_origin : bool -> unit =
    fun has_origin ->
      (Scale.set_has_origin obj has_origin)

  method set_value_pos : Gtk_enums.positiontype -> unit =
    fun pos ->
      (Scale.set_value_pos obj pos)

    method as_scale = obj
end

