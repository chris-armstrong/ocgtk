(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class file (obj : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t) = object (self)

  method delete : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.delete obj cancellable)

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

  method open_readwrite : 'p1. (#GCancellable.cancellable as 'p1) option -> (GFile_io_stream.file_io_stream, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_io_stream.file_io_stream ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.open_readwrite obj cancellable)

  method query_exists : 'p1. (#GCancellable.cancellable as 'p1) option -> bool =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_exists obj cancellable)

  method query_filesystem_info : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.query_filesystem_info obj attributes cancellable)

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

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_sort_key obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.get_uuid obj)

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

  method get_identifier : string -> string option =
    fun kind ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_identifier obj kind)

  method get_name : unit -> string =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_name obj)

  method get_sort_key : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_sort_key obj)

  method get_uuid : unit -> string option =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.get_uuid obj)

  method should_automount : unit -> bool =
    fun () ->
      (File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.should_automount obj)

    method as_volume = obj
end
