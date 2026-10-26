class type file_attribute_info_t = object
  method as_file_attribute_info : Raw.File_attribute_info.t
end

(* High-level class for FileAttributeInfo *)
class file_attribute_info (obj : Raw.File_attribute_info.t) :
  file_attribute_info_t =
  object (self)
    method as_file_attribute_info = obj
  end
