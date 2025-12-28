(* High-level class for FileIcon *)
class file_icon (obj : File_icon.t) = object (self)

  method get_file : unit -> GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file =
    fun () ->
      new  GFile_and__file_enumerator_and__file_monitor_and__mount_and__volume.file(File_icon.get_file obj)

    method as_file_icon = obj
end

