(* Signal class defined in gdrop_target_async_signals.ml *)

class type drop_target_async_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gdrop_target_async_signals.drop_target_async_signals
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats_t option
    method reject_drop : Ocgtk_gdk.Gdk.drop_t -> unit
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_formats : Ocgtk_gdk.Gdk.content_formats_t option -> unit
    method as_drop_target_async : Drop_target_async.t
end

(* High-level class for DropTargetAsync *)
class drop_target_async (obj : Drop_target_async.t) : drop_target_async_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Gdrop_target_async_signals.drop_target_async_signals obj

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drop_target_async.get_actions obj)

  method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.content_formats ret) (Drop_target_async.get_formats obj)

  method reject_drop : Ocgtk_gdk.Gdk.drop_t -> unit =
    fun drop ->
      let drop = drop#as_drop in
      (Drop_target_async.reject_drop obj drop)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drop_target_async.set_actions obj actions)

  method set_formats : Ocgtk_gdk.Gdk.content_formats_t option -> unit =
    fun formats ->
      let formats = Option.map (fun (c) -> c#as_content_formats) formats in
      (Drop_target_async.set_formats obj formats)

    method as_drop_target_async = obj
end

