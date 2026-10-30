class type d_bus_object_manager_t = object
  (** {2:signals Signals} *)

  method on_interface_added :
    ?after:bool ->
    callback:
      (object_:D_bus_object.d_bus_object_t ->
      interface:D_bus_interface.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is added to [object].

      This signal exists purely as a convenience to avoid having to connect
      signals to all objects managed by [manager]. *)

  method on_interface_removed :
    ?after:bool ->
    callback:
      (object_:D_bus_object.d_bus_object_t ->
      interface:D_bus_interface.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] has been removed from [object].

      This signal exists purely as a convenience to avoid having to connect
      signals to all objects managed by [manager]. *)

  method on_object_added :
    ?after:bool ->
    callback:(object_:D_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [object] is added to [manager]. *)

  method on_object_removed :
    ?after:bool ->
    callback:(object_:D_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [object] is removed from [manager]. *)

  (** {2:methods Methods} *)

  method get_interface :
    string -> string -> D_bus_interface.d_bus_interface_t option
  (** Gets the interface proxy for [interface_name] at [object_path], if any. *)

  method get_object : string -> D_bus_object.d_bus_object_t option
  (** Gets the [GDBusObject] at [object_path], if any. *)

  method get_object_path : unit -> string
  (** Gets the object path that [manager] is for. *)

  method get_objects : unit -> D_bus_object.d_bus_object_t list
  (** Gets all [GDBusObject] objects known to [manager]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_object_manager : Raw.D_bus_object_manager.t
end

(* High-level class for DBusObjectManager *)
class d_bus_object_manager (obj : Raw.D_bus_object_manager.t) :
  d_bus_object_manager_t =
  object (self)
    method on_interface_added ?(after = false) ~callback () =
      Raw.D_bus_object_manager.on_interface_added ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ~interface ->
          callback
            ~object_:(new D_bus_object.d_bus_object object_)
            ~interface:(new D_bus_interface.d_bus_interface interface))

    method on_interface_removed ?(after = false) ~callback () =
      Raw.D_bus_object_manager.on_interface_removed ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ~interface ->
          callback
            ~object_:(new D_bus_object.d_bus_object object_)
            ~interface:(new D_bus_interface.d_bus_interface interface))

    method on_object_added ?(after = false) ~callback () =
      Raw.D_bus_object_manager.on_object_added ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ->
          callback ~object_:(new D_bus_object.d_bus_object object_))

    method on_object_removed ?(after = false) ~callback () =
      Raw.D_bus_object_manager.on_object_removed ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ->
          callback ~object_:(new D_bus_object.d_bus_object object_))

    method get_interface :
        string -> string -> D_bus_interface.d_bus_interface_t option =
      fun object_path interface_name ->
        Option.map
          (fun ret -> new D_bus_interface.d_bus_interface ret)
          (Raw.D_bus_object_manager.get_interface obj object_path interface_name)

    method get_object : string -> D_bus_object.d_bus_object_t option =
      fun object_path ->
        Option.map
          (fun ret -> new D_bus_object.d_bus_object ret)
          (Raw.D_bus_object_manager.get_object obj object_path)

    method get_object_path : unit -> string =
      fun () -> Raw.D_bus_object_manager.get_object_path obj

    method get_objects : unit -> D_bus_object.d_bus_object_t list =
      fun () ->
        (List.map (fun ret -> new D_bus_object.d_bus_object ret))
          (Raw.D_bus_object_manager.get_objects obj)

    method as_d_bus_object_manager = obj
  end
