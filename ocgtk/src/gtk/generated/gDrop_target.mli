class type drop_target_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gdrop_target_signals.drop_target_signals
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_current_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option
    method get_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option
    method get_formats : unit -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t option
    method get_preload : unit -> bool
    method reject : unit -> unit
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_gtypes : int array option -> int -> unit
    method set_preload : bool -> unit
    method as_drop_target : Drop_target.t
end

class drop_target : Drop_target.t -> drop_target_t

val new_ : int -> Ocgtk_gdk.Gdk.dragaction -> drop_target_t
