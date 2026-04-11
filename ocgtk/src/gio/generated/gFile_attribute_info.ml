class type file_attribute_info_t = object
    method as_file_attribute_info : File_attribute_info.t
end

(* High-level class for FileAttributeInfo *)
class file_attribute_info (obj : File_attribute_info.t) : file_attribute_info_t = object (self)

    method as_file_attribute_info = obj
end

