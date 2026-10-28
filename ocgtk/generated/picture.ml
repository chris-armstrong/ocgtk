class type picture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  (** {2:methods Methods} *)

  method get_alternative_text : unit -> string option
  (** Gets the alternative textual description of the picture.

      The returned string will be [NULL] if the picture cannot be described
      textually. *)

  method get_can_shrink : unit -> bool
  (** Returns whether the [GtkPicture] respects its contents size. *)

  method get_content_fit : unit -> Enums.contentfit
  (** Returns the fit mode for the content of the [GtkPicture].

      See [Gtk.ContentFit] for details. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the [GFile] currently displayed if [self] is displaying a file.

      If [self] is not displaying a file, for example when
      [Gtk.Picture.set_paintable] was used, then [NULL] is returned. *)

  method get_keep_aspect_ratio : unit -> bool
  (** Returns whether the [GtkPicture] preserves its contents aspect ratio. *)

  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  (** Gets the [GdkPaintable] being displayed by the [GtkPicture]. *)

  method set_alternative_text : string option -> unit
  [@@ocaml.doc
    "Sets an alternative textual description for the picture contents.\n\n\
     It is equivalent to the \"alt\" attribute for images on websites.\n\n\
     This text will be made available to accessibility tools.\n\n\
     If the picture cannot be described textually, set this property to [NULL]."]

  method set_can_shrink : bool -> unit
  (** If set to [TRUE], the [self] can be made smaller than its contents.

      The contents will then be scaled down when rendering.

      If you want to still force a minimum size manually, consider using
      [Gtk.Widget.set_size_request].

      Also of note is that a similar function for growing does not exist because
      the grow behavior can be controlled via [Gtk.Widget.set_halign] and
      [Gtk.Widget.set_valign]. *)

  method set_content_fit : Enums.contentfit -> unit
  (** Sets how the content should be resized to fit the [GtkPicture].

      See [Gtk.ContentFit] for details. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Makes [self] load and display [file].

      See [Gtk.Picture.new_for_file] for details.

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_filename : string option -> unit
  (** Makes [self] load and display the given [filename].

      This is a utility function that calls [Gtk.Picture.set_file].

      Note that this function should not be used with untrusted data. Use a
      proper image loading framework such as libglycin, which can load many
      image formats into a [GdkTexture], and then use
      [Gtk.Image.set_from_paintable]. *)

  method set_keep_aspect_ratio : bool -> unit
  (** If set to [TRUE], the [self] will render its contents according to their
      aspect ratio.

      That means that empty space may show up at the top/bottom or left/right of
      [self].

      If set to [FALSE] or if the contents provide no aspect ratio, the contents
      will be stretched over the picture's whole area. *)

  method set_paintable : Ocgdk.Paintable.paintable_t option -> unit
  (** Makes [self] display the given [paintable].

      If [paintable] is [NULL], nothing will be displayed.

      See [Gtk.Picture.new_for_paintable] for details. *)

  method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  (** Sets a [GtkPicture] to show a [GdkPixbuf].

      See [Gtk.Picture.new_for_pixbuf] for details.

      This is a utility function that calls [Gtk.Picture.set_paintable]. *)

  method set_resource : string option -> unit
  (** Makes [self] load and display the resource at the given [resource_path].

      This is a utility function that calls [Gtk.Picture.set_file]. *)

  (** {2:conversions Conversions} *)

  method as_picture : Raw.Picture.t
end

(* High-level class for Picture *)
class picture (obj : Raw.Picture.t) : picture_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_alternative_text : unit -> string option =
      fun () -> Raw.Picture.get_alternative_text obj

    method get_can_shrink : unit -> bool =
      fun () -> Raw.Picture.get_can_shrink obj

    method get_content_fit : unit -> Enums.contentfit =
      fun () -> Raw.Picture.get_content_fit obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Picture.get_file obj)

    method get_keep_aspect_ratio : unit -> bool =
      fun () -> Raw.Picture.get_keep_aspect_ratio obj

    method get_paintable : unit -> Ocgdk.Paintable.paintable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Picture.get_paintable obj)

    method set_alternative_text : string option -> unit =
      fun alternative_text ->
        Raw.Picture.set_alternative_text obj alternative_text

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Raw.Picture.set_can_shrink obj can_shrink

    method set_content_fit : Enums.contentfit -> unit =
      fun content_fit -> Raw.Picture.set_content_fit obj content_fit

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.Picture.set_file obj file

    method set_filename : string option -> unit =
      fun filename -> Raw.Picture.set_filename obj filename

    method set_keep_aspect_ratio : bool -> unit =
      fun keep_aspect_ratio ->
        Raw.Picture.set_keep_aspect_ratio obj keep_aspect_ratio

    method set_paintable : Ocgdk.Paintable.paintable_t option -> unit =
      fun paintable ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Picture.set_paintable obj paintable

    method set_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit =
      fun pixbuf ->
        let pixbuf = Option.map (fun c -> c#as_pixbuf) pixbuf in
        Raw.Picture.set_pixbuf obj pixbuf

    method set_resource : string option -> unit =
      fun resource_path -> Raw.Picture.set_resource obj resource_path

    method as_picture = obj
  end

let new_ () : picture_t = new picture (Raw.Picture.new_ ())

let new_for_file (file : Ocgio.File.file_t option) : picture_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Picture.new_for_file file in
  new picture obj_

let new_for_filename (filename : string option) : picture_t =
  let obj_ = Raw.Picture.new_for_filename filename in
  new picture obj_

let new_for_paintable (paintable : Ocgdk.Paintable.paintable_t option) :
    picture_t =
  let paintable = Option.map (fun c -> c#as_paintable) paintable in
  let obj_ = Raw.Picture.new_for_paintable paintable in
  new picture obj_

let new_for_pixbuf (pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option) : picture_t =
  let pixbuf = Option.map (fun c -> c#as_pixbuf) pixbuf in
  let obj_ = Raw.Picture.new_for_pixbuf pixbuf in
  new picture obj_

let new_for_resource (resource_path : string option) : picture_t =
  let obj_ = Raw.Picture.new_for_resource resource_path in
  new picture obj_
