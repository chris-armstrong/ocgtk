class type drop_target_async_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  inherit Gdrop_target_async_signals.drop_target_async_signals
  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction

  method get_formats :
    unit -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t option

  method reject_drop : Ocgtk_gdk.Gdk.Drop.drop_t -> unit
  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit

  method set_formats :
    Ocgtk_gdk.Gdk.Content_formats.content_formats_t option -> unit

  method as_drop_target_async : Drop_target_async.t
end

class drop_target_async : Drop_target_async.t -> drop_target_async_t

val new_ :
  Ocgtk_gdk.Gdk.Content_formats.content_formats_t option ->
  Ocgtk_gdk.Gdk.dragaction ->
  drop_target_async_t
