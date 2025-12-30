(* High-level class for Scale *)
class scale (obj : Scale.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Scale.as_widget obj)

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

  method as_widget = (Scale.as_widget obj)
    method as_scale = obj
end

