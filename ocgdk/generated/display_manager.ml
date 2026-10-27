class type display_manager_t = object
  method on_display_opened :
    ?after:bool ->
    callback:(display:App_launch_context_cycle_de440b34.display_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_default_display :
    unit -> App_launch_context_cycle_de440b34.display_t option
  (** Gets the default [GdkDisplay]. *)

  method list_displays :
    unit -> App_launch_context_cycle_de440b34.display_t list
  (** List all currently open displays. *)

  method open_display :
    string option -> App_launch_context_cycle_de440b34.display_t option
  (** Opens a display. *)

  method set_default_display :
    App_launch_context_cycle_de440b34.display_t -> unit
  (** Sets [display] as the default display. *)

  method as_display_manager : Raw.Display_manager.t
end

(* High-level class for DisplayManager *)
class display_manager (obj : Raw.Display_manager.t) : display_manager_t =
  object (self)
    method on_display_opened ?(after = false) ~callback () =
      Raw.Display_manager.on_display_opened ~after self#as_display_manager
        ~callback:(fun ~display ->
          callback
            ~display:(new App_launch_context_cycle_de440b34.display display))

    method get_default_display :
        unit -> App_launch_context_cycle_de440b34.display_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.display ret)
          (Raw.Display_manager.get_default_display obj)

    method list_displays :
        unit -> App_launch_context_cycle_de440b34.display_t list =
      fun () ->
        (List.map (fun ret -> new App_launch_context_cycle_de440b34.display ret))
          (Raw.Display_manager.list_displays obj)

    method open_display :
        string option -> App_launch_context_cycle_de440b34.display_t option =
      fun name ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.display ret)
          (Raw.Display_manager.open_display obj name)

    method set_default_display :
        App_launch_context_cycle_de440b34.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Display_manager.set_default_display obj display

    method as_display_manager = obj
  end
