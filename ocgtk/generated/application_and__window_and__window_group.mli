(** The classes of {!Ocgtk.Application}, {!Ocgtk.Window}, {!Ocgtk.Window_group},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GtkApplication]. *)
class type application_t = object
  inherit Ocgio.Application.application_t

  method on_query_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_window_added :
    ?after:bool ->
    callback:(window:window_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_window_removed :
    ?after:bool ->
    callback:(window:window_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_window : window_t -> unit
  method get_accels_for_action : string -> string array
  method get_actions_for_accel : string -> string array
  method get_active_window : unit -> window_t option
  method get_menu_by_id : string -> Ocgio.Menu.menu_t option
  method get_menubar : unit -> Ocgio.Menu_model.menu_model_t option
  method get_window_by_id : int -> window_t option
  method get_windows : unit -> window_t list

  method inhibit :
    window_t option -> Enums.applicationinhibitflags -> string option -> int

  method list_action_descriptions : unit -> string array
  method remove_window : window_t -> unit
  method set_accels_for_action : string -> string array -> unit
  method set_menubar : Ocgio.Menu_model.menu_model_t option -> unit
  method uninhibit : int -> unit
  method register_session : bool
  method set_register_session : bool -> unit
  method screensaver_active : bool
end

(** The methods, signals and properties of a [GtkWindow]. *)
and window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t

  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .root_t

  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_activate_focus :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_close_request :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_enable_debugging :
    ?after:bool ->
    callback:(toggle:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_keys_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method close : unit -> unit
  method destroy : unit -> unit
  method fullscreen : unit -> unit
  method fullscreen_on_monitor : Ocgdk.Monitor.monitor_t -> unit
  method get_application : unit -> application_t option

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_decorated : unit -> bool

  method get_default_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_deletable : unit -> bool
  method get_destroy_with_parent : unit -> bool
  method get_focus_visible : unit -> bool
  method get_gravity : unit -> Enums.windowgravity
  method get_group : unit -> window_group_t
  method get_handle_menubar_accel : unit -> bool
  method get_hide_on_close : unit -> bool
  method get_icon_name : unit -> string option
  method get_mnemonics_visible : unit -> bool
  method get_modal : unit -> bool
  method get_resizable : unit -> bool
  method get_title : unit -> string option

  method get_titlebar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_transient_for : unit -> window_t option
  method has_group : unit -> bool
  method is_active : unit -> bool
  method is_fullscreen : unit -> bool
  method is_maximized : unit -> bool
  method is_suspended : unit -> bool
  method maximize : unit -> unit
  method minimize : unit -> unit
  method present : unit -> unit
  method present_with_time : UInt32.t -> unit
  method set_application : application_t option -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_decorated : bool -> unit
  method set_default_size : int -> int -> unit

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_deletable : bool -> unit
  method set_destroy_with_parent : bool -> unit
  method set_display : Ocgdk.Display.display_t -> unit
  method set_focus_visible : bool -> unit
  method set_gravity : Enums.windowgravity -> unit
  method set_handle_menubar_accel : bool -> unit
  method set_hide_on_close : bool -> unit
  method set_icon_name : string option -> unit
  method set_mnemonics_visible : bool -> unit
  method set_modal : bool -> unit
  method set_resizable : bool -> unit
  method set_startup_id : string -> unit
  method set_title : string option -> unit

  method set_titlebar :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_transient_for : window_t option -> unit
  method unfullscreen : unit -> unit
  method unmaximize : unit -> unit
  method unminimize : unit -> unit
  method default_height : int
  method set_default_height : int -> unit
  method default_width : int
  method set_default_width : int -> unit
  method as_window : Raw.Window.t
end

(** The methods, signals and properties of a [GtkWindowGroup]. *)
and window_group_t = object
  method add_window : window_t -> unit
  method list_windows : unit -> window_t list
  method remove_window : window_t -> unit
  method as_window_group : Raw.Window_group.t
end

(** Wraps a layer 1 handle, {!Ocgtk.Raw.Application.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkApplication], give one already wrapped. *)
class application : Raw.Application.t -> application_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Window.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkWindow], give one already wrapped. *)

and window : Raw.Window.t -> window_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Window_group.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkWindowGroup], give one already wrapped. *)

and window_group : Raw.Window_group.t -> window_group_t

val new_ : unit -> window_t
val new_ : string option -> Ocgio.Enums.applicationflags -> application_t
val new_ : unit -> window_group_t
