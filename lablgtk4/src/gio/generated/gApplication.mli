class application : Application.t ->
  object
    inherit Gapplication_signals.application_signals
    method activate : unit -> unit
    method get_application_id : unit -> string option
    method get_dbus_connection : unit -> GD_bus_connection.d_bus_connection option
    method get_dbus_object_path : unit -> string option
    method get_inactivity_timeout : unit -> int
    method get_is_busy : unit -> bool
    method get_is_registered : unit -> bool
    method get_is_remote : unit -> bool
    method get_resource_base_path : unit -> string option
    method get_version : unit -> string option
    method hold : unit -> unit
    method mark_busy : unit -> unit
    method quit : unit -> unit
    method register : #GCancellable.cancellable option -> (bool, GError.t) result
    method release : unit -> unit
    method send_notification : string option -> #GNotification.notification -> unit
    method set_application_id : string option -> unit
    method set_default : unit -> unit
    method set_inactivity_timeout : int -> unit
    method set_option_context_description : string option -> unit
    method set_option_context_parameter_string : string option -> unit
    method set_option_context_summary : string option -> unit
    method set_resource_base_path : string option -> unit
    method set_version : string -> unit
    method unmark_busy : unit -> unit
    method withdraw_notification : string -> unit
    method as_application : Application.t
  end

