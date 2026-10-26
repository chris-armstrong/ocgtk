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

(* High-level class for Application *)
class application (obj : Raw.Application.t) : application_t =
  object (self)
    inherit Action_group.action_group (Raw.Action_group.from_gobject obj)
    inherit Action_map.action_map (Raw.Action_map.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Application.on_activate ~after self#as_application ~callback

    method on_command_line ?(after = false) ~callback () =
      Raw.Application.on_command_line ~after self#as_application
        ~callback:(fun ~command_line ->
          callback
            ~command_line:
              (new Application_command_line.application_command_line
                 command_line))

    method on_name_lost ?(after = false) ~callback () =
      Raw.Application.on_name_lost ~after self#as_application ~callback

    method on_shutdown ?(after = false) ~callback () =
      Raw.Application.on_shutdown ~after self#as_application ~callback

    method on_startup ?(after = false) ~callback () =
      Raw.Application.on_startup ~after self#as_application ~callback

    method activate : unit -> unit = fun () -> Raw.Application.activate obj

    method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit =
      fun object_ property ->
        Raw.Application.bind_busy_property obj object_ property

    method get_application_id : unit -> string option =
      fun () -> Raw.Application.get_application_id obj

    method get_dbus_connection :
        unit -> D_bus_connection.d_bus_connection_t option =
      fun () ->
        Option.map
          (fun ret -> new D_bus_connection.d_bus_connection ret)
          (Raw.Application.get_dbus_connection obj)

    method get_dbus_object_path : unit -> string option =
      fun () -> Raw.Application.get_dbus_object_path obj

    method get_flags : unit -> Enums.applicationflags =
      fun () -> Raw.Application.get_flags obj

    method get_inactivity_timeout : unit -> int =
      fun () -> Raw.Application.get_inactivity_timeout obj

    method get_is_busy : unit -> bool =
      fun () -> Raw.Application.get_is_busy obj

    method get_is_registered : unit -> bool =
      fun () -> Raw.Application.get_is_registered obj

    method get_is_remote : unit -> bool =
      fun () -> Raw.Application.get_is_remote obj

    method get_resource_base_path : unit -> string option =
      fun () -> Raw.Application.get_resource_base_path obj

    method get_version : unit -> string option =
      fun () -> Raw.Application.get_version obj

    method hold : unit -> unit = fun () -> Raw.Application.hold obj
    method mark_busy : unit -> unit = fun () -> Raw.Application.mark_busy obj

    method open_ : Raw.File.t array -> int -> string -> unit =
      fun files n_files hint -> Raw.Application.open_ obj files n_files hint

    method quit : unit -> unit = fun () -> Raw.Application.quit obj

    method register :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Application.register obj cancellable

    method release : unit -> unit = fun () -> Raw.Application.release obj

    method run : int -> string array option -> int =
      fun argc argv -> Raw.Application.run obj argc argv

    method send_notification :
        string option -> Notification.notification_t -> unit =
      fun id notification ->
        let notification = notification#as_notification in
        Raw.Application.send_notification obj id notification

    method set_action_group : Action_group.action_group_t option -> unit =
      fun action_group ->
        let action_group =
          Option.map (fun c -> c#as_action_group) action_group
        in
        Raw.Application.set_action_group obj action_group

    method set_application_id : string option -> unit =
      fun application_id ->
        Raw.Application.set_application_id obj application_id

    method set_default : unit -> unit =
      fun () -> Raw.Application.set_default obj

    method set_flags : Enums.applicationflags -> unit =
      fun flags -> Raw.Application.set_flags obj flags

    method set_inactivity_timeout : int -> unit =
      fun inactivity_timeout ->
        Raw.Application.set_inactivity_timeout obj inactivity_timeout

    method set_option_context_description : string option -> unit =
      fun description ->
        Raw.Application.set_option_context_description obj description

    method set_option_context_parameter_string : string option -> unit =
      fun parameter_string ->
        Raw.Application.set_option_context_parameter_string obj parameter_string

    method set_option_context_summary : string option -> unit =
      fun summary -> Raw.Application.set_option_context_summary obj summary

    method set_resource_base_path : string option -> unit =
      fun resource_path ->
        Raw.Application.set_resource_base_path obj resource_path

    method set_version : string -> unit =
      fun version -> Raw.Application.set_version obj version

    method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit =
      fun object_ property ->
        Raw.Application.unbind_busy_property obj object_ property

    method unmark_busy : unit -> unit =
      fun () -> Raw.Application.unmark_busy obj

    method withdraw_notification : string -> unit =
      fun id -> Raw.Application.withdraw_notification obj id

    method as_application = obj
  end

let new_ (application_id : string option) (flags : Enums.applicationflags) :
    application_t =
  let obj_ = Raw.Application.new_ application_id flags in
  new application obj_
