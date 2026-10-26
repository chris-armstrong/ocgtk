class type file_attribute_info_t = object
  method as_file_attribute_info : Raw.File_attribute_info.t
end

class file_attribute_info : Raw.File_attribute_info.t -> file_attribute_info_t
