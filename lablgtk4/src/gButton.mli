class button_skel : Button.t ->
  object
    inherit GObj.widget_impl
    method connect : Gbutton_signals.button_signals
    method get_can_shrink : unit -> bool
    method can_shrink : unit -> bool
    method get_child : unit -> Gtk.widget option
    method child : unit -> Gtk.widget option
    method get_has_frame : unit -> bool
    method has_frame : unit -> bool
    method get_icon_name : unit -> string option
    method icon_name : unit -> string option
    method get_label : unit -> string option
    method label : unit -> string option
    method get_use_underline : unit -> bool
    method use_underline : unit -> bool
    method set_can_shrink : bool -> unit
    method set_child : Gtk.widget option -> unit
    method set_has_frame : bool -> unit
    method set_icon_name : string -> unit
    method set_label : string -> unit
    method set_use_underline : bool -> unit
  end

class button : Button.t ->
  object
    inherit button_skel
  end
