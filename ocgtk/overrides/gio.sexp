(overrides
  (library "Gio")

  ;; GSettingsBackend requires #define G_SETTINGS_ENABLE_BACKEND before
  ;; including gsettingsbackend.h — not suitable for general use
  (class SettingsBackend (ignore))

  (enumeration DBusError
    (member unknown_object (version "2.42"))
    (member unknown_interface (version "2.42"))
    (member unknown_property (version "2.42"))
    (member property_read_only (version "2.42"))
  )

  (enumeration FileAttributeType
    (member stringv (version "2.22"))
  )

  (enumeration FileMonitorEvent
    (member renamed (version "2.46"))
    (member moved_in (version "2.46"))
    (member moved_out (version "2.46"))
  )

  (enumeration IOErrorEnum
    (member too_many_open_files (version "2.20"))
    (member not_initialized (version "2.22"))
    (member address_in_use (version "2.22"))
    (member partial_input (version "2.24"))
    (member invalid_data (version "2.24"))
    (member dbus_error (version "2.26"))
    (member host_unreachable (version "2.26"))
    (member network_unreachable (version "2.26"))
    (member connection_refused (version "2.26"))
    (member proxy_failed (version "2.26"))
    (member proxy_auth_failed (version "2.26"))
    (member proxy_need_auth (version "2.26"))
    (member proxy_not_allowed (version "2.26"))
    (member broken_pipe (version "2.36"))
    (member connection_closed (version "2.44"))
    (member not_connected (version "2.44"))
    (member message_too_large (version "2.48"))
    (member no_such_device (version "2.74"))
    (member destination_unset (version "2.80"))
  )

  (enumeration TlsChannelBindingType
    (member exporter (version "2.74"))
  )

  (enumeration TlsError
    (member inappropriate_fallback (version "2.60"))
    (member bad_certificate_password (version "2.72"))
  )

  (bitfield AppInfoCreateFlags
    (member supports_startup_notification (version "2.26"))
  )

  (bitfield ApplicationFlags
    (member default_flags (version "2.74"))
    (member non_unique (version "2.30"))
    (member can_override_app_id (version "2.48"))
    (member allow_replacement (version "2.60"))
    (member replace (version "2.60"))
  )

  (bitfield AskPasswordFlags
    (member tcrypt (version "2.58"))
  )

  (bitfield BusNameOwnerFlags
    (member do_not_queue (version "2.54"))
  )

  (bitfield DBusCallFlags
    (member allow_interactive_authorization (version "2.46"))
  )

  (bitfield DBusConnectionFlags
    (member authentication_require_same_user (version "2.68"))
    (member cross_namespace (version "2.74"))
  )

  (bitfield DBusMessageFlags
    (member allow_interactive_authorization (version "2.46"))
  )

  (bitfield DBusProxyFlags
    (member get_invalidated_properties (version "2.32"))
    (member no_match_rule (version "2.72"))
  )

  (bitfield DBusServerFlags
    (member authentication_require_same_user (version "2.68"))
  )

  (bitfield FileCopyFlags
    (member target_default_modified_time (version "2.80"))
  )

  (bitfield FileCreateFlags
    (member replace_destination (version "2.20"))
  )

  (bitfield FileMonitorFlags
    (member watch_hard_links (version "2.36"))
    (member watch_moves (version "2.46"))
  )

  (bitfield SubprocessFlags
    (member search_path_from_envp (version "2.72"))
  )

  (bitfield TlsCertificateFlags
    (member no_flags (version "2.74"))
  )

  (bitfield TlsPasswordFlags
    (member pkcs11_user (version "2.70"))
    (member pkcs11_security_officer (version "2.70"))
    (member pkcs11_context_specific (version "2.70"))
  )

  (record AppInfoIface
    (field can_delete (version "2.20"))
    (field do_delete (version "2.20"))
    (field get_commandline (version "2.20"))
    (field get_display_name (version "2.24"))
    (field launch_uris_async (version "2.60"))
    (field launch_uris_finish (version "2.60"))
  )

  (record ApplicationClass
    (field run_mainloop (version "2.32"))
    (field dbus_register (version "2.34"))
    (field dbus_unregister (version "2.34"))
    (field handle_local_options (version "2.40"))
    (field name_lost (version "2.60"))
  )

  (record DriveIface
    (field get_start_stop_type (version "2.22"))
    (field can_start (version "2.22"))
    (field can_start_degraded (version "2.22"))
    (field start (version "2.22"))
    (field start_finish (version "2.22"))
    (field can_stop (version "2.22"))
    (field stop (version "2.22"))
    (field stop_finish (version "2.22"))
    (field stop_button (version "2.22"))
    (field eject_with_operation (version "2.22"))
    (field eject_with_operation_finish (version "2.22"))
    (field get_sort_key (version "2.32"))
    (field get_symbolic_icon (version "2.34"))
    (field is_removable (version "2.50"))
  )

  (record DtlsConnectionInterface
    (field set_advertised_protocols (version "2.60"))
    (field get_negotiated_protocol (version "2.60"))
    (field get_binding_data (version "2.66"))
  )

  (record FileIface
    (field move_async (version "2.72"))
    (field move_finish (version "2.72"))
    (field open_readwrite (version "2.22"))
    (field open_readwrite_async (version "2.22"))
    (field open_readwrite_finish (version "2.22"))
    (field create_readwrite (version "2.22"))
    (field create_readwrite_async (version "2.22"))
    (field create_readwrite_finish (version "2.22"))
    (field replace_readwrite (version "2.22"))
    (field replace_readwrite_async (version "2.22"))
    (field replace_readwrite_finish (version "2.22"))
    (field start_mountable (version "2.22"))
    (field start_mountable_finish (version "2.22"))
    (field stop_mountable (version "2.22"))
    (field stop_mountable_finish (version "2.22"))
    (field supports_thread_contexts (version "2.22"))
    (field unmount_mountable_with_operation (version "2.22"))
    (field unmount_mountable_with_operation_finish (version "2.22"))
    (field eject_mountable_with_operation (version "2.22"))
    (field eject_mountable_with_operation_finish (version "2.22"))
    (field poll_mountable (version "2.22"))
    (field poll_mountable_finish (version "2.22"))
    (field measure_disk_usage (version "2.38"))
    (field measure_disk_usage_async (version "2.38"))
    (field measure_disk_usage_finish (version "2.38"))
  )

  (record IconIface
    (field to_tokens (version "2.20"))
    (field from_tokens (version "2.20"))
    (field serialize (version "2.38"))
  )

  (record MountIface
    (field unmount_with_operation (version "2.22"))
    (field unmount_with_operation_finish (version "2.22"))
    (field eject_with_operation (version "2.22"))
    (field eject_with_operation_finish (version "2.22"))
    (field get_default_location (version "2.24"))
    (field get_sort_key (version "2.32"))
    (field get_symbolic_icon (version "2.34"))
  )

  (record SocketConnectableIface
    (field to_string (version "2.48"))
  )

  (record TlsConnectionClass
    (field get_binding_data (version "2.66"))
    (field get_negotiated_protocol (version "2.70"))
  )

  (record VolumeIface
    (field eject_with_operation (version "2.22"))
    (field eject_with_operation_finish (version "2.22"))
    (field get_sort_key (version "2.32"))
    (field get_symbolic_icon (version "2.34"))
  )
)
