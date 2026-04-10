class type file_list_t = object
    method as_file_list : File_list.t
end

(* High-level class for FileList *)
class file_list (obj : File_list.t) : file_list_t = object (self)

    method as_file_list = obj
end

let new_from_array (files : Ocgtk_gio.Gio.Wrappers.File.t array) (n_files : Gsize.t) : file_list_t =
  let obj_ = File_list.new_from_array files n_files in
  new file_list obj_

