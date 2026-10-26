(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

and window_group_t = object
  method add_window : window_t -> unit
  method list_windows : unit -> window_t list
  method remove_window : window_t -> unit
  method as_window_group : Raw.Window_group.t
end

class application (obj : Raw.Application.t) : application_t =
  object (self)
    inherit Ocgio.Application.application (obj :> Ocgio.Raw.Application.t)

    method on_query_end ?(after = false) ~callback () =
      Raw.Application.on_query_end ~after self#as_application ~callback

    method on_window_added ?(after = false) ~callback () =
      Raw.Application.on_window_added ~after self#as_application
        ~callback:(fun ~window -> callback ~window:(new window window))

    method on_window_removed ?(after = false) ~callback () =
      Raw.Application.on_window_removed ~after self#as_application
        ~callback:(fun ~window -> callback ~window:(new window window))

    method add_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Application.add_window obj window

    method get_accels_for_action : string -> string array =
      fun detailed_action_name ->
        Raw.Application.get_accels_for_action obj detailed_action_name

    method get_actions_for_accel : string -> string array =
      fun accel -> Raw.Application.get_actions_for_accel obj accel

    method get_active_window : unit -> window_t option =
      fun () ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Application.get_active_window obj)

    method get_menu_by_id : string -> Ocgio.Menu.menu_t option =
      fun id ->
        Option.map
          (fun ret -> new Ocgio.Menu.menu ret)
          (Raw.Application.get_menu_by_id obj id)

    method get_menubar : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Application.get_menubar obj)

    method get_window_by_id : int -> window_t option =
      fun id ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Application.get_window_by_id obj id)

    method get_windows : unit -> window_t list =
      fun () ->
        (List.map (fun ret -> new window ret)) (Raw.Application.get_windows obj)

    method inhibit :
        window_t option -> Enums.applicationinhibitflags -> string option -> int
        =
      fun window flags reason ->
        let window = Option.map (fun c -> c#as_window) window in
        Raw.Application.inhibit obj window flags reason

    method list_action_descriptions : unit -> string array =
      fun () -> Raw.Application.list_action_descriptions obj

    method remove_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Application.remove_window obj window

    method set_accels_for_action : string -> string array -> unit =
      fun detailed_action_name accels ->
        Raw.Application.set_accels_for_action obj detailed_action_name accels

    method set_menubar : Ocgio.Menu_model.menu_model_t option -> unit =
      fun menubar ->
        let menubar = Option.map (fun c -> c#as_menu_model) menubar in
        Raw.Application.set_menubar obj menubar

    method uninhibit : int -> unit =
      fun cookie -> Raw.Application.uninhibit obj cookie

    method register_session = Raw.Application.get_register_session obj
    method set_register_session v = Raw.Application.set_register_session obj v
    method screensaver_active = Raw.Application.get_screensaver_active obj
  end

and window (obj : Raw.Window.t) : window_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Native.native (Raw.Native.from_gobject obj)

    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .root
        (Raw.Root.from_gobject obj)

    inherit
      Shortcut_manager.shortcut_manager (Raw.Shortcut_manager.from_gobject obj)

    method on_activate_default ?(after = false) ~callback () =
      Raw.Window.on_activate_default ~after self#as_window ~callback

    method on_activate_focus ?(after = false) ~callback () =
      Raw.Window.on_activate_focus ~after self#as_window ~callback

    method on_close_request ?(after = false) ~callback () =
      Raw.Window.on_close_request ~after self#as_window ~callback

    method on_enable_debugging ?(after = false) ~callback () =
      Raw.Window.on_enable_debugging ~after self#as_window ~callback

    method on_keys_changed ?(after = false) ~callback () =
      Raw.Window.on_keys_changed ~after self#as_window ~callback

    method close : unit -> unit = fun () -> Raw.Window.close obj
    method destroy : unit -> unit = fun () -> Raw.Window.destroy obj
    method fullscreen : unit -> unit = fun () -> Raw.Window.fullscreen obj

    method fullscreen_on_monitor : Ocgdk.Monitor.monitor_t -> unit =
      fun monitor ->
        let monitor = monitor#as_monitor in
        Raw.Window.fullscreen_on_monitor obj monitor

    method get_application : unit -> application_t option =
      fun () ->
        Option.map
          (fun ret -> new application ret)
          (Raw.Window.get_application obj)

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_child obj)

    method get_decorated : unit -> bool = fun () -> Raw.Window.get_decorated obj

    method get_default_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_default_widget obj)

    method get_deletable : unit -> bool = fun () -> Raw.Window.get_deletable obj

    method get_destroy_with_parent : unit -> bool =
      fun () -> Raw.Window.get_destroy_with_parent obj

    method get_focus_visible : unit -> bool =
      fun () -> Raw.Window.get_focus_visible obj

    method get_gravity : unit -> Enums.windowgravity =
      fun () -> Raw.Window.get_gravity obj

    method get_group : unit -> window_group_t =
      fun () -> new window_group (Raw.Window.get_group obj)

    method get_handle_menubar_accel : unit -> bool =
      fun () -> Raw.Window.get_handle_menubar_accel obj

    method get_hide_on_close : unit -> bool =
      fun () -> Raw.Window.get_hide_on_close obj

    method get_icon_name : unit -> string option =
      fun () -> Raw.Window.get_icon_name obj

    method get_mnemonics_visible : unit -> bool =
      fun () -> Raw.Window.get_mnemonics_visible obj

    method get_modal : unit -> bool = fun () -> Raw.Window.get_modal obj
    method get_resizable : unit -> bool = fun () -> Raw.Window.get_resizable obj

    method get_title : unit -> string option =
      fun () -> Raw.Window.get_title obj

    method get_titlebar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_titlebar obj)

    method get_transient_for : unit -> window_t option =
      fun () ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Window.get_transient_for obj)

    method has_group : unit -> bool = fun () -> Raw.Window.has_group obj
    method is_active : unit -> bool = fun () -> Raw.Window.is_active obj
    method is_fullscreen : unit -> bool = fun () -> Raw.Window.is_fullscreen obj
    method is_maximized : unit -> bool = fun () -> Raw.Window.is_maximized obj
    method is_suspended : unit -> bool = fun () -> Raw.Window.is_suspended obj
    method maximize : unit -> unit = fun () -> Raw.Window.maximize obj
    method minimize : unit -> unit = fun () -> Raw.Window.minimize obj
    method present : unit -> unit = fun () -> Raw.Window.present obj

    method present_with_time : UInt32.t -> unit =
      fun timestamp -> Raw.Window.present_with_time obj timestamp

    method set_application : application_t option -> unit =
      fun application ->
        let application = Option.map (fun c -> c#as_application) application in
        Raw.Window.set_application obj application

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Window.set_child obj child

    method set_decorated : bool -> unit =
      fun setting -> Raw.Window.set_decorated obj setting

    method set_default_size : int -> int -> unit =
      fun width height -> Raw.Window.set_default_size obj width height

    method set_default_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun default_widget ->
        let default_widget = Option.map (fun c -> c#as_widget) default_widget in
        Raw.Window.set_default_widget obj default_widget

    method set_deletable : bool -> unit =
      fun setting -> Raw.Window.set_deletable obj setting

    method set_destroy_with_parent : bool -> unit =
      fun setting -> Raw.Window.set_destroy_with_parent obj setting

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Window.set_display obj display

    method set_focus_visible : bool -> unit =
      fun setting -> Raw.Window.set_focus_visible obj setting

    method set_gravity : Enums.windowgravity -> unit =
      fun gravity -> Raw.Window.set_gravity obj gravity

    method set_handle_menubar_accel : bool -> unit =
      fun handle_menubar_accel ->
        Raw.Window.set_handle_menubar_accel obj handle_menubar_accel

    method set_hide_on_close : bool -> unit =
      fun setting -> Raw.Window.set_hide_on_close obj setting

    method set_icon_name : string option -> unit =
      fun name -> Raw.Window.set_icon_name obj name

    method set_mnemonics_visible : bool -> unit =
      fun setting -> Raw.Window.set_mnemonics_visible obj setting

    method set_modal : bool -> unit =
      fun modal -> Raw.Window.set_modal obj modal

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Window.set_resizable obj resizable

    method set_startup_id : string -> unit =
      fun startup_id -> Raw.Window.set_startup_id obj startup_id

    method set_title : string option -> unit =
      fun title -> Raw.Window.set_title obj title

    method set_titlebar :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun titlebar ->
        let titlebar = Option.map (fun c -> c#as_widget) titlebar in
        Raw.Window.set_titlebar obj titlebar

    method set_transient_for : window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Window.set_transient_for obj parent

    method unfullscreen : unit -> unit = fun () -> Raw.Window.unfullscreen obj
    method unmaximize : unit -> unit = fun () -> Raw.Window.unmaximize obj
    method unminimize : unit -> unit = fun () -> Raw.Window.unminimize obj
    method default_height = Raw.Window.get_default_height obj
    method set_default_height v = Raw.Window.set_default_height obj v
    method default_width = Raw.Window.get_default_width obj
    method set_default_width v = Raw.Window.set_default_width obj v
    method as_window = obj
  end

and window_group (obj : Raw.Window_group.t) : window_group_t =
  object (self)
    method add_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Window_group.add_window obj window

    method list_windows : unit -> window_t list =
      fun () ->
        (List.map (fun ret -> new window ret))
          (Raw.Window_group.list_windows obj)

    method remove_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Window_group.remove_window obj window

    method as_window_group = obj
  end

let new_ () : window_t = new window (Raw.Window.new_ ())

let new_ (application_id : string option) (flags : Ocgio.Enums.applicationflags)
    : application_t =
  let obj_ = Raw.Application.new_ application_id flags in
  new application obj_

let new_ () : window_group_t = new window_group (Raw.Window_group.new_ ())
