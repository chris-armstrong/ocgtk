(overrides
  (library "Gtk")

  ;; Migrated from exclude_list.ml should_skip_class skip_list
  (class PrintJob (ignore))
  (class PrintUnixDialog (ignore))
  (class PageSetupUnixDialog (ignore))
  (class Printer (ignore))
  ;; Note: PixbufNonAnim → gdkpixbuf.sexp, BroadwayRenderer/NglRenderer → gsk.sexp,
  ;; SettingsBackend → gio.sexp (each ignored in their correct namespace)

  ;; Migrated from exclude_list.ml platform_specific_type_exclude_list
  ;; PageSetupUnixDialog and PrintUnixDialog already above
  (class PageSetup (ignore))
  (class PrintSettings (ignore))
  (class PrintContext (ignore))
  (class PrintOperation (ignore))
  ;; PrintCapabilities is a bitfield, not a class
  (bitfield PrintCapabilities (ignore))
  ;; PrintOperationPreview is an interface, not a class
  (interface PrintOperationPreview (ignore))
  (enumeration License (ignore))

  ;; Migrated from filtering.ml property_exclude_list
  (class IconPaintable
    (property is-symbolic (ignore))
  )

  ;; Migrated from filtering.ml banned_records
  ;; Note: PixbufModule/PixbufModulePattern → gdkpixbuf.sexp
  (record PrintBackend (ignore))

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
