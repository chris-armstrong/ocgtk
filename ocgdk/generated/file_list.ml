class type file_list_t = object
  method get_files : unit -> Ocgio.File.file_t list
  (** Retrieves the list of files inside a [GdkFileList].

      This function is meant for language bindings. *)

  method as_file_list : Raw.File_list.t
end

(* High-level class for FileList *)
class file_list (obj : Raw.File_list.t) : file_list_t =
  object (self)
    method get_files : unit -> Ocgio.File.file_t list =
      fun () ->
        (List.map (fun ret -> new Ocgio.File.file ret))
          (Raw.File_list.get_files obj)

    method as_file_list = obj
  end

let new_from_array (files : Ocgio.Raw.File.t array) (n_files : Gsize.t) :
    file_list_t =
  let obj_ = Raw.File_list.new_from_array files n_files in
  new file_list obj_

let new_from_list (files : Ocgio.Raw.File.t list) : file_list_t =
  let obj_ = Raw.File_list.new_from_list files in
  new file_list obj_
