class type shortcut_label_t = object
    method get_accelerator : unit -> string option
    method get_disabled_text : unit -> string option
    method set_accelerator : string -> unit
    method set_disabled_text : string -> unit
    method as_shortcut_label : Shortcut_label.t
end

class shortcut_label : Shortcut_label.t -> shortcut_label_t

