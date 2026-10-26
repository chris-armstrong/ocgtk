class type file_list_t = object
  method get_files : unit -> Ocgio.File.file_t list
  method as_file_list : Raw.File_list.t
end

class file_list : Raw.File_list.t -> file_list_t

val new_from_array : Ocgio.Raw.File.t array -> Gsize.t -> file_list_t
val new_from_list : Ocgio.Raw.File.t list -> file_list_t
