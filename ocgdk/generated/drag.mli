[@@@ocaml.text
"Represents the source of an ongoing DND operation.\n\n\
 A [GdkDrag] is created when a drag is started, and stays alive for duration of\n\
 the DND operation. After a drag has been started with [Gdk.Drag.begin],\n\
 the caller gets informed about the status of the ongoing drag operation\n\
 with signals on the [GdkDrag] object.\n\n\
 GTK provides a higher level abstraction based on top of these functions,\n\
 and so they are not normally needed in GTK applications. See the\n\
 \"Drag and Drop\" section of the GTK documentation for more information.\n\n\
 Its methods, signals and properties are on {!class-type-drag_t}. The \
 functions it is built on are in {!Ocgdk.Raw.Drag}."]

(** The methods, signals and properties of a [GdkDrag]. *)
class type drag_t = object
  method on_cancel :
    ?after:bool ->
    callback:(reason:Enums.dragcancelreason -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_dnd_finished :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_drop_performed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method drop_done : bool -> unit
  method get_actions : unit -> Enums.dragaction
  method get_content : unit -> Content_provider.content_provider_t
  method get_device : unit -> App_launch_context_cycle_de440b34.device_t
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t

  method get_drag_surface :
    unit -> App_launch_context_cycle_de440b34.surface_t option

  method get_formats : unit -> Raw.Content_formats.t
  method get_selected_action : unit -> Enums.dragaction
  method get_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  method set_hotspot : int -> int -> unit
  method as_drag : Raw.Drag.t
end

class drag : Raw.Drag.t -> drag_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Drag.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDrag], give one already wrapped. *)
