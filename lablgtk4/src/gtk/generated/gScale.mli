class scale : Scale.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method digits : int
    method set_digits : int -> unit
    method draw_value : bool
    method set_draw_value : bool -> unit
    method has_origin : bool
    method set_has_origin : bool -> unit
    method add_mark : float -> Gtk_enums.positiontype -> string option -> unit
    method clear_marks : unit -> unit
    method get_value_pos : unit -> Gtk_enums.positiontype
    method set_value_pos : Gtk_enums.positiontype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scale : Scale.t
  end

