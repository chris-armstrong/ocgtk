(* High-level class for Image *)
class image (obj : Image.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Image.as_widget obj)

  method clear : unit -> unit =
    fun () ->
      (Image.clear obj)

  method get_icon_name : unit -> string option =
    fun () ->
      (Image.get_icon_name obj)

  method get_icon_size : unit -> Gtk_enums.iconsize =
    fun () ->
      (Image.get_icon_size obj)

  method get_pixel_size : unit -> int =
    fun () ->
      (Image.get_pixel_size obj)

  method get_storage_type : unit -> Gtk_enums.imagetype =
    fun () ->
      (Image.get_storage_type obj)

  method set_from_file : string option -> unit =
    fun filename ->
      (Image.set_from_file obj filename)

  method set_from_icon_name : string option -> unit =
    fun icon_name ->
      (Image.set_from_icon_name obj icon_name)

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

  method as_widget = (Image.as_widget obj)
    method as_image = obj
end

