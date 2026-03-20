class type color_dialog_t = object
    method choose_rgba_finish : Ocgtk_gio.Gio.async_result_t -> (Ocgtk_gdk.Gdk.rgb_a_t option, GError.t) result
    method get_modal : unit -> bool
    method get_title : unit -> string
    method get_with_alpha : unit -> bool
    method set_modal : bool -> unit
    method set_title : string -> unit
    method set_with_alpha : bool -> unit
    method as_color_dialog : Color_dialog.t
end

class color_dialog : Color_dialog.t -> color_dialog_t

