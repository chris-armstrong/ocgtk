class type picture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_alternative_text : unit -> string option
  method get_can_shrink : unit -> bool
  method get_content_fit : unit -> Enums.contentfit
  method get_file : unit -> Ocgio.File.file_t option
  method get_keep_aspect_ratio : unit -> bool
  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  method set_alternative_text : string option -> unit
  method set_can_shrink : bool -> unit
  method set_content_fit : Enums.contentfit -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_filename : string option -> unit
  method set_keep_aspect_ratio : bool -> unit
  method set_paintable : Ocgdk.Paintable.paintable_t option -> unit
  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  method set_resource : string option -> unit
  method as_picture : Raw.Picture.t
end

class picture : Raw.Picture.t -> picture_t

val new_ : unit -> picture_t
val new_for_file : Ocgio.File.file_t option -> picture_t
val new_for_filename : string option -> picture_t
val new_for_paintable : Ocgdk.Paintable.paintable_t option -> picture_t
val new_for_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> picture_t
val new_for_resource : string option -> picture_t
