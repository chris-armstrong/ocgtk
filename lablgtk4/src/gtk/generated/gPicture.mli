class picture : Picture.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_alternative_text : unit -> string option
    method get_can_shrink : unit -> bool
    method get_content_fit : unit -> Gtk_enums.contentfit
    method get_keep_aspect_ratio : unit -> bool
    method set_alternative_text : string option -> unit
    method set_can_shrink : bool -> unit
    method set_content_fit : Gtk_enums.contentfit -> unit
    method set_keep_aspect_ratio : bool -> unit
    method set_resource : string option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_picture : Picture.t
  end

