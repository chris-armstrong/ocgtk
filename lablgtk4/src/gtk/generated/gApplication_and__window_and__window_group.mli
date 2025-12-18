class application : Application_and__window_and__window_group.Application.t ->
  object
    inherit Gapplication_signals.application_signals
    method register_session : bool
    method set_register_session : bool -> unit
    method screensaver_active : bool
    method add_window : <as_window: Application_and__window_and__window_group.Window.t; ..> -> unit
    method get_accels_for_action : string -> unit
    method get_actions_for_accel : string -> unit
    method get_active_window : unit -> window option
    method get_window_by_id : int -> window option
    method inhibit : <as_window: Application_and__window_and__window_group.Window.t; ..> option -> Gtk_enums.applicationinhibitflags -> string option -> int
    method list_action_descriptions : unit -> unit
    method remove_window : <as_window: Application_and__window_and__window_group.Window.t; ..> -> unit
    method uninhibit : int -> unit
    method as_application : Application_and__window_and__window_group.Application.t
  end

and window : Application_and__window_and__window_group.Window.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gwindow_signals.window_signals
    method decorated : bool
    method set_decorated : bool -> unit
    method default_height : int
    method set_default_height : int -> unit
    method default_width : int
    method set_default_width : int -> unit
    method deletable : bool
    method set_deletable : bool -> unit
    method destroy_with_parent : bool
    method set_destroy_with_parent : bool -> unit
    method focus_visible : bool
    method set_focus_visible : bool -> unit
    method fullscreened : bool
    method set_fullscreened : bool -> unit
    method handle_menubar_accel : bool
    method set_handle_menubar_accel : bool -> unit
    method hide_on_close : bool
    method set_hide_on_close : bool -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method is_active : bool
    method maximized : bool
    method set_maximized : bool -> unit
    method mnemonics_visible : bool
    method set_mnemonics_visible : bool -> unit
    method modal : bool
    method set_modal : bool -> unit
    method resizable : bool
    method set_resizable : bool -> unit
    method startup_id : string
    method set_startup_id : string -> unit
    method suspended : bool
    method title : string
    method set_title : string -> unit
    method close : unit -> unit
    method destroy : unit -> unit
    method fullscreen : unit -> unit
    method get_application : unit -> application option
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_default_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_focus : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_group : unit -> window_group
    method get_titlebar : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_transient_for : unit -> window option
    method has_group : unit -> bool
    method is_fullscreen : unit -> bool
    method is_maximized : unit -> bool
    method is_suspended : unit -> bool
    method maximize : unit -> unit
    method minimize : unit -> unit
    method present : unit -> unit
    method set_application : <as_application: Application_and__window_and__window_group.Application.t; ..> option -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_default_size : int -> int -> unit
    method set_default_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_focus : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_titlebar : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_transient_for : <as_window: Application_and__window_and__window_group.Window.t; ..> option -> unit
    method unfullscreen : unit -> unit
    method unmaximize : unit -> unit
    method unminimize : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_window : Application_and__window_and__window_group.Window.t
  end

and window_group : Application_and__window_and__window_group.Window_group.t ->
  object
    method add_window : <as_window: Application_and__window_and__window_group.Window.t; ..> -> unit
    method remove_window : <as_window: Application_and__window_and__window_group.Window.t; ..> -> unit
    method as_window_group : Application_and__window_and__window_group.Window_group.t
  end
