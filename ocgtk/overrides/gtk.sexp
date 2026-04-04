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

  ;; Migrated from filtering.ml property_exclude_list
  (class IconPaintable
    (property is-symbolic (ignore))
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
)
