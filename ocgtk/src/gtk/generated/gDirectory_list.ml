class type directory_list_t = object
    method get_attributes : unit -> string option
    method get_file : unit -> Ocgtk_gio.Gio.file_t option
    method get_io_priority : unit -> int
    method get_monitored : unit -> bool
    method is_loading : unit -> bool
    method set_attributes : string option -> unit
    method set_file : Ocgtk_gio.Gio.file_t option -> unit
    method set_io_priority : int -> unit
    method set_monitored : bool -> unit
    method loading : bool
    method n_items : int
    method as_directory_list : Directory_list.t
end

(* High-level class for DirectoryList *)
class directory_list (obj : Directory_list.t) : directory_list_t = object (self)

  method get_attributes : unit -> string option =
    fun () ->
      (Directory_list.get_attributes obj)

  method get_file : unit -> Ocgtk_gio.Gio.file_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.file ret) (Directory_list.get_file obj)

  method get_io_priority : unit -> int =
    fun () ->
      (Directory_list.get_io_priority obj)

  method get_monitored : unit -> bool =
    fun () ->
      (Directory_list.get_monitored obj)

  method is_loading : unit -> bool =
    fun () ->
      (Directory_list.is_loading obj)

  method set_attributes : string option -> unit =
    fun attributes ->
      (Directory_list.set_attributes obj attributes)

  method set_file : Ocgtk_gio.Gio.file_t option -> unit =
    fun file ->
      let file = Option.map (fun (c) -> c#as_file) file in
      (Directory_list.set_file obj file)

  method set_io_priority : int -> unit =
    fun io_priority ->
      (Directory_list.set_io_priority obj io_priority)

  method set_monitored : bool -> unit =
    fun monitored ->
      (Directory_list.set_monitored obj monitored)

  method loading = Directory_list.get_loading obj

  method n_items = Directory_list.get_n_items obj

    method as_directory_list = obj
end

