[@@@ocaml.text
"Represents the target of an ongoing DND operation.\n\n\
 Possible drop sites get informed about the status of the ongoing drag\n\
 operation with events of type [GDK_DRAG_ENTER], [GDK_DRAG_LEAVE],\n\
 [GDK_DRAG_MOTION] and [GDK_DROP_START]. The [GdkDrop] object can be obtained\n\
 from these [Gdk.Event] types using [Gdk.DNDEvent.get_drop].\n\n\
 The actual data transfer is initiated from the target side via an async\n\
 read, using one of the [GdkDrop] methods for this purpose:\n\
 [Gdk.Drop.read_async] or [Gdk.Drop.read_value_async].\n\n\
 GTK provides a higher level abstraction based on top of these functions,\n\
 and so they are not normally needed in GTK applications. See the\n\
 \"Drag and Drop\" section of the GTK documentation for more information.\n\n\
 Its methods, signals and properties are on {!class-type-drop_t}. The \
 functions it is built on are in {!Ocgdk.Raw.Drop}."]

(** The methods, signals and properties of a [GdkDrop]. *)
class type drop_t = object
  method finish : Enums.dragaction -> unit
  method get_actions : unit -> Enums.dragaction
  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  method get_drag : unit -> Drag.drag_t option
  method get_formats : unit -> Raw.Content_formats.t
  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t

  method read_value_finish :
    Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result

  method status : Enums.dragaction -> Enums.dragaction -> unit
  method as_drop : Raw.Drop.t
end

class drop : Raw.Drop.t -> drop_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Drop.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDrop], give one already wrapped. *)
