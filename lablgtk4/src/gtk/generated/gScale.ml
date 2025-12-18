(* High-level class for Scale *)
class scale (obj : Scale.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Scale.as_widget obj)

  method digits = Scale.get_digits obj
  method set_digits v = Scale.set_digits obj v

  method draw_value = Scale.get_draw_value obj
  method set_draw_value v = Scale.set_draw_value obj v

  method has_origin = Scale.get_has_origin obj
  method set_has_origin v = Scale.set_has_origin obj v

  method add_mark : float -> Gtk_enums.positiontype -> string option -> unit = fun value position markup -> (Scale.add_mark obj value position markup)

  method clear_marks : unit -> unit = fun () -> (Scale.clear_marks obj )

  method get_value_pos : unit -> Gtk_enums.positiontype = fun () -> (Scale.get_value_pos obj )

  method set_value_pos : Gtk_enums.positiontype -> unit = fun pos -> (Scale.set_value_pos obj pos)

  method as_widget = (Scale.as_widget obj)
    method as_scale = obj
end

