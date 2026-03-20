class type file_list_t = object
    method as_file_list : File_list.t
end

(* High-level class for FileList *)
class file_list (obj : File_list.t) : file_list_t = object (self)

    method as_file_list = obj
end

