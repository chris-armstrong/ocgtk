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

(* High-level class for DirectoryList *)
class directory_list (obj : Raw.Directory_list.t) : directory_list_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_attributes : unit -> string option =
      fun () -> Raw.Directory_list.get_attributes obj

    method get_error : unit -> GError.t option =
      fun () -> Raw.Directory_list.get_error obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Directory_list.get_file obj)

    method get_io_priority : unit -> int =
      fun () -> Raw.Directory_list.get_io_priority obj

    method get_monitored : unit -> bool =
      fun () -> Raw.Directory_list.get_monitored obj

    method is_loading : unit -> bool =
      fun () -> Raw.Directory_list.is_loading obj

    method set_attributes : string option -> unit =
      fun attributes -> Raw.Directory_list.set_attributes obj attributes

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.Directory_list.set_file obj file

    method set_io_priority : int -> unit =
      fun io_priority -> Raw.Directory_list.set_io_priority obj io_priority

    method set_monitored : bool -> unit =
      fun monitored -> Raw.Directory_list.set_monitored obj monitored

    method item_type = Raw.Directory_list.get_item_type obj
    method n_items = Raw.Directory_list.get_n_items obj
    method as_directory_list = obj
  end

let new_ (attributes : string option) (file : Ocgio.File.file_t option) :
    directory_list_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Directory_list.new_ attributes file in
  new directory_list obj_
