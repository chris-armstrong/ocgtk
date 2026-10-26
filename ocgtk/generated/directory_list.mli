class type directory_list_t = object
  inherit Ocgio.List_model.list_model_t
  method get_attributes : unit -> string option
  method get_error : unit -> GError.t option
  method get_file : unit -> Ocgio.File.file_t option
  method get_io_priority : unit -> int
  method get_monitored : unit -> bool
  method is_loading : unit -> bool
  method set_attributes : string option -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_io_priority : int -> unit
  method set_monitored : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_directory_list : Raw.Directory_list.t
end

class directory_list : Raw.Directory_list.t -> directory_list_t

val new_ : string option -> Ocgio.File.file_t option -> directory_list_t
