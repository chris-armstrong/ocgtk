class type file_list_t = object
    method as_file_list : File_list.t
end

class file_list : File_list.t -> file_list_t

val new_from_array : Ocgtk_gio.Gio.Wrappers.File.t array -> int -> file_list_t
