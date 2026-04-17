class type shortcut_label_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_accelerator : unit -> string option
  method get_disabled_text : unit -> string option
  method set_accelerator : string -> unit
  method set_disabled_text : string -> unit
  method as_shortcut_label : Shortcut_label.t
end

class shortcut_label : Shortcut_label.t -> shortcut_label_t

val new_ : string -> shortcut_label_t
