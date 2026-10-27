(** A freestanding toplevel surface.

    The [GdkToplevel] interface provides useful APIs for interacting with the
    windowing system, such as controlling maximization and size of the surface,
    setting icons and transient parents for dialogs.

    Its methods, signals and properties are on {!class-type-toplevel_t}. The
    functions it is built on are in {!Ocgdk.Raw.Toplevel}. *)

(** The methods, signals and properties of a [GdkToplevel]. *)
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

class toplevel : Raw.Toplevel.t -> toplevel_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Toplevel.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkToplevel], give one already wrapped. *)
