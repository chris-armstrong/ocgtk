class drop_target_async : Drop_target_async.t ->
  object
    inherit Gdrop_target_async_signals.drop_target_async_signals
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats option
    method reject_drop : #Ocgtk_gdk.Gdk.drop -> unit
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_formats : #Ocgtk_gdk.Gdk.content_formats option -> unit
    method as_drop_target_async : Drop_target_async.t
  end

