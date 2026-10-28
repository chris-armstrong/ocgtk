(** Represents the source of an ongoing DND operation.

    Its methods, signals and properties are on {!class-type-drag_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Drag}. *)

(** {1:class Class} *)

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
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Drag].}\n\n\
     Inherits from: [GObject.Object]\n\n\
     Represents the source of an ongoing DND operation.\n\n\
     A [GdkDrag] is created when a drag is started, and stays alive for \
     duration of\n\
     the DND operation. After a drag has been started with [Gdk.Drag.begin],\n\
     the caller gets informed about the status of the ongoing drag operation\n\
     with signals on the [GdkDrag] object.\n\n\
     GTK provides a higher level abstraction based on top of these functions,\n\
     and so they are not normally needed in GTK applications. See the\n\
     \"Drag and Drop\" section of the GTK documentation for more information."]

class drag : Raw.Drag.t -> drag_t
(** Wraps a raw handle of {!Ocgdk.Raw.Drag.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Represents the source of an ongoing DND operation.\n\n\
 A [GdkDrag] is created when a drag is started, and stays alive for duration of\n\
 the DND operation. After a drag has been started with [Gdk.Drag.begin],\n\
 the caller gets informed about the status of the ongoing drag operation\n\
 with signals on the [GdkDrag] object.\n\n\
 GTK provides a higher level abstraction based on top of these functions,\n\
 and so they are not normally needed in GTK applications. See the\n\
 \"Drag and Drop\" section of the GTK documentation for more information."]

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
