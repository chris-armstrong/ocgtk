class type file_icon_t = object
    method get_file : unit -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method as_file_icon : File_icon.t
end

class file_icon : File_icon.t -> file_icon_t

