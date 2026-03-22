class type image_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method clear : unit -> unit
    method get_gicon : unit -> Ocgtk_gio.Gio.icon_t option
    method get_icon_name : unit -> string option
    method get_icon_size : unit -> Gtk_enums.iconsize
    method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable_t option
    method get_pixel_size : unit -> int
    method get_storage_type : unit -> Gtk_enums.imagetype
    method set_from_file : string option -> unit
    method set_from_gicon : Ocgtk_gio.Gio.icon_t -> unit
    method set_from_icon_name : string option -> unit
    method set_from_paintable : Ocgtk_gdk.Gdk.paintable_t option -> unit
    method set_from_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf_t option -> unit
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

(* High-level class for Image *)
class image (obj : Image.t) : image_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method clear : unit -> unit =
    fun () ->
      (Image.clear obj)

  method get_gicon : unit -> Ocgtk_gio.Gio.icon_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.icon ret) (Image.get_gicon obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Image.get_icon_name obj)

  method get_icon_size : unit -> Gtk_enums.iconsize =
    fun () ->
      (Image.get_icon_size obj)

  method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.paintable ret) (Image.get_paintable obj)

  method get_pixel_size : unit -> int =
    fun () ->
      (Image.get_pixel_size obj)

  method get_storage_type : unit -> Gtk_enums.imagetype =
    fun () ->
      (Image.get_storage_type obj)

  method set_from_file : string option -> unit =
    fun filename ->
      (Image.set_from_file obj filename)

  method set_from_gicon : Ocgtk_gio.Gio.icon_t -> unit =
    fun icon ->
      let icon = icon#as_icon in
      (Image.set_from_gicon obj icon)

  method set_from_icon_name : string option -> unit =
    fun icon_name ->
      (Image.set_from_icon_name obj icon_name)

  method set_from_paintable : Ocgtk_gdk.Gdk.paintable_t option -> unit =
    fun paintable ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Image.set_from_paintable obj paintable)

  method set_from_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf_t option -> unit =
    fun pixbuf ->
      let pixbuf = Option.map (fun (c) -> c#as_pixbuf) pixbuf in
      (Image.set_from_pixbuf obj pixbuf)

  method set_from_resource : string option -> unit =
    fun resource_path ->
      (Image.set_from_resource obj resource_path)

  method set_icon_size : Gtk_enums.iconsize -> unit =
    fun icon_size ->
      (Image.set_icon_size obj icon_size)

  method set_pixel_size : int -> unit =
    fun pixel_size ->
      (Image.set_pixel_size obj pixel_size)

  method file = Image.get_file obj
  method set_file v =  Image.set_file obj v

  method resource = Image.get_resource obj
  method set_resource v =  Image.set_resource obj v

  method use_fallback = Image.get_use_fallback obj
  method set_use_fallback v =  Image.set_use_fallback obj v

    method as_image = obj
end

