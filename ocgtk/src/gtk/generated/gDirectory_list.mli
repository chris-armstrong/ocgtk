class type directory_list_t = object
    method get_attributes : unit -> string option
    method get_file : unit -> Ocgtk_gio.Gio.File.file_t option
    method get_io_priority : unit -> int
    method get_monitored : unit -> bool
    method is_loading : unit -> bool
    method set_attributes : string option -> unit
    method set_file : Ocgtk_gio.Gio.File.file_t option -> unit
    method set_io_priority : int -> unit
    method set_monitored : bool -> unit
    method item_type : int
    method loading : bool
    method n_items : int
    method as_directory_list : Directory_list.t
end

class directory_list : Directory_list.t -> directory_list_t

val new_ : string option -> Ocgtk_gio.Gio.File.file_t option -> directory_list_t
