class type d_bus_object_manager_t = object
  method on_interface_added :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:GD_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_interface_removed :
    ?after:bool ->
    callback:
      (object_:GD_bus_interface_and__d_bus_object.d_bus_object_t ->
      interface:GD_bus_interface_and__d_bus_object.d_bus_interface_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_added :
    ?after:bool ->
    callback:(object_:GD_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_object_removed :
    ?after:bool ->
    callback:(object_:GD_bus_interface_and__d_bus_object.d_bus_object_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_interface :
    string ->
    string ->
    GD_bus_interface_and__d_bus_object.d_bus_interface_t option

  method get_object :
    string -> GD_bus_interface_and__d_bus_object.d_bus_object_t option

  method get_object_path : unit -> string

  method get_objects :
    unit -> GD_bus_interface_and__d_bus_object.d_bus_object_t list

  method as_d_bus_object_manager : D_bus_object_manager.t
end

(* High-level class for DBusObjectManager *)
class d_bus_object_manager (obj : D_bus_object_manager.t) :
  d_bus_object_manager_t =
  object (self)
    method on_interface_added ?(after = false) ~callback () =
      D_bus_object_manager.on_interface_added ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ~interface ->
          callback
            ~object_:
              (new GD_bus_interface_and__d_bus_object.d_bus_object object_)
            ~interface:
              (new GD_bus_interface_and__d_bus_object.d_bus_interface interface))

    method on_interface_removed ?(after = false) ~callback () =
      D_bus_object_manager.on_interface_removed ~after
        self#as_d_bus_object_manager ~callback:(fun ~object_ ~interface ->
          callback
            ~object_:
              (new GD_bus_interface_and__d_bus_object.d_bus_object object_)
            ~interface:
              (new GD_bus_interface_and__d_bus_object.d_bus_interface interface))

    method on_object_added ?(after = false) ~callback () =
      D_bus_object_manager.on_object_added ~after self#as_d_bus_object_manager
        ~callback:(fun ~object_ ->
          callback
            ~object_:
              (new GD_bus_interface_and__d_bus_object.d_bus_object object_))

    method on_object_removed ?(after = false) ~callback () =
      D_bus_object_manager.on_object_removed ~after self#as_d_bus_object_manager
        ~callback:(fun ~object_ ->
          callback
            ~object_:
              (new GD_bus_interface_and__d_bus_object.d_bus_object object_))

    method get_interface :
        string ->
        string ->
        GD_bus_interface_and__d_bus_object.d_bus_interface_t option =
      fun object_path interface_name ->
        Option.map
          (fun ret ->
            new GD_bus_interface_and__d_bus_object.d_bus_interface ret)
          (D_bus_object_manager.get_interface obj object_path interface_name)

    method get_object :
        string -> GD_bus_interface_and__d_bus_object.d_bus_object_t option =
      fun object_path ->
        Option.map
          (fun ret -> new GD_bus_interface_and__d_bus_object.d_bus_object ret)
          (D_bus_object_manager.get_object obj object_path)

    method get_object_path : unit -> string =
      fun () -> D_bus_object_manager.get_object_path obj

    method get_objects :
        unit -> GD_bus_interface_and__d_bus_object.d_bus_object_t list =
      fun () ->
        (List.map (fun ret ->
             new GD_bus_interface_and__d_bus_object.d_bus_object ret))
          (D_bus_object_manager.get_objects obj)

    method as_d_bus_object_manager = obj
  end
