class type file_list_t = object
    method get_files : unit -> Ocgtk_gio.Gio.File.file_t list
    method as_file_list : File_list.t
end

(* High-level class for FileList *)
class file_list (obj : File_list.t) : file_list_t = object (self)

  method get_files : unit -> Ocgtk_gio.Gio.File.file_t list =
    fun () ->
      (List.map (fun ret -> new Ocgtk_gio.Gio.File.file ret))(File_list.get_files obj)

    method as_file_list = obj
end

let new_from_array (files : Ocgtk_gio.Gio.Wrappers.File.t array) (n_files : Gsize.t) : file_list_t =
  let obj_ = File_list.new_from_array files n_files in
  new file_list obj_

let new_from_list (files : Ocgtk_gio.Gio.Wrappers.File.t list) : file_list_t =
  let obj_ = File_list.new_from_list files in
  new file_list obj_

