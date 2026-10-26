class type drop_target_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drop :
    ?after:bool ->
    callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method get_actions : unit -> Ocgdk.Enums.dragaction
  method get_current_drop : unit -> Ocgdk.Drop.drop_t option
  method get_drop : unit -> Ocgdk.Drop.drop_t option
  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  method get_preload : unit -> bool
  method get_value : unit -> Gobject.Value.t option
  method reject : unit -> unit
  method set_actions : Ocgdk.Enums.dragaction -> unit
  method set_gtypes : Gobject.Type.t array option -> Gsize.t -> unit
  method set_preload : bool -> unit
  method as_drop_target : Raw.Drop_target.t
end

(* High-level class for DropTarget *)
class drop_target (obj : Raw.Drop_target.t) : drop_target_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method on_accept ?(after = false) ~callback () =
      Raw.Drop_target.on_accept ~after self#as_drop_target
        ~callback:(fun ~drop -> callback ~drop:(new Ocgdk.Drop.drop drop))

    method on_drop ?(after = false) ~callback () =
      Raw.Drop_target.on_drop ~after self#as_drop_target ~callback

    method on_enter ?(after = false) ~callback () =
      Raw.Drop_target.on_enter ~after self#as_drop_target ~callback

    method on_leave ?(after = false) ~callback () =
      Raw.Drop_target.on_leave ~after self#as_drop_target ~callback

    method on_motion ?(after = false) ~callback () =
      Raw.Drop_target.on_motion ~after self#as_drop_target ~callback

    method get_actions : unit -> Ocgdk.Enums.dragaction =
      fun () -> Raw.Drop_target.get_actions obj

    method get_current_drop : unit -> Ocgdk.Drop.drop_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Drop.drop ret)
          (Raw.Drop_target.get_current_drop obj)

    method get_drop : unit -> Ocgdk.Drop.drop_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Drop.drop ret)
          (Raw.Drop_target.get_drop obj)

    method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Content_formats.content_formats ret)
          (Raw.Drop_target.get_formats obj)

    method get_preload : unit -> bool =
      fun () -> Raw.Drop_target.get_preload obj

    method get_value : unit -> Gobject.Value.t option =
      fun () -> Raw.Drop_target.get_value obj

    method reject : unit -> unit = fun () -> Raw.Drop_target.reject obj

    method set_actions : Ocgdk.Enums.dragaction -> unit =
      fun actions -> Raw.Drop_target.set_actions obj actions

    method set_gtypes : Gobject.Type.t array option -> Gsize.t -> unit =
      fun types n_types -> Raw.Drop_target.set_gtypes obj types n_types

    method set_preload : bool -> unit =
      fun preload -> Raw.Drop_target.set_preload obj preload

    method as_drop_target = obj
  end

let new_ (type_ : Gobject.Type.t) (actions : Ocgdk.Enums.dragaction) :
    drop_target_t =
  let obj_ = Raw.Drop_target.new_ type_ actions in
  new drop_target obj_
