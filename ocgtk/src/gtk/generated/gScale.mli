class scale : Scale.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method add_mark : float -> Gtk_enums.positiontype -> string option -> unit
    method clear_marks : unit -> unit
    method get_digits : unit -> int
    method get_draw_value : unit -> bool
    method get_has_origin : unit -> bool
    method get_value_pos : unit -> Gtk_enums.positiontype
    method set_digits : int -> unit
    method set_draw_value : bool -> unit
    method set_has_origin : bool -> unit
    method set_value_pos : Gtk_enums.positiontype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scale : Scale.t
  end

