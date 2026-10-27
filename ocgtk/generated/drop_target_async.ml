class type drop_target_async_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_enter :
    ?after:bool ->
    callback:
      (drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_leave :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_motion :
    ?after:bool ->
    callback:
      (drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drop :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that this drop target supports. *)

  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  (** Gets the data formats that this drop target accepts.

      If the result is [NULL], all formats are expected to be supported. *)

  method reject_drop : Ocgdk.Drop.drop_t -> unit
  (** Sets the [drop] as not accepted on this drag site.

      This function should be used when delaying the decision on whether to
      accept a drag or not until after reading the data. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions that this drop target supports. *)

  method set_formats : Ocgdk.Content_formats.content_formats_t option -> unit
  (** Sets the data formats that this drop target will accept. *)

  method as_drop_target_async : Raw.Drop_target_async.t
end

(* High-level class for DropTargetAsync *)
class drop_target_async (obj : Raw.Drop_target_async.t) : drop_target_async_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method on_accept ?(after = false) ~callback () =
      Raw.Drop_target_async.on_accept ~after self#as_drop_target_async
        ~callback:(fun ~drop -> callback ~drop:(new Ocgdk.Drop.drop drop))

    method on_drag_enter ?(after = false) ~callback () =
      Raw.Drop_target_async.on_drag_enter ~after self#as_drop_target_async
        ~callback:(fun ~drop ~x ~y ->
          callback ~drop:(new Ocgdk.Drop.drop drop) ~x ~y)

    method on_drag_leave ?(after = false) ~callback () =
      Raw.Drop_target_async.on_drag_leave ~after self#as_drop_target_async
        ~callback:(fun ~drop -> callback ~drop:(new Ocgdk.Drop.drop drop))

    method on_drag_motion ?(after = false) ~callback () =
      Raw.Drop_target_async.on_drag_motion ~after self#as_drop_target_async
        ~callback:(fun ~drop ~x ~y ->
          callback ~drop:(new Ocgdk.Drop.drop drop) ~x ~y)

    method on_drop ?(after = false) ~callback () =
      Raw.Drop_target_async.on_drop ~after self#as_drop_target_async
        ~callback:(fun ~drop ~x ~y ->
          callback ~drop:(new Ocgdk.Drop.drop drop) ~x ~y)

    method get_actions : unit -> Ocgdk.Enums.dragaction =
      fun () -> Raw.Drop_target_async.get_actions obj

    method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Content_formats.content_formats ret)
          (Raw.Drop_target_async.get_formats obj)

    method reject_drop : Ocgdk.Drop.drop_t -> unit =
      fun drop ->
        let drop = drop#as_drop in
        Raw.Drop_target_async.reject_drop obj drop

    method set_actions : Ocgdk.Enums.dragaction -> unit =
      fun actions -> Raw.Drop_target_async.set_actions obj actions

    method set_formats : Ocgdk.Content_formats.content_formats_t option -> unit
        =
      fun formats ->
        let formats = Option.map (fun c -> c#as_content_formats) formats in
        Raw.Drop_target_async.set_formats obj formats

    method as_drop_target_async = obj
  end

let new_ (formats : Ocgdk.Content_formats.content_formats_t option)
    (actions : Ocgdk.Enums.dragaction) : drop_target_async_t =
  let formats = Option.map (fun c -> c#as_content_formats) formats in
  let obj_ = Raw.Drop_target_async.new_ formats actions in
  new drop_target_async obj_
