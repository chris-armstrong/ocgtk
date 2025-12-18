(* High-level class for Picture *)
class picture (obj : Picture.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Picture.as_widget obj)

  method alternative_text = Picture.get_alternative_text obj
  method set_alternative_text v = Picture.set_alternative_text obj v

  method can_shrink = Picture.get_can_shrink obj
  method set_can_shrink v = Picture.set_can_shrink obj v

  method keep_aspect_ratio = Picture.get_keep_aspect_ratio obj
  method set_keep_aspect_ratio v = Picture.set_keep_aspect_ratio obj v

  method get_content_fit : unit -> Gtk_enums.contentfit = fun () -> (Picture.get_content_fit obj )

  method set_content_fit : Gtk_enums.contentfit -> unit = fun content_fit -> (Picture.set_content_fit obj content_fit)

  method set_filename : string option -> unit = fun filename -> (Picture.set_filename obj filename)

  method set_resource : string option -> unit = fun resource_path -> (Picture.set_resource obj resource_path)

  method as_widget = (Picture.as_widget obj)
    method as_picture = obj
end

