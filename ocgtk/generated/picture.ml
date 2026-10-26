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
