(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type d_bus_interface_t = object
  method dup_object : unit -> d_bus_object_t option
  (** Gets the [GDBusObject] that [interface_] belongs to, if any. *)

  method get_info : unit -> Raw.D_bus_interface_info.t
  (** Gets D-Bus introspection information for the D-Bus interface implemented
      by [interface_]. *)

  method set_object : d_bus_object_t option -> unit
  (** Sets the [GDBusObject] for [interface_] to [object].

      Note that [interface_] will hold a weak reference to [object]. *)

  method as_d_bus_interface : Raw.D_bus_interface.t
end

and d_bus_object_t = object
  method on_interface_added :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is added to [object]. *)

  method on_interface_removed :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [interface] is removed from [object]. *)

  method get_interface : string -> d_bus_interface_t option
  (** Gets the D-Bus interface with name [interface_name] associated with
      [object], if any. *)

  method get_interfaces : unit -> d_bus_interface_t list
  (** Gets the D-Bus interfaces associated with [object]. *)

  method get_object_path : unit -> string
  (** Gets the object path for [object]. *)

  method as_d_bus_object : Raw.D_bus_object.t
end

class d_bus_interface (obj : Raw.D_bus_interface.t) : d_bus_interface_t =
  object (self)
    method dup_object : unit -> d_bus_object_t option =
      fun () ->
        Option.map
          (fun ret -> new d_bus_object ret)
          (Raw.D_bus_interface.dup_object obj)

    method get_info : unit -> Raw.D_bus_interface_info.t =
      fun () -> Raw.D_bus_interface.get_info obj

    method set_object : d_bus_object_t option -> unit =
      fun object_ ->
        let object_ = Option.map (fun c -> c#as_d_bus_object) object_ in
        Raw.D_bus_interface.set_object obj object_

    method as_d_bus_interface = obj
  end

and d_bus_object (obj : Raw.D_bus_object.t) : d_bus_object_t =
  object (self)
    method on_interface_added ?(after = false) ~callback () =
      Raw.D_bus_object.on_interface_added ~after self#as_d_bus_object
        ~callback:(fun ~interface ->
          callback ~interface:(new d_bus_interface interface))

    method on_interface_removed ?(after = false) ~callback () =
      Raw.D_bus_object.on_interface_removed ~after self#as_d_bus_object
        ~callback:(fun ~interface ->
          callback ~interface:(new d_bus_interface interface))

    method get_interface : string -> d_bus_interface_t option =
      fun interface_name ->
        Option.map
          (fun ret -> new d_bus_interface ret)
          (Raw.D_bus_object.get_interface obj interface_name)

    method get_interfaces : unit -> d_bus_interface_t list =
      fun () ->
        (List.map (fun ret -> new d_bus_interface ret))
          (Raw.D_bus_object.get_interfaces obj)

    method get_object_path : unit -> string =
      fun () -> Raw.D_bus_object.get_object_path obj

    method as_d_bus_object = obj
  end
