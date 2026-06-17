class type file_list_t = object
  method get_files : unit -> Ocgtk_gio.Gio.File.file_t list
  method as_file_list : File_list.t
end

class file_list : File_list.t -> file_list_t

val new_from_array :
  Ocgtk_gio.Gio.Wrappers.File.t array -> Gsize.t -> file_list_t

val new_from_list : Ocgtk_gio.Gio.Wrappers.File.t list -> file_list_t
