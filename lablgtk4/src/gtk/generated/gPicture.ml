(* High-level class for Picture *)
class picture (obj : Picture.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Picture.as_widget obj)

  method get_alternative_text : unit -> string option =
    fun () ->
      (Picture.get_alternative_text obj)

  method get_can_shrink : unit -> bool =
    fun () ->
      (Picture.get_can_shrink obj)

  method get_content_fit : unit -> Gtk_enums.contentfit =
    fun () ->
      (Picture.get_content_fit obj)

  method get_keep_aspect_ratio : unit -> bool =
    fun () ->
      (Picture.get_keep_aspect_ratio obj)

  method set_alternative_text : string option -> unit =
    fun alternative_text ->
      (Picture.set_alternative_text obj alternative_text)

  method set_can_shrink : bool -> unit =
    fun can_shrink ->
      (Picture.set_can_shrink obj can_shrink)

  method set_content_fit : Gtk_enums.contentfit -> unit =
    fun content_fit ->
      (Picture.set_content_fit obj content_fit)

  method set_keep_aspect_ratio : bool -> unit =
    fun keep_aspect_ratio ->
      (Picture.set_keep_aspect_ratio obj keep_aspect_ratio)

  method set_resource : string option -> unit =
    fun resource_path ->
      (Picture.set_resource obj resource_path)

  method as_widget = (Picture.as_widget obj)
    method as_picture = obj
end

