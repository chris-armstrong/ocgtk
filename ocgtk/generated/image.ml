class type image_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method clear : unit -> unit
  method get_gicon : unit -> Ocgio.Icon.icon_t option
  method get_icon_name : unit -> string option
  method get_icon_size : unit -> Enums.iconsize
  method get_paintable : unit -> Ocgdk.Paintable.paintable_t option
  method get_pixel_size : unit -> int
  method get_storage_type : unit -> Enums.imagetype
  method set_from_file : string option -> unit
  method set_from_gicon : Ocgio.Icon.icon_t -> unit
  method set_from_icon_name : string option -> unit
  method set_from_paintable : Ocgdk.Paintable.paintable_t option -> unit
  method set_from_pixbuf : Ocgdkpixbuf.Pixbuf.pixbuf_t option -> unit
  method set_from_resource : string option -> unit
  method set_icon_size : Enums.iconsize -> unit
  method set_pixel_size : int -> unit
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
