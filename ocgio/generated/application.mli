class type application_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_command_line :
    ?after:bool ->
    callback:
      (command_line:Application_command_line.application_command_line_t -> int) ->
    unit ->
    Gobject.Signal.handler_id

  method on_name_lost :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_shutdown :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_startup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method activate : unit -> unit
  method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method get_application_id : unit -> string option

  method get_dbus_connection :
    unit -> D_bus_connection.d_bus_connection_t option

  method get_dbus_object_path : unit -> string option
  method get_flags : unit -> Enums.applicationflags
  method get_inactivity_timeout : unit -> int
  method get_is_busy : unit -> bool
  method get_is_registered : unit -> bool
  method get_is_remote : unit -> bool
  method get_resource_base_path : unit -> string option
  method get_version : unit -> string option
  method hold : unit -> unit
  method mark_busy : unit -> unit
  method open_ : Raw.File.t array -> int -> string -> unit
  method quit : unit -> unit
  method register : Cancellable.cancellable_t option -> (bool, GError.t) result
  method release : unit -> unit
  method run : int -> string array option -> int

  method send_notification :
    string option -> Notification.notification_t -> unit

  method set_action_group : Action_group.action_group_t option -> unit
  method set_application_id : string option -> unit
  method set_default : unit -> unit
  method set_flags : Enums.applicationflags -> unit
  method set_inactivity_timeout : int -> unit
  method set_option_context_description : string option -> unit
  method set_option_context_parameter_string : string option -> unit
  method set_option_context_summary : string option -> unit
  method set_resource_base_path : string option -> unit
  method set_version : string -> unit
  method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method unmark_busy : unit -> unit
  method withdraw_notification : string -> unit
  method as_application : Raw.Application.t
end

class application : Raw.Application.t -> application_t

val new_ : string option -> Enums.applicationflags -> application_t
