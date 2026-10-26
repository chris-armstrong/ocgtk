class type file_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t
  method get_file : unit -> App_info_cycle_64c425a0.file_t
  method as_file_icon : Raw.File_icon.t
end

class file_icon : Raw.File_icon.t -> file_icon_t

val new_ : App_info_cycle_64c425a0.file_t -> file_icon_t
