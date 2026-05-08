class type display_manager_t = object
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

(* High-level class for DisplayManager *)
class display_manager (obj : Display_manager.t) : display_manager_t =
  object (self)
    method get_default_display :
        unit -> GApp_launch_context_cycle_de440b34.display_t option =
      fun () ->
        Option.map
          (fun ret -> new GApp_launch_context_cycle_de440b34.display ret)
          (Display_manager.get_default_display obj)

    method list_displays :
        unit -> GApp_launch_context_cycle_de440b34.display_t list =
      fun () ->
        (List.map (fun ret ->
             new GApp_launch_context_cycle_de440b34.display ret))
          (Display_manager.list_displays obj)

    method open_display :
        string option -> GApp_launch_context_cycle_de440b34.display_t option =
      fun name ->
        Option.map
          (fun ret -> new GApp_launch_context_cycle_de440b34.display ret)
          (Display_manager.open_display obj name)

    method set_default_display :
        GApp_launch_context_cycle_de440b34.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Display_manager.set_default_display obj display

    method as_display_manager = obj
  end
