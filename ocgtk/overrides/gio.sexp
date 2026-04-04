(overrides
  (library "Gio")

  (enumeration DBusError
    (unknown_object (version "2.42"))
    (unknown_interface (version "2.42"))
    (unknown_property (version "2.42"))
    (property_read_only (version "2.42"))
  )

  (enumeration FileAttributeType
    (stringv (version "2.22"))
  )

  (enumeration FileMonitorEvent
    (renamed (version "2.46"))
    (moved_in (version "2.46"))
    (moved_out (version "2.46"))
  )

  (enumeration IOErrorEnum
    (too_many_open_files (version "2.20"))
    (not_initialized (version "2.22"))
    (address_in_use (version "2.22"))
    (partial_input (version "2.24"))
    (invalid_data (version "2.24"))
    (dbus_error (version "2.26"))
    (host_unreachable (version "2.26"))
    (network_unreachable (version "2.26"))
    (connection_refused (version "2.26"))
    (proxy_failed (version "2.26"))
    (proxy_auth_failed (version "2.26"))
    (proxy_need_auth (version "2.26"))
    (proxy_not_allowed (version "2.26"))
    (broken_pipe (version "2.36"))
    (connection_closed (version "2.44"))
    (not_connected (version "2.44"))
    (message_too_large (version "2.48"))
    (no_such_device (version "2.74"))
    (destination_unset (version "2.80"))
  )

  (enumeration TlsChannelBindingType
    (exporter (version "2.74"))
  )

  (enumeration TlsError
    (inappropriate_fallback (version "2.60"))
    (bad_certificate_password (version "2.72"))
  )

  (bitfield AppInfoCreateFlags
    (supports_startup_notification (version "2.26"))
  )

  (bitfield ApplicationFlags
    (default_flags (version "2.74"))
    (non_unique (version "2.30"))
    (can_override_app_id (version "2.48"))
    (allow_replacement (version "2.60"))
    (replace (version "2.60"))
  )

  (bitfield AskPasswordFlags
    (tcrypt (version "2.58"))
  )

  (bitfield BusNameOwnerFlags
    (do_not_queue (version "2.54"))
  )

  (bitfield DBusCallFlags
    (allow_interactive_authorization (version "2.46"))
  )

  (bitfield DBusConnectionFlags
    (authentication_require_same_user (version "2.68"))
    (cross_namespace (version "2.74"))
  )

  (bitfield DBusMessageFlags
    (allow_interactive_authorization (version "2.46"))
  )

  (bitfield DBusProxyFlags
    (get_invalidated_properties (version "2.32"))
    (no_match_rule (version "2.72"))
  )

  (bitfield DBusServerFlags
    (authentication_require_same_user (version "2.68"))
  )

  (bitfield FileCopyFlags
    (target_default_modified_time (version "2.80"))
  )

  (bitfield FileCreateFlags
    (replace_destination (version "2.20"))
  )

  (bitfield FileMonitorFlags
    (watch_hard_links (version "2.36"))
    (watch_moves (version "2.46"))
  )

  (bitfield SubprocessFlags
    (search_path_from_envp (version "2.72"))
  )

  (bitfield TlsCertificateFlags
    (no_flags (version "2.74"))
  )

  (bitfield TlsPasswordFlags
    (pkcs11_user (version "2.70"))
    (pkcs11_security_officer (version "2.70"))
    (pkcs11_context_specific (version "2.70"))
  )

  (record AppInfoIface
    (can_delete (version "2.20"))
    (do_delete (version "2.20"))
    (get_commandline (version "2.20"))
    (get_display_name (version "2.24"))
    (launch_uris_async (version "2.60"))
    (launch_uris_finish (version "2.60"))
  )

  (record ApplicationClass
    (run_mainloop (version "2.32"))
    (dbus_register (version "2.34"))
    (dbus_unregister (version "2.34"))
    (handle_local_options (version "2.40"))
    (name_lost (version "2.60"))
  )

  (record DriveIface
    (get_start_stop_type (version "2.22"))
    (can_start (version "2.22"))
    (can_start_degraded (version "2.22"))
    (start (version "2.22"))
    (start_finish (version "2.22"))
    (can_stop (version "2.22"))
    (stop (version "2.22"))
    (stop_finish (version "2.22"))
    (stop_button (version "2.22"))
    (eject_with_operation (version "2.22"))
    (eject_with_operation_finish (version "2.22"))
    (get_sort_key (version "2.32"))
    (get_symbolic_icon (version "2.34"))
    (is_removable (version "2.50"))
  )

  (record DtlsConnectionInterface
    (set_advertised_protocols (version "2.60"))
    (get_negotiated_protocol (version "2.60"))
    (get_binding_data (version "2.66"))
  )

  (record FileIface
    (move_async (version "2.72"))
    (move_finish (version "2.72"))
    (open_readwrite (version "2.22"))
    (open_readwrite_async (version "2.22"))
    (open_readwrite_finish (version "2.22"))
    (create_readwrite (version "2.22"))
    (create_readwrite_async (version "2.22"))
    (create_readwrite_finish (version "2.22"))
    (replace_readwrite (version "2.22"))
    (replace_readwrite_async (version "2.22"))
    (replace_readwrite_finish (version "2.22"))
    (start_mountable (version "2.22"))
    (start_mountable_finish (version "2.22"))
    (stop_mountable (version "2.22"))
    (stop_mountable_finish (version "2.22"))
    (supports_thread_contexts (version "2.22"))
    (unmount_mountable_with_operation (version "2.22"))
    (unmount_mountable_with_operation_finish (version "2.22"))
    (eject_mountable_with_operation (version "2.22"))
    (eject_mountable_with_operation_finish (version "2.22"))
    (poll_mountable (version "2.22"))
    (poll_mountable_finish (version "2.22"))
    (measure_disk_usage (version "2.38"))
    (measure_disk_usage_async (version "2.38"))
    (measure_disk_usage_finish (version "2.38"))
  )

  (record IconIface
    (to_tokens (version "2.20"))
    (from_tokens (version "2.20"))
    (serialize (version "2.38"))
  )

  (record MountIface
    (unmount_with_operation (version "2.22"))
    (unmount_with_operation_finish (version "2.22"))
    (eject_with_operation (version "2.22"))
    (eject_with_operation_finish (version "2.22"))
    (get_default_location (version "2.24"))
    (get_sort_key (version "2.32"))
    (get_symbolic_icon (version "2.34"))
  )

  (record SocketConnectableIface
    (to_string (version "2.48"))
  )

  (record TlsConnectionClass
    (get_binding_data (version "2.66"))
    (get_negotiated_protocol (version "2.70"))
  )

  (record VolumeIface
    (eject_with_operation (version "2.22"))
    (eject_with_operation_finish (version "2.22"))
    (get_sort_key (version "2.32"))
    (get_symbolic_icon (version "2.34"))
  )
)
