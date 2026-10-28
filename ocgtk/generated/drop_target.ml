class type drop_target_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_accept :
    ?after:bool ->
    callback:(drop:Ocgdk.Drop.drop_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when a drop operation is about to begin.

      If the drop is not accepted, [false] will be returned and the drop target
      will ignore the drop. If [true] is returned, the drop is accepted for now
      but may be rejected later via a call to [Gtk.DropTarget.reject] or
      ultimately by returning [false] from a [Gtk.DropTarget::drop] handler.

      The default handler for this signal decides whether to accept the drop
      based on the formats provided by the [drop].

      If the decision whether the drop will be accepted or rejected depends on
      the data, this function should return [true], the [Gtk.DropTarget:preload]
      property should be set and the value should be inspected via the
      ::notify:value signal, calling [Gtk.DropTarget.reject] if required. *)

  method on_drop :
    ?after:bool ->
    callback:(value:Gobject.Value.t -> x:float -> y:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when the user drops the data onto the widget.

      The signal handler must determine whether the pointer position is in a
      drop zone or not. If it is not in a drop zone, it returns [false] and no
      further processing is necessary.

      Otherwise, the handler returns [true]. In this case, this handler will
      accept the drop. The handler is responsible for using the given [value]
      and performing the drop operation. *)

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drop site when the pointer enters the widget.

      It can be used to set up custom highlighting. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted on the drop site when the pointer leaves the widget.

      Its main purpose it to undo things done in [Gtk.DropTarget::enter]. *)

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> Ocgdk.Enums.dragaction) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted while the pointer is moving over the drop target. *)

  (** {2:methods Methods} *)

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that this drop target supports. *)

  method get_current_drop : unit -> Ocgdk.Drop.drop_t option
  (** Gets the currently handled drop operation.

      If no drop operation is going on, [None] is returned. *)

  method get_drop : unit -> Ocgdk.Drop.drop_t option
  (** Gets the currently handled drop operation.

      If no drop operation is going on, [None] is returned. *)

  method get_formats : unit -> Ocgdk.Content_formats.content_formats_t option
  (** Gets the data formats that this drop target accepts.

      If the result is [None], all formats are expected to be supported. *)

  method get_preload : unit -> bool
  (** Gets whether data should be preloaded on hover. *)

  method get_value : unit -> Gobject.Value.t option
  (** Gets the current drop data, as a [GValue]. *)

  method reject : unit -> unit
  (** Rejects the ongoing drop operation.

      If no drop operation is ongoing, i.e when [Gtk.DropTarget:current-drop] is
      [None], this function does nothing.

      This function should be used when delaying the decision on whether to
      accept a drag or not until after reading the data. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions that this drop target supports. *)

  method set_gtypes : Gobject.Type.t array option -> Gsize.t -> unit
  (** Sets the supported [GType]s for this drop target. *)

  method set_preload : bool -> unit
  (** Sets whether data should be preloaded on hover. *)

  (** {2:conversions Conversions} *)

  method as_drop_target : Raw.Drop_target.t
end

(* High-level class for DropTarget *)
class drop_target (obj : Raw.Drop_target.t) : drop_target_t =
  object (self)
    inherit Event_controller.event_controller (obj :> Raw.Event_controller.t)

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
