class type image_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method clear : unit -> unit
  (** Resets the image to be empty. *)

  method get_gicon : unit -> Ocgio.Icon.icon_t option
  (** Gets the [GIcon] being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_GICON] (see [Gtk.Image.get_storage_type]). The caller of this
      function does not own a reference to the returned [GIcon]. *)

  method get_icon_name : unit -> string option
  (** Gets the icon name and size being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_ICON_NAME] (see [Gtk.Image.get_storage_type]). The returned
      string is owned by the [GtkImage] and should not be freed. *)

  method get_icon_size : unit -> Enums.iconsize
  (** Gets the icon size used by the [image] when rendering icons. *)

  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  (** Gets the image [GdkPaintable] being displayed by the [GtkImage].

      The storage type of the image must be [GTK_IMAGE_EMPTY] or
      [GTK_IMAGE_PAINTABLE] (see [Gtk.Image.get_storage_type]). The caller of
      this function does not own a reference to the returned paintable. *)

  method get_pixel_size : unit -> int
  (** Gets the pixel size used for named icons. *)

  method get_storage_type : unit -> Enums.imagetype
  (** Gets the type of representation being used by the [GtkImage] to store
      image data.

      If the [GtkImage] has no image data, the return value will be
      [GTK_IMAGE_EMPTY]. *)

  method set_from_file : string option -> unit
  (** Sets a [GtkImage] to show a file.

      See [Gtk.Image.new_from_file] for details.

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_from_gicon : Ocgio.Icon.icon_t -> unit
  (** Sets a [GtkImage] to show a [GIcon].

      See [Gtk.Image.new_from_gicon] for details. *)

  method set_from_icon_name : string option -> unit
  (** Sets a [GtkImage] to show a named icon.

      See [Gtk.Image.new_from_icon_name] for details. *)

  method set_from_paintable : Ocgdk.Paintable.paintable_t option -> unit
  (** Sets a [GtkImage] to show a [GdkPaintable].

      See [Gtk.Image.new_from_paintable] for details. *)

  method set_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  (** Sets a [GtkImage] to show a [GdkPixbuf].

      See [Gtk.Image.new_from_pixbuf] for details.

      Note: This is a helper for [Gtk.Image.set_from_paintable], and you can't
      get back the exact pixbuf once this is called, only a paintable. *)

  method set_from_resource : string option -> unit
  (** Sets a [GtkImage] to show a resource.

      See [Gtk.Image.new_from_resource] for details. *)

  method set_icon_size : Enums.iconsize -> unit
  (** Suggests an icon size to the theme for named icons. *)

  method set_pixel_size : int -> unit
  (** Sets the pixel size to use for named icons.

      If the pixel size is set to a value != -1, it is used instead of the icon
      size set by [Gtk.Image.set_icon_size]. *)

  method use_fallback : bool
  method set_use_fallback : bool -> unit
  method as_image : Raw.Image.t
end

(* High-level class for Image *)
class image (obj : Raw.Image.t) : image_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method clear : unit -> unit = fun () -> Raw.Image.clear obj

    method get_gicon : unit -> Ocgio.Icon.icon_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Icon.icon ret)
          (Raw.Image.get_gicon obj)

    method get_icon_name : unit -> string option =
      fun () -> Raw.Image.get_icon_name obj

    method get_icon_size : unit -> Enums.iconsize =
      fun () -> Raw.Image.get_icon_size obj

    method get_paintable : unit -> Ocgdk.Paintable.paintable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Image.get_paintable obj)

    method get_pixel_size : unit -> int = fun () -> Raw.Image.get_pixel_size obj

    method get_storage_type : unit -> Enums.imagetype =
      fun () -> Raw.Image.get_storage_type obj

    method set_from_file : string option -> unit =
      fun filename -> Raw.Image.set_from_file obj filename

    method set_from_gicon : Ocgio.Icon.icon_t -> unit =
      fun icon ->
        let icon = icon#as_icon in
        Raw.Image.set_from_gicon obj icon

    method set_from_icon_name : string option -> unit =
      fun icon_name -> Raw.Image.set_from_icon_name obj icon_name

    method set_from_paintable : Ocgdk.Paintable.paintable_t option -> unit =
      fun paintable ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Image.set_from_paintable obj paintable

    method set_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit =
      fun pixbuf ->
        let pixbuf = Option.map (fun c -> c#as_pixbuf) pixbuf in
        Raw.Image.set_from_pixbuf obj pixbuf

    method set_from_resource : string option -> unit =
      fun resource_path -> Raw.Image.set_from_resource obj resource_path

    method set_icon_size : Enums.iconsize -> unit =
      fun icon_size -> Raw.Image.set_icon_size obj icon_size

    method set_pixel_size : int -> unit =
      fun pixel_size -> Raw.Image.set_pixel_size obj pixel_size

    method use_fallback = Raw.Image.get_use_fallback obj
    method set_use_fallback v = Raw.Image.set_use_fallback obj v
    method as_image = obj
  end

let new_ () : image_t = new image (Raw.Image.new_ ())

let new_from_file (filename : string) : image_t =
  let obj_ = Raw.Image.new_from_file filename in
  new image obj_

let new_from_gicon (icon : Ocgio.Icon.icon_t) : image_t =
  let icon = icon#as_icon in
  let obj_ = Raw.Image.new_from_gicon icon in
  new image obj_

let new_from_icon_name (icon_name : string option) : image_t =
  let obj_ = Raw.Image.new_from_icon_name icon_name in
  new image obj_

let new_from_paintable (paintable : Ocgdk.Paintable.paintable_t option) :
    image_t =
  let paintable = Option.map (fun c -> c#as_paintable) paintable in
  let obj_ = Raw.Image.new_from_paintable paintable in
  new image obj_

let new_from_pixbuf (pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option) : image_t =
  let pixbuf = Option.map (fun c -> c#as_pixbuf) pixbuf in
  let obj_ = Raw.Image.new_from_pixbuf pixbuf in
  new image obj_

let new_from_resource (resource_path : string) : image_t =
  let obj_ = Raw.Image.new_from_resource resource_path in
  new image obj_
