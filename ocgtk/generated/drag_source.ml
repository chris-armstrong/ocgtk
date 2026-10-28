class type drag_source_t = object
  inherit Gesture_single.gesture_single_t

  (** {2:signals Signals} *)

  method on_drag_begin :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drag source when a drag is started.

      It can be used to e.g. set a custom drag icon with
      [Gtk.DragSource.set_icon]. *)

  method on_drag_cancel :
    ?after:bool ->
    callback:
      (drag:Ocgdk.Drag.drag_t -> reason:Ocgdk.Enums.dragcancelreason -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted on the drag source when a drag has failed.\n\n\
     The signal handler may handle a failed drag operation based on\n\
     the type of error. It should return [TRUE] if the failure has been handled\n\
     and the default \"drag operation failed\" animation should not be shown."]

  method on_drag_end :
    ?after:bool ->
    callback:(drag:Ocgdk.Drag.drag_t -> delete_data:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on the drag source when a drag is finished.

      A typical reason to connect to this signal is to undo things done in
      [Gtk.DragSource::prepare] or [Gtk.DragSource::drag-begin] handlers. *)

  method on_prepare :
    ?after:bool ->
    callback:
      (x:float -> y:float -> Ocgdk.Content_provider.content_provider_t option) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a drag is about to be initiated.

      It returns the [GdkContentProvider] to use for the drag that is about to
      start. The default handler for this signal returns the value of the
      [Gtk.DragSource:content] property, so if you set up that property ahead of
      time, you don't need to connect to this signal. *)

  (** {2:methods Methods} *)

  method drag_cancel : unit -> unit
  (** Cancels a currently ongoing drag operation. *)

  method get_actions : unit -> Ocgdk.Enums.dragaction
  (** Gets the actions that are currently set on the [GtkDragSource]. *)

  method get_content : unit -> Ocgdk.Content_provider.content_provider_t option
  (** Gets the current content provider of a [GtkDragSource]. *)

  method get_drag : unit -> Ocgdk.Drag.drag_t option
  (** Returns the underlying [GdkDrag] object for an ongoing drag. *)

  method set_actions : Ocgdk.Enums.dragaction -> unit
  (** Sets the actions on the [GtkDragSource].

      During a DND operation, the actions are offered to potential drop targets.
      If [actions] include [GDK_ACTION_MOVE], you need to listen to the
      [Gtk.DragSource::drag-end] signal and handle [delete_data] being [TRUE].

      This function can be called before a drag is started, or in a handler for
      the [Gtk.DragSource::prepare] signal. *)

  method set_content : Ocgdk.Content_provider.content_provider_t option -> unit
  (** Sets a content provider on a [GtkDragSource].

      When the data is requested in the cause of a DND operation, it will be
      obtained from the content provider.

      This function can be called before a drag is started, or in a handler for
      the [Gtk.DragSource::prepare] signal.

      You may consider setting the content provider back to [NULL] in a
      [Gtk.DragSource::drag-end] signal handler. *)

  method set_icon : Ocgdk.Paintable.paintable_t option -> int -> int -> unit
  (** Sets a paintable to use as icon during DND operations.

      The hotspot coordinates determine the point on the icon that gets aligned
      with the hotspot of the cursor.

      If [paintable] is [NULL], a default icon is used.

      This function can be called before a drag is started, or in a
      [Gtk.DragSource::prepare] or [Gtk.DragSource::drag-begin] signal handler.
  *)

  (** {2:conversions Conversions} *)

  method as_drag_source : Raw.Drag_source.t
end

(* High-level class for DragSource *)
class drag_source (obj : Raw.Drag_source.t) : drag_source_t =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_drag_begin ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_begin ~after self#as_drag_source
        ~callback:(fun ~drag -> callback ~drag:(new Ocgdk.Drag.drag drag))

    method on_drag_cancel ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_cancel ~after self#as_drag_source
        ~callback:(fun ~drag ~reason ->
          callback ~drag:(new Ocgdk.Drag.drag drag) ~reason)

    method on_drag_end ?(after = false) ~callback () =
      Raw.Drag_source.on_drag_end ~after self#as_drag_source
        ~callback:(fun ~drag ~delete_data ->
          callback ~drag:(new Ocgdk.Drag.drag drag) ~delete_data)

    method on_prepare ?(after = false) ~callback () =
      Raw.Drag_source.on_prepare ~after self#as_drag_source
        ~callback:(fun ~x ~y ->
          Option.map (fun w -> w#as_content_provider) (callback ~x ~y))

    method drag_cancel : unit -> unit =
      fun () -> Raw.Drag_source.drag_cancel obj

    method get_actions : unit -> Ocgdk.Enums.dragaction =
      fun () -> Raw.Drag_source.get_actions obj

    method get_content :
        unit -> Ocgdk.Content_provider.content_provider_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Content_provider.content_provider ret)
          (Raw.Drag_source.get_content obj)

    method get_drag : unit -> Ocgdk.Drag.drag_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Drag.drag ret)
          (Raw.Drag_source.get_drag obj)

    method set_actions : Ocgdk.Enums.dragaction -> unit =
      fun actions -> Raw.Drag_source.set_actions obj actions

    method set_content :
        Ocgdk.Content_provider.content_provider_t option -> unit =
      fun content ->
        let content = Option.map (fun c -> c#as_content_provider) content in
        Raw.Drag_source.set_content obj content

    method set_icon : Ocgdk.Paintable.paintable_t option -> int -> int -> unit =
      fun paintable hot_x hot_y ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Drag_source.set_icon obj paintable hot_x hot_y

    method as_drag_source = obj
  end

let new_ () : drag_source_t = new drag_source (Raw.Drag_source.new_ ())
