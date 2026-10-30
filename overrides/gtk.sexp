(overrides
  (library "Gtk")

  ;; GIR doesn't tag these two members with a `version` attribute even though
  ;; they postdate the enum's baseline (confirmed via GTK gitlab source
  ;; history: builder_trace landed in gtkdebug.h in the 4.18.0 cycle, dial
  ;; landed in gtkpadcontroller.h in the 4.20.0 cycle).
  (bitfield DebugFlags
     (member builder_trace (version "4.18"))
     )
  (enumeration PadActionType
     (member dial (version "4.20"))
     )

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
