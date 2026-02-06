(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class file (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t) = object (self)

  method append_to : 'p1. Gio_enums.filecreateflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_output_stream.file_output_stream, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.append_to obj flags cancellable)

  method build_attribute_list_for_copy : 'p1. Gio_enums.filecopyflags -> (#GCancellable.cancellable as 'p1) option -> (string, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.build_attribute_list_for_copy obj flags cancellable)

  method create : 'p1. Gio_enums.filecreateflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_output_stream.file_output_stream, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create obj flags cancellable)

  method create_readwrite : 'p1. Gio_enums.filecreateflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_io_stream.file_io_stream, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.create_readwrite obj flags cancellable)

  method delete : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.delete obj cancellable)

  method dup : unit -> file =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.dup obj)

  method enumerate_children : 'p1. string -> Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p1) option -> (file_enumerator, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_enumerator ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.enumerate_children obj attributes flags cancellable)

  method find_enclosing_mount : 'p1. (#GCancellable.cancellable as 'p1) option -> (mount, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new mount ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.find_enclosing_mount obj cancellable)

  method get_child : string -> file =
    fun name ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child obj name)

  method get_child_for_display_name : string -> (file, GError.t) result =
    fun display_name ->
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_child_for_display_name obj display_name)

  method get_parent : unit -> file option =
    fun () ->
      Option.map (fun ret -> new file ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parent obj)

  method get_parse_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_parse_name obj)

  method get_uri : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri obj)

  method get_uri_scheme : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.get_uri_scheme obj)

  method has_uri_scheme : string -> bool =
    fun uri_scheme ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.has_uri_scheme obj uri_scheme)

  method hash : unit -> int =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.hash obj)

  method is_native : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.is_native obj)

  method make_directory : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory obj cancellable)

  method make_directory_with_parents : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_directory_with_parents obj cancellable)

  method make_symbolic_link : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun symlink_value cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.make_symbolic_link obj symlink_value cancellable)

  method monitor : 'p1. Gio_enums.filemonitorflags -> (#GCancellable.cancellable as 'p1) option -> (file_monitor, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor obj flags cancellable)

  method monitor_directory : 'p1. Gio_enums.filemonitorflags -> (#GCancellable.cancellable as 'p1) option -> (file_monitor, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_directory obj flags cancellable)

  method monitor_file : 'p1. Gio_enums.filemonitorflags -> (#GCancellable.cancellable as 'p1) option -> (file_monitor, GError.t) result =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file_monitor ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.monitor_file obj flags cancellable)

  method open_readwrite : 'p1. (#GCancellable.cancellable as 'p1) option -> (GFile_io_stream.file_io_stream, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.open_readwrite obj cancellable)

  method peek_path : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.peek_path obj)

  method query_default_handler : 'p1. (#GCancellable.cancellable as 'p1) option -> (GApp_info_and__app_launch_context.app_info, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GApp_info_and__app_launch_context.app_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_default_handler obj cancellable)

  method query_exists : 'p1. (#GCancellable.cancellable as 'p1) option -> bool =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_exists obj cancellable)

  method query_file_type : 'p1. Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p1) option -> Gio_enums.filetype =
    fun flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_file_type obj flags cancellable)

  method query_filesystem_info : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_filesystem_info obj attributes cancellable)

  method query_info : 'p1. string -> Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info, GError.t) result =
    fun attributes flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_info obj attributes flags cancellable)

  method query_settable_attributes : 'p1. (#GCancellable.cancellable as 'p1) option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_settable_attributes obj cancellable)

  method query_writable_namespaces : 'p1. (#GCancellable.cancellable as 'p1) option -> (File_attribute_info_list.t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_writable_namespaces obj cancellable)

  method read : 'p1. (#GCancellable.cancellable as 'p1) option -> (GFile_input_stream.file_input_stream, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_input_stream.file_input_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.read obj cancellable)

  method replace : 'p1. string option -> bool -> Gio_enums.filecreateflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_output_stream.file_output_stream, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_output_stream.file_output_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace obj etag make_backup flags cancellable)

  method replace_readwrite : 'p1. string option -> bool -> Gio_enums.filecreateflags -> (#GCancellable.cancellable as 'p1) option -> (GFile_io_stream.file_io_stream, GError.t) result =
    fun etag make_backup flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.replace_readwrite obj etag make_backup flags cancellable)

  method resolve_relative_path : string -> file =
    fun relative_path ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.resolve_relative_path obj relative_path)

  method set_attribute_byte_string : 'p1. string -> string -> Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_byte_string obj attribute value flags cancellable)

  method set_attribute_string : 'p1. string -> string -> Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun attribute value flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attribute_string obj attribute value flags cancellable)

  method set_attributes_from_info : 'p1 'p2. (#GFile_info.file_info as 'p1) -> Gio_enums.filequeryinfoflags -> (#GCancellable.cancellable as 'p2) option -> (bool, GError.t) result =
    fun info flags cancellable ->
      let info = info#as_file_info in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_attributes_from_info obj info flags cancellable)

  method set_display_name : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (file, GError.t) result =
    fun display_name cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new file ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.set_display_name obj display_name cancellable)

  method supports_thread_contexts : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.supports_thread_contexts obj)

  method trash : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.trash obj cancellable)

    method as_file = obj
end

and file_enumerator (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t) = object (self)

  method close : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.close obj cancellable)

  method get_child : 'p1. (#GFile_info.file_info as 'p1) -> file =
    fun info ->
      let info = info#as_file_info in
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_child obj info)

  method get_container : unit -> file =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.get_container obj)

  method has_pending : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.has_pending obj)

  method is_closed : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.is_closed obj)

  method next_file : 'p1. (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GFile_info.file_info ret) ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.next_file obj cancellable)

  method set_pending : bool -> unit =
    fun pending ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.set_pending obj pending)

    method as_file_enumerator = obj
end
(* Signal class defined in gfile_monitor_signals.ml *)


and file_monitor (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t) = object (self)
  inherit Gfile_monitor_signals.file_monitor_signals obj

  method cancel : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.cancel obj)

  method is_cancelled : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.is_cancelled obj)

  method set_rate_limit : int -> unit =
    fun limit_msecs ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.set_rate_limit obj limit_msecs)

  method cancelled = File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.get_cancelled obj

    method as_file_monitor = obj
end
(* Signal class defined in gmount_signals.ml *)


and mount (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t) = object (self)
  inherit Gmount_signals.mount_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_eject obj)

  method can_unmount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.can_unmount obj)

  method get_default_location : unit -> file =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_default_location obj)

  method get_drive : unit -> GDrive.drive option =
    fun () ->
      Option.map (fun ret -> new GDrive.drive ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_drive obj)

  method get_icon : unit -> GIcon.icon =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_icon obj)

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_name obj)

  method get_root : unit -> file =
    fun () ->
      new  file(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_root obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_uuid obj)

  method get_volume : unit -> volume option =
    fun () ->
      Option.map (fun ret -> new volume ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_volume obj)

  method guess_content_type_sync : 'p1. bool -> (#GCancellable.cancellable as 'p1) option -> (string array, GError.t) result =
    fun force_rescan cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.guess_content_type_sync obj force_rescan cancellable)

  method is_shadowed : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.is_shadowed obj)

  method shadow : unit -> unit =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.shadow obj)

  method unshadow : unit -> unit =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.unshadow obj)

    method as_mount = obj
end
(* Signal class defined in gvolume_signals.ml *)


and volume (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t) = object (self)
  inherit Gvolume_signals.volume_signals obj

  method can_eject : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_eject obj)

  method can_mount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.can_mount obj)

  method enumerate_identifiers : unit -> string array =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.enumerate_identifiers obj)

  method get_activation_root : unit -> file option =
    fun () ->
      Option.map (fun ret -> new file ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_activation_root obj)

  method get_drive : unit -> GDrive.drive option =
    fun () ->
      Option.map (fun ret -> new GDrive.drive ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_drive obj)

  method get_icon : unit -> GIcon.icon =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_icon obj)

  method get_identifier : string -> string option =
    fun kind ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_identifier obj kind)

  method get_mount : unit -> mount option =
    fun () ->
      Option.map (fun ret -> new mount ret) (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_mount obj)

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_sort_key obj)

  method get_symbolic_icon : unit -> GIcon.icon =
    fun () ->
      new  GIcon.icon(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_symbolic_icon obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_uuid obj)

  method should_automount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.should_automount obj)

    method as_volume = obj
end
