(** Represents the target of an ongoing DND operation.

    Its methods, signals and properties are on {!class-type-drop_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Drop}. *)

(** {1:class Class} *)

class type drop_t = object
  (** {2:methods Methods} *)

  method finish : Enums.dragaction -> unit
  (** Ends the drag operation after a drop.

      The [action] must be a single action selected from the actions available
      via [Gdk.Drop.get_actions]. *)

  method get_actions : unit -> Enums.dragaction
  (** Returns the possible actions for this [GdkDrop].

      If this value contains multiple actions - i.e. [Gdk.DragAction.is_unique]
      returns false for the result - [Gdk.Drop.finish] must choose the action to
      use when accepting the drop. This will only happen if you passed
      [GDK_ACTION_ASK] as one of the possible actions in [Gdk.Drop.status].
      [GDK_ACTION_ASK] itself will not be included in the actions returned by
      this function.

      This value may change over the lifetime of the [Gdk.Drop] both as a
      response to source side actions as well as to calls to [Gdk.Drop.status]
      or [Gdk.Drop.finish]. The source side will not change this value anymore
      once a drop has started. *)

  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  (** Returns the [GdkDevice] performing the drop. *)

  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  (** Gets the [GdkDisplay] that [self] was created for. *)

  method get_drag : unit -> Drag.drag_t option
  (** If this is an in-app drag-and-drop operation, returns the [GdkDrag] that
      corresponds to this drop.

      If it is not, [NULL] is returned. *)

  method get_formats : unit -> Raw.Content_formats.t
  (** Returns the [GdkContentFormats] that the drop offers the data to be read
      in. *)

  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  (** Returns the [GdkSurface] performing the drop. *)

  method read_value_finish :
    Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result
  (** Finishes an async drop read.

      See [Gdk.Drop.read_value_async]. *)

  method status : Enums.dragaction -> Enums.dragaction -> unit
  (** Selects all actions that are potentially supported by the destination.

      When calling this function, do not restrict the passed in actions to the
      ones provided by [Gdk.Drop.get_actions]. Those actions may change in the
      future, even depending on the actions you provide here.

      The [preferred] action is a hint to the drag-and-drop mechanism about
      which action to use when multiple actions are possible.

      This function should be called by drag destinations in response to
      [GDK_DRAG_ENTER] or [GDK_DRAG_MOTION] events. If the destination does not
      yet know the exact actions it supports, it should set any possible actions
      first and then later call this function again. *)

  (** {2:conversions Conversions} *)

  method as_drop : Raw.Drop.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Drop].}\n\n\
     Inherits from: [GObject.Object]\n\n\
     Represents the target of an ongoing DND operation.\n\n\
     Possible drop sites get informed about the status of the ongoing drag\n\
     operation with events of type [GDK_DRAG_ENTER], [GDK_DRAG_LEAVE],\n\
     [GDK_DRAG_MOTION] and [GDK_DROP_START]. The [GdkDrop] object can be \
     obtained\n\
     from these [Gdk.Event] types using [Gdk.DNDEvent.get_drop].\n\n\
     The actual data transfer is initiated from the target side via an async\n\
     read, using one of the [GdkDrop] methods for this purpose:\n\
     [Gdk.Drop.read_async] or [Gdk.Drop.read_value_async].\n\n\
     GTK provides a higher level abstraction based on top of these functions,\n\
     and so they are not normally needed in GTK applications. See the\n\
     \"Drag and Drop\" section of the GTK documentation for more information."]

class drop : Raw.Drop.t -> drop_t
(** Wraps a raw handle of {!Ocgdk.Raw.Drop.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Represents the target of an ongoing DND operation.\n\n\
 Possible drop sites get informed about the status of the ongoing drag\n\
 operation with events of type [GDK_DRAG_ENTER], [GDK_DRAG_LEAVE],\n\
 [GDK_DRAG_MOTION] and [GDK_DROP_START]. The [GdkDrop] object can be obtained\n\
 from these [Gdk.Event] types using [Gdk.DNDEvent.get_drop].\n\n\
 The actual data transfer is initiated from the target side via an async\n\
 read, using one of the [GdkDrop] methods for this purpose:\n\
 [Gdk.Drop.read_async] or [Gdk.Drop.read_value_async].\n\n\
 GTK provides a higher level abstraction based on top of these functions,\n\
 and so they are not normally needed in GTK applications. See the\n\
 \"Drag and Drop\" section of the GTK documentation for more information."]

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
