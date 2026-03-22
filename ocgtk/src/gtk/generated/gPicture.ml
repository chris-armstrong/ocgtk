class type picture_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_alternative_text : unit -> string option
    method get_can_shrink : unit -> bool
    method get_content_fit : unit -> Gtk_enums.contentfit
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_keep_aspect_ratio : unit -> bool
    method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable_t option
    method set_alternative_text : string option -> unit
    method set_can_shrink : bool -> unit
    method set_content_fit : Gtk_enums.contentfit -> unit
    method set_file : Ocgtk_gio.Gio.file_t option -> unit
    method set_filename : string option -> unit
    method set_keep_aspect_ratio : bool -> unit
    method set_paintable : Ocgtk_gdk.Gdk.paintable_t option -> unit
    method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf_t option -> unit
    method set_resource : string option -> unit
    method as_picture : Picture.t
end

(* High-level class for Picture *)
class picture (obj : Picture.t) : picture_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_alternative_text : unit -> string option =
    fun () ->
      (Picture.get_alternative_text obj)

  method get_can_shrink : unit -> bool =
    fun () ->
      (Picture.get_can_shrink obj)

  method get_content_fit : unit -> Gtk_enums.contentfit =
    fun () ->
      (Picture.get_content_fit obj)

  method get_file : unit -> Ocgtk_gio.Gio.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (Picture.get_file obj)

  method get_keep_aspect_ratio : unit -> bool =
    fun () ->
      (Picture.get_keep_aspect_ratio obj)

  method get_paintable : unit -> Ocgtk_gdk.Gdk.paintable_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.paintable ret) (Picture.get_paintable obj)

  method set_alternative_text : string option -> unit =
    fun alternative_text ->
      (Picture.set_alternative_text obj alternative_text)

  method set_can_shrink : bool -> unit =
    fun can_shrink ->
      (Picture.set_can_shrink obj can_shrink)

  method set_content_fit : Gtk_enums.contentfit -> unit =
    fun content_fit ->
      (Picture.set_content_fit obj content_fit)

  method set_file : Ocgtk_gio.Gio.file_t option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (Picture.set_file obj file)

  method set_filename : string option -> unit =
    fun filename ->
      (Picture.set_filename obj filename)

  method set_keep_aspect_ratio : bool -> unit =
    fun keep_aspect_ratio ->
      (Picture.set_keep_aspect_ratio obj keep_aspect_ratio)

  method set_paintable : Ocgtk_gdk.Gdk.paintable_t option -> unit =
    fun paintable ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Picture.set_paintable obj paintable)

  method set_pixbuf : Ocgtk_gdkpixbuf.GdkPixbuf.pixbuf_t option -> unit =
    fun pixbuf ->
      let pixbuf = Option.map (fun (c) -> c#as_pixbuf) pixbuf in
      (Picture.set_pixbuf obj pixbuf)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Picture.set_resource obj resource_path)

    method as_picture = obj
end

