class file : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t ->
  object
    method delete : #GCancellable.cancellable option -> (bool, GError.t) result
    method get_parse_name : unit -> string
    method get_uri : unit -> string
    method get_uri_scheme : unit -> string option
    method has_uri_scheme : string -> bool
    method hash : unit -> int
    method is_native : unit -> bool
    method make_directory : #GCancellable.cancellable option -> (bool, GError.t) result
    method make_directory_with_parents : #GCancellable.cancellable option -> (bool, GError.t) result
    method open_readwrite : #GCancellable.cancellable option -> (GFile_io_stream.file_io_stream, GError.t) result
    method query_exists : #GCancellable.cancellable option -> bool
    method query_filesystem_info : string -> #GCancellable.cancellable option -> (GFile_info.file_info, GError.t) result
    method query_settable_attributes : #GCancellable.cancellable option -> (File_attribute_info_list.t, GError.t) result
    method query_writable_namespaces : #GCancellable.cancellable option -> (File_attribute_info_list.t, GError.t) result
    method read : #GCancellable.cancellable option -> (GFile_input_stream.file_input_stream, GError.t) result
    method supports_thread_contexts : unit -> bool
    method trash : #GCancellable.cancellable option -> (bool, GError.t) result
    method as_file : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File.t
  end

and file_enumerator : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t ->
  object
    method close : #GCancellable.cancellable option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method next_file : #GCancellable.cancellable option -> (GFile_info.file_info option, GError.t) result
    method set_pending : bool -> unit
    method as_file_enumerator : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_enumerator.t
  end

and file_monitor : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t ->
  object
    inherit Gfile_monitor_signals.file_monitor_signals
    method cancel : unit -> bool
    method is_cancelled : unit -> bool
    method set_rate_limit : int -> unit
    method cancelled : bool
    method as_file_monitor : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.File_monitor.t
  end

and mount : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t ->
  object
    inherit Gmount_signals.mount_signals
    method can_eject : unit -> bool
    method can_unmount : unit -> bool
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_uuid : unit -> string option
    method is_shadowed : unit -> bool
    method shadow : unit -> unit
    method unshadow : unit -> unit
    method as_mount : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Mount.t
  end

and volume : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t ->
  object
    inherit Gvolume_signals.volume_signals
    method can_eject : unit -> bool
    method can_mount : unit -> bool
    method get_identifier : string -> string option
    method get_name : unit -> string
    method get_sort_key : unit -> string option
    method get_uuid : unit -> string option
    method should_automount : unit -> bool
    method as_volume : File_and__file_enumerator_and__file_monitor_and__mount_and__volume.Volume.t
  end
