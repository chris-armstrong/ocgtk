class drop_target : Drop_target.t ->
  object
    inherit Gdrop_target_signals.drop_target_signals
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_current_drop : unit -> Ocgtk_gdk.Gdk.drop option
    method get_drop : unit -> Ocgtk_gdk.Gdk.drop option
    method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats option
    method get_preload : unit -> bool
    method reject : unit -> unit
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_preload : bool -> unit
    method as_drop_target : Drop_target.t
  end

