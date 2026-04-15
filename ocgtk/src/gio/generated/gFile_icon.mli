class type file_icon_t = object
    inherit GIcon.icon_t
    inherit GLoadable_icon.loadable_icon_t
    method get_file : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method as_file_icon : File_icon.t
end

class file_icon : File_icon.t -> file_icon_t

val new_ : GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t -> file_icon_t
