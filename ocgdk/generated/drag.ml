class type drag_t = object
  (** {2:signals Signals} *)

  method on_cancel :
    ?after:bool ->
    callback:(reason:Enums.dragcancelreason -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the drag operation is cancelled. *)

  method on_dnd_finished :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the destination side has finished reading all data.

      The drag object can now free all miscellaneous data. *)

  method on_drop_performed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the drop operation is performed on an accepting client. *)

  (** {2:methods Methods} *)

  method drop_done : bool -> unit
  (** Informs GDK that the drop ended.

      Passing [FALSE] for [success] may trigger a drag cancellation animation.

      This function is called by the drag source, and should be the last call
      before dropping the reference to the [drag].

      The [GdkDrag] will only take the first [Gdk.Drag.drop_done] call as
      effective, if this function is called multiple times, all subsequent calls
      will be ignored. *)

  method get_actions : unit -> Enums.dragaction
  (** Determines the bitmask of possible actions proposed by the source. *)

  method get_content : unit -> Content_provider.content_provider_t
  (** Returns the [GdkContentProvider] associated to the [GdkDrag] object. *)

  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  (** Returns the [GdkDevice] associated to the [GdkDrag] object. *)

  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  (** Gets the [GdkDisplay] that the drag object was created for. *)

  method get_drag_surface :
    unit -> App_launch_context_cycle_de440b34.surface_t option
  (** Returns the surface on which the drag icon should be rendered during the
      drag operation.

      Note that the surface may not be available until the drag operation has
      begun. GDK will move the surface in accordance with the ongoing drag
      operation. The surface is owned by [drag] and will be destroyed when the
      drag operation is over. *)

  method get_formats : unit -> Raw.Content_formats.t
  (** Retrieves the formats supported by this [GdkDrag] object. *)

  method get_selected_action : unit -> Enums.dragaction
  (** Determines the action chosen by the drag destination. *)

  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  (** Returns the [GdkSurface] where the drag originates. *)

  method set_hotspot : int -> int -> unit
  (** Sets the position of the drag surface that will be kept under the cursor
      hotspot.

      Initially, the hotspot is at the top left corner of the drag surface. *)

  (** {2:conversions Conversions} *)

  method as_drag : Raw.Drag.t
end

(* High-level class for Drag *)
class drag (obj : Raw.Drag.t) : drag_t =
  object (self)
    method on_cancel ?(after = false) ~callback () =
      Raw.Drag.on_cancel ~after self#as_drag ~callback

    method on_dnd_finished ?(after = false) ~callback () =
      Raw.Drag.on_dnd_finished ~after self#as_drag ~callback

    method on_drop_performed ?(after = false) ~callback () =
      Raw.Drag.on_drop_performed ~after self#as_drag ~callback

    method drop_done : bool -> unit =
      fun success -> Raw.Drag.drop_done obj success

    method get_actions : unit -> Enums.dragaction =
      fun () -> Raw.Drag.get_actions obj

    method get_content : unit -> Content_provider.content_provider_t =
      fun () -> new Content_provider.content_provider (Raw.Drag.get_content obj)

    method get_device : unit -> App_launch_context_cycle_de440b34.device_t =
      fun () ->
        new App_launch_context_cycle_de440b34.device (Raw.Drag.get_device obj)

    method get_display : unit -> App_launch_context_cycle_de440b34.display_t =
      fun () ->
        new App_launch_context_cycle_de440b34.display (Raw.Drag.get_display obj)

    method get_drag_surface :
        unit -> App_launch_context_cycle_de440b34.surface_t option =
      fun () ->
        Option.map
          (fun ret -> new App_launch_context_cycle_de440b34.surface ret)
          (Raw.Drag.get_drag_surface obj)

    method get_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Drag.get_formats obj

    method get_selected_action : unit -> Enums.dragaction =
      fun () -> Raw.Drag.get_selected_action obj

    method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new App_launch_context_cycle_de440b34.surface (Raw.Drag.get_surface obj)

    method set_hotspot : int -> int -> unit =
      fun hot_x hot_y -> Raw.Drag.set_hotspot obj hot_x hot_y

    method as_drag = obj
  end
