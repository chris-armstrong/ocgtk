class type file_chooser_native_t = object
    method get_accept_label : unit -> string option
    method get_cancel_label : unit -> string option
    method set_accept_label : string option -> unit
    method set_cancel_label : string option -> unit
    method as_file_chooser_native : File_chooser_native.t
end

class file_chooser_native : File_chooser_native.t -> file_chooser_native_t

