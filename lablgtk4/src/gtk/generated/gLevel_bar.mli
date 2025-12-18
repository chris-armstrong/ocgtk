class level_bar : Level_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glevel_bar_signals.level_bar_signals
    method inverted : bool
    method set_inverted : bool -> unit
    method max_value : float
    method set_max_value : float -> unit
    method min_value : float
    method set_min_value : float -> unit
    method value : float
    method set_value : float -> unit
    method add_offset_value : string -> float -> unit
    method get_mode : unit -> Gtk_enums.levelbarmode
    method remove_offset_value : string option -> unit
    method set_mode : Gtk_enums.levelbarmode -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_level_bar : Level_bar.t
  end

