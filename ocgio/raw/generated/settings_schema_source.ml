(* GENERATED CODE - DO NOT EDIT *)
(* SettingsSchemaSource: SettingsSchemaSource *)

(** This is an opaque structure type. You may not access it directly.

    The class built on this module is in {!Ocgio.Settings_schema_source}. *)

type t = [ `settings_schema_source ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_settings_schema_source_get_type"

external new_from_directory : string -> t option -> bool -> (t, GError.t) result
  = "ml_g_settings_schema_source_new_from_directory"
(** Attempts to create a new schema source corresponding to the contents of the
    given directory.

    This function is not required for normal uses of
    {{!Ocgio.Raw.Settings}[GSettings]} but it may be useful to authors of plugin
    management systems.

    The directory should contain a file called [gschemas.compiled] as produced
    by the \[glib-compile-schemas\]\[glib-compile-schemas\] tool.

    If [trusted] is [true] then [gschemas.compiled] is trusted not to be
    corrupted. This assumption has a performance advantage, but can result in
    crashes or inconsistent behaviour in the case of a corrupted file.
    Generally, you should set [trusted] to [true] for files installed by the
    system and to [false] for files in the home directory.

    In either case, an empty file or some types of corruption in the file will
    result in [G_FILE_ERROR_INVAL] being returned.

    If [parent] is non-[None] then there are two effects.

    First, if
    {{!Ocgio.Raw.Settings_schema_source.val-lookup}[g_settings_schema_source_lookup
                                                    ()]} is called with the
    [recursive] flag set to [true] and the schema can not be found in the
    source, the lookup will recurse to the parent.

    Second, any references to other schemas specified within this source (ie:
    [child] or [extends]) references may be resolved from the [parent].

    For this second reason, except in very unusual situations, the [parent]
    should probably be given as the default schema source, as returned by
    [g_settings_schema_source_get_default ()]. *)

(* Methods *)

external ref : t -> t = "ml_g_settings_schema_source_ref"
(** Increase the reference count of [source], returning a new reference. *)

external lookup : t -> string -> bool -> Settings_schema.t option
  = "ml_g_settings_schema_source_lookup"
(** Looks up a schema with the identifier [schema_id] in [source].

    This function is not required for normal uses of
    {{!Ocgio.Raw.Settings}[GSettings]} but it may be useful to authors of plugin
    management systems or to those who want to introspect the content of
    schemas.

    If the schema isn't found directly in [source] and [recursive] is [true]
    then the parent sources will also be checked.

    If the schema isn't found, [None] is returned. *)
