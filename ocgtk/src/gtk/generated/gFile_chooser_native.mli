class type file_chooser_native_t = object
    inherit GNative_dialog.native_dialog_t
    inherit GFile_chooser.file_chooser_t
    method get_accept_label : unit -> string option
    method get_cancel_label : unit -> string option
    method set_accept_label : string option -> unit
    method set_cancel_label : string option -> unit
    method as_file_chooser_native : File_chooser_native.t
end

class file_chooser_native : File_chooser_native.t -> file_chooser_native_t

val new_ : string option -> GApplication_and__window_and__window_group.window_t option -> Gtk_enums.filechooseraction -> string option -> string option -> file_chooser_native_t
