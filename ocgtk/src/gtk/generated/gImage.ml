(* High-level class for Image *)
class image (obj : Image.t) = object (self)

  method clear : unit -> unit =
    fun () ->
      (Image.clear obj)

  method get_gicon : unit -> Ocgtk_gio.Gio.icon option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.icon ret) (Image.get_gicon obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Image.get_icon_name obj)

  method get_icon_size : unit -> Gtk_enums.iconsize =
    fun () ->
      (Image.get_icon_size obj)

  method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable option =
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

  method set_from_gicon : 'p1. (#Ocgtk_gio.Gio.icon as 'p1) -> unit =
    fun icon ->
      let icon = icon#as_icon in
      (Image.set_from_gicon obj icon)

  method set_from_icon_name : string option -> unit =
    fun icon_name ->
      (Image.set_from_icon_name obj icon_name)

  method set_from_paintable : 'p1. (#Ocgtk_gdk.Gdk.paintable as 'p1) option -> unit =
    fun paintable ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Image.set_from_paintable obj paintable)

  method set_from_pixbuf : 'p1. (#Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf as 'p1) option -> unit =
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

