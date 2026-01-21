(* Signal class defined in gapplication_signals.ml *)

(* High-level class for Application *)
class application (obj : Application.t) = object (self)
  inherit Gapplication_signals.application_signals obj

  method activate : unit -> unit =
    fun () ->
      (Application.activate obj)

  method get_application_id : unit -> string option =
    fun () ->
      (Application.get_application_id obj)

  method get_dbus_connection : unit -> GD_bus_connection.d_bus_connection option =
    fun () ->
      Option.map (fun ret -> new GD_bus_connection.d_bus_connection ret) (Application.get_dbus_connection obj)

  method get_dbus_object_path : unit -> string option =
    fun () ->
      (Application.get_dbus_object_path obj)

  method get_flags : unit -> Gio_enums.applicationflags =
    fun () ->
      (Application.get_flags obj)

  method get_inactivity_timeout : unit -> int =
    fun () ->
      (Application.get_inactivity_timeout obj)

  method get_is_busy : unit -> bool =
    fun () ->
      (Application.get_is_busy obj)

  method get_is_registered : unit -> bool =
    fun () ->
      (Application.get_is_registered obj)

  method get_is_remote : unit -> bool =
    fun () ->
      (Application.get_is_remote obj)

  method get_resource_base_path : unit -> string option =
    fun () ->
      (Application.get_resource_base_path obj)

  method get_version : unit -> string option =
    fun () ->
      (Application.get_version obj)

  method hold : unit -> unit =
    fun () ->
      (Application.hold obj)

  method mark_busy : unit -> unit =
    fun () ->
      (Application.mark_busy obj)

  method open_ : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t array -> int -> string -> unit =
    fun files n_files hint ->
      (Application.open_ obj files n_files hint)

  method quit : unit -> unit =
    fun () ->
      (Application.quit obj)

  method register : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Application.register obj cancellable)

  method release : unit -> unit =
    fun () ->
      (Application.release obj)

  method send_notification : 'p1. string option -> (#GNotification.notification as 'p1) -> unit =
    fun id notification ->
      let notification = notification#as_notification in
      (Application.send_notification obj id notification)

  method set_application_id : string option -> unit =
    fun application_id ->
      (Application.set_application_id obj application_id)

  method set_default : unit -> unit =
    fun () ->
      (Application.set_default obj)

  method set_flags : Gio_enums.applicationflags -> unit =
    fun flags ->
      (Application.set_flags obj flags)

  method set_inactivity_timeout : int -> unit =
    fun inactivity_timeout ->
      (Application.set_inactivity_timeout obj inactivity_timeout)

  method set_option_context_description : string option -> unit =
    fun description ->
      (Application.set_option_context_description obj description)

  method set_option_context_parameter_string : string option -> unit =
    fun parameter_string ->
      (Application.set_option_context_parameter_string obj parameter_string)

  method set_option_context_summary : string option -> unit =
    fun summary ->
      (Application.set_option_context_summary obj summary)

  method set_resource_base_path : string option -> unit =
    fun resource_path ->
      (Application.set_resource_base_path obj resource_path)

  method set_version : string -> unit =
    fun version ->
      (Application.set_version obj version)

  method unmark_busy : unit -> unit =
    fun () ->
      (Application.unmark_busy obj)

  method withdraw_notification : string -> unit =
    fun id ->
      (Application.withdraw_notification obj id)

    method as_application = obj
end

