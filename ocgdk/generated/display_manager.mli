class type display_manager_t = object
  method on_display_opened :
    ?after:bool ->
    callback:(display:App_launch_context_cycle_de440b34.display_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_default_display :
    unit -> App_launch_context_cycle_de440b34.display_t option

  method list_displays :
    unit -> App_launch_context_cycle_de440b34.display_t list

  method open_display :
    string option -> App_launch_context_cycle_de440b34.display_t option

  method set_default_display :
    App_launch_context_cycle_de440b34.display_t -> unit

  method as_display_manager : Raw.Display_manager.t
end

class display_manager : Raw.Display_manager.t -> display_manager_t
