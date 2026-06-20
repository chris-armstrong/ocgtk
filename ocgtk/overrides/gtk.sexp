(overrides
  (library "Gtk")

  ;; Migrated from exclude_list.ml should_skip_class skip_list
  (class PrintJob (ignore))
  (class PrintUnixDialog (ignore))
  (class PageSetupUnixDialog (ignore))
  (class Printer (ignore))
  ;; PrintCapabilities (bitfield) and License (enum) were never generated on main
  ;; (they were skipped at parse time by is_platform_specific_type guard)
  (bitfield PrintCapabilities (ignore))
  (enumeration License (ignore))

  ;; PrintBackend is an internal GTK type not in public headers
  (record PrintBackend (ignore))

  ;; GtkRecentData is a write-only input struct passed to
  ;; gtk_recent_manager_add_full(). Suppressing getters prevents accidental
  ;; reads of fields that are only meaningful when set by the caller.
  (record RecentData
    (field display_name (no_getter))
    (field description (no_getter))
    (field mime_type (no_getter))
    (field app_name (no_getter))
    (field app_exec (no_getter))
    (field groups (no_getter))
    (field is_private (no_getter))
  )

  ;; Migrated from filtering.ml property_exclude_list
  (class IconPaintable
    (property is-symbolic (ignore))
  )

  ;; text-transform uses PangoTextTransform (Pango >= 1.50). The GTK version
  ;; guard (#if GTK_CHECK_VERSION(4,6,0)) is not sufficient because CentOS 9
  ;; ships GTK >= 4.6 with Pango < 1.50. Use a cross-namespace pango version
  ;; guard so the stub is compiled only when Pango 1.50+ is available.
  (class TextTag
    (property text-transform (version (pango "1.50")))
  )

  ;; Migrated from exclude_list.ml variadic_function_exclude_list
  ;; These are class methods (matched by GIR method name, not c_identifier)
  (class TextBuffer
    (method insert_with_tags (ignore))
    (method insert_with_tags_by_name (ignore))
    (method create_tag (ignore))
  )

  ;; Migrated from exclude_list.ml function_exclude_list
  ;; gtk_tree_model_filter_get_virtual_root not present in GTK 4.0 GIR —
  ;; this entry will produce a warning but is kept for documentation
  ;; (function gtk_tree_model_filter_get_virtual_root (ignore))

  ;; The *_value variants of these accessible methods take parallel arrays of
  ;; enum values and GValues. The C stub generator does not yet support arrays
  ;; of enum values (the macro expansion produces invalid C), so skip them.
  ;; The non-_value variants (update_state, update_relation, update_property)
  ;; are variadic and already skipped via the variadic filter.
  (interface Accessible
    (method update_state_value (ignore))
    (method update_relation_value (ignore))
    (method update_property_value (ignore))
  )
)
