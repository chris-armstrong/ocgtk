class type file_list_t = object
    method as_file_list : File_list.t
end

class file_list : File_list.t -> file_list_t

