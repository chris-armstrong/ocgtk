class type display_manager_t = object
  inherit Gdisplay_manager_signals.display_manager_signals

  method get_default_display :
    unit -> GApp_launch_context_cycle_de440b34.display_t option

  method list_displays :
    unit -> GApp_launch_context_cycle_de440b34.display_t list

  method open_display :
    string option -> GApp_launch_context_cycle_de440b34.display_t option

  method set_default_display :
    GApp_launch_context_cycle_de440b34.display_t -> unit

  method as_display_manager : Display_manager.t
end

class display_manager : Display_manager.t -> display_manager_t
