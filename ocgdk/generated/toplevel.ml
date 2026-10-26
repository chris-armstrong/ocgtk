class type toplevel_t = object
  method begin_move :
    App_launch_context_cycle_de440b34.device_t ->
    int ->
    float ->
    float ->
    UInt32.t ->
    unit

  method begin_resize :
    Enums.surfaceedge ->
    App_launch_context_cycle_de440b34.device_t option ->
    int ->
    float ->
    float ->
    UInt32.t ->
    unit

  method focus : UInt32.t -> unit
  method get_capabilities : unit -> Enums.toplevelcapabilities
  method get_gravity : unit -> Enums.gravity
  method get_state : unit -> Enums.toplevelstate

  method inhibit_system_shortcuts :
    App_launch_context_cycle_de440b34.event_t option -> unit

  method lower : unit -> bool
  method minimize : unit -> bool
  method present : Raw.Toplevel_layout.t -> unit
  method restore_system_shortcuts : unit -> unit
  method set_decorated : bool -> unit
  method set_deletable : bool -> unit
  method set_gravity : Enums.gravity -> unit
  method set_icon_list : Texture.texture_t list -> unit
  method set_modal : bool -> unit
  method set_startup_id : string -> unit
  method set_title : string -> unit
  method set_transient_for : App_launch_context_cycle_de440b34.surface_t -> unit
  method show_window_menu : App_launch_context_cycle_de440b34.event_t -> bool
  method supports_edge_constraints : unit -> bool
  method titlebar_gesture : Enums.titlebargesture -> bool
  method fullscreen_mode : Enums.fullscreenmode
  method set_fullscreen_mode : Enums.fullscreenmode -> unit
  method shortcuts_inhibited : bool
  method as_toplevel : Raw.Toplevel.t
end

(* High-level class for Toplevel *)
class toplevel (obj : Raw.Toplevel.t) : toplevel_t =
  object (self)
    method begin_move :
        App_launch_context_cycle_de440b34.device_t ->
        int ->
        float ->
        float ->
        UInt32.t ->
        unit =
      fun device button x y timestamp ->
        let device = device#as_device in
        Raw.Toplevel.begin_move obj device button x y timestamp

    method begin_resize :
        Enums.surfaceedge ->
        App_launch_context_cycle_de440b34.device_t option ->
        int ->
        float ->
        float ->
        UInt32.t ->
        unit =
      fun edge device button x y timestamp ->
        let device = Option.map (fun c -> c#as_device) device in
        Raw.Toplevel.begin_resize obj edge device button x y timestamp

    method focus : UInt32.t -> unit =
      fun timestamp -> Raw.Toplevel.focus obj timestamp

    method get_capabilities : unit -> Enums.toplevelcapabilities =
      fun () -> Raw.Toplevel.get_capabilities obj

    method get_gravity : unit -> Enums.gravity =
      fun () -> Raw.Toplevel.get_gravity obj

    method get_state : unit -> Enums.toplevelstate =
      fun () -> Raw.Toplevel.get_state obj

    method inhibit_system_shortcuts :
        App_launch_context_cycle_de440b34.event_t option -> unit =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Raw.Toplevel.inhibit_system_shortcuts obj event

    method lower : unit -> bool = fun () -> Raw.Toplevel.lower obj
    method minimize : unit -> bool = fun () -> Raw.Toplevel.minimize obj

    method present : Raw.Toplevel_layout.t -> unit =
      fun layout -> Raw.Toplevel.present obj layout

    method restore_system_shortcuts : unit -> unit =
      fun () -> Raw.Toplevel.restore_system_shortcuts obj

    method set_decorated : bool -> unit =
      fun decorated -> Raw.Toplevel.set_decorated obj decorated

    method set_deletable : bool -> unit =
      fun deletable -> Raw.Toplevel.set_deletable obj deletable

    method set_gravity : Enums.gravity -> unit =
      fun gravity -> Raw.Toplevel.set_gravity obj gravity

    method set_icon_list : Texture.texture_t list -> unit =
      fun surfaces ->
        let surfaces = (List.map (fun c -> c#as_texture)) surfaces in
        Raw.Toplevel.set_icon_list obj surfaces

    method set_modal : bool -> unit =
      fun modal -> Raw.Toplevel.set_modal obj modal

    method set_startup_id : string -> unit =
      fun startup_id -> Raw.Toplevel.set_startup_id obj startup_id

    method set_title : string -> unit =
      fun title -> Raw.Toplevel.set_title obj title

    method set_transient_for :
        App_launch_context_cycle_de440b34.surface_t -> unit =
      fun parent ->
        let parent = parent#as_surface in
        Raw.Toplevel.set_transient_for obj parent

    method show_window_menu : App_launch_context_cycle_de440b34.event_t -> bool
        =
      fun event ->
        let event = event#as_event in
        Raw.Toplevel.show_window_menu obj event

    method supports_edge_constraints : unit -> bool =
      fun () -> Raw.Toplevel.supports_edge_constraints obj

    method titlebar_gesture : Enums.titlebargesture -> bool =
      fun gesture -> Raw.Toplevel.titlebar_gesture obj gesture

    method fullscreen_mode = Raw.Toplevel.get_fullscreen_mode obj
    method set_fullscreen_mode v = Raw.Toplevel.set_fullscreen_mode obj v
    method shortcuts_inhibited = Raw.Toplevel.get_shortcuts_inhibited obj
    method as_toplevel = obj
  end
