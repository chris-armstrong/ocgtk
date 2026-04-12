class type file_icon_t = object
    inherit GIcon.icon_t
    inherit GLoadable_icon.loadable_icon_t
    method get_file : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t
    method as_file_icon : File_icon.t
end

(* High-level class for FileIcon *)
class file_icon (obj : File_icon.t) : file_icon_t = object (self)
  inherit GIcon.icon (Icon.from_gobject obj)
  inherit GLoadable_icon.loadable_icon (Loadable_icon.from_gobject obj)

  method get_file : unit -> GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t =
    fun () ->
      new  GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(File_icon.get_file obj)

    method as_file_icon = obj
end

let new_ (file : GApp_info_and__app_launch_context_and__drive_and__file_and__file_enumerator_and__file_monitor_and__mount_and__volume.file_t) : file_icon_t =
  let file = file#as_file in
  let obj_ = File_icon.new_ file in
  new file_icon obj_

