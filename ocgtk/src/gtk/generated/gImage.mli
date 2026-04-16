class type image_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method clear : unit -> unit
  method get_gicon : unit -> Ocgtk_gio.Gio.Icon.icon_t option
  method get_icon_name : unit -> string option
  method get_icon_size : unit -> Gtk_enums.iconsize
  method get_paintable : unit -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
  method get_pixel_size : unit -> int
  method get_storage_type : unit -> Gtk_enums.imagetype
  method set_from_file : string option -> unit
  method set_from_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit
  method set_from_icon_name : string option -> unit
  method set_from_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit

  method set_from_pixbuf :
    Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t option -> unit

  method set_from_resource : string option -> unit
  method set_icon_size : Gtk_enums.iconsize -> unit
  method set_pixel_size : int -> unit
  method file : string
  method set_file : string -> unit
  method resource : string
  method set_resource : string -> unit
  method use_fallback : bool
  method set_use_fallback : bool -> unit
  method as_image : Image.t
end

class image : Image.t -> image_t

val new_ : unit -> image_t
val new_from_file : string -> image_t
val new_from_gicon : Ocgtk_gio.Gio.Icon.icon_t -> image_t
val new_from_icon_name : string option -> image_t
val new_from_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t option -> image_t

val new_from_pixbuf :
  Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.pixbuf_t option -> image_t

val new_from_resource : string -> image_t
