class image : Image.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method clear : unit -> unit
    method get_icon_name : unit -> string option
    method get_icon_size : unit -> Gtk_enums.iconsize
    method get_pixel_size : unit -> int
    method get_storage_type : unit -> Gtk_enums.imagetype
    method set_from_file : string option -> unit
    method set_from_icon_name : string option -> unit
    method set_from_resource : string option -> unit
    method set_icon_size : Gtk_enums.iconsize -> unit
    method set_pixel_size : int -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_image : Image.t
  end

