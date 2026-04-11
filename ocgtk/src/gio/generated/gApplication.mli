class type application_t = object
  inherit GAction_group.action_group_t
  inherit GAction_map.action_map_t
  inherit Gapplication_signals.application_signals
  method activate : unit -> unit
  method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method get_application_id : unit -> string option

  method get_dbus_connection :
    unit -> GD_bus_connection.d_bus_connection_t option

  method get_dbus_object_path : unit -> string option
  method get_flags : unit -> Gio_enums.applicationflags
  method get_inactivity_timeout : unit -> int
  method get_is_busy : unit -> bool
  method get_is_registered : unit -> bool
  method get_is_remote : unit -> bool
  method get_resource_base_path : unit -> string option
  method get_version : unit -> string option
  method hold : unit -> unit
  method mark_busy : unit -> unit

  method open_ :
    File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t
    array ->
    int ->
    string ->
    unit

  method quit : unit -> unit
  method register : GCancellable.cancellable_t option -> (bool, GError.t) result
  method release : unit -> unit
  method run : int -> string array option -> int

  method send_notification :
    string option -> GNotification.notification_t -> unit

  method set_action_group : GAction_group.action_group_t option -> unit
  method set_application_id : string option -> unit
  method set_default : unit -> unit
  method set_flags : Gio_enums.applicationflags -> unit
  method set_inactivity_timeout : int -> unit
  method set_option_context_description : string option -> unit
  method set_option_context_parameter_string : string option -> unit
  method set_option_context_summary : string option -> unit
  method set_resource_base_path : string option -> unit
  method set_version : string -> unit
  method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method unmark_busy : unit -> unit
  method withdraw_notification : string -> unit
  method as_application : Application.t
end

class application : Application.t -> application_t

val new_ : string option -> Gio_enums.applicationflags -> application_t
