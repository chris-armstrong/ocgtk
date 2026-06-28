class type file_icon_t = object
  inherit GIcon.icon_t
  inherit GLoadable_icon.loadable_icon_t
  method get_file : unit -> GApp_info_cycle_64c425a0.file_t
  method as_file_icon : File_icon.t
end

class file_icon : File_icon.t -> file_icon_t

val new_ : GApp_info_cycle_64c425a0.file_t -> file_icon_t
