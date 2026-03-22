class type print_dialog_t = object
    method get_accept_label : unit -> string
    method get_modal : unit -> bool
    method get_title : unit -> string
    method print_file_finish : Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result
    method print_finish : Ocgtk_gio.Gio.Async_result.async_result_t -> (Ocgtk_gio.Gio.Output_stream.output_stream_t option, GError.t) result
    method set_accept_label : string -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method setup_finish : Ocgtk_gio.Gio.Async_result.async_result_t -> (Print_setup.t option, GError.t) result
    method as_print_dialog : Print_dialog.t
end

class print_dialog : Print_dialog.t -> print_dialog_t

val new_ : unit -> print_dialog_t
