(** This is an opaque structure type. You may not access it directly.

    Its methods, signals and properties are on
    {!class-type-settings_schema_source_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Settings_schema_source}. *)

(** The methods, signals and properties of a [GSettingsSchemaSource]. *)
class type settings_schema_source_t = object
  method lookup : string -> bool -> Raw.Settings_schema.t option
  (** Looks up a schema with the identifier [schema_id] in [source].

      This function is not required for normal uses of [GSettings] but it may be
      useful to authors of plugin management systems or to those who want to
      introspect the content of schemas.

      If the schema isn't found directly in [source] and [recursive] is [TRUE]
      then the parent sources will also be checked.

      If the schema isn't found, [NULL] is returned. *)

  method ref : unit -> Raw.Settings_schema_source.t
  (** Increase the reference count of [source], returning a new reference. *)

  method as_settings_schema_source : Raw.Settings_schema_source.t
end

class settings_schema_source :
  Raw.Settings_schema_source.t ->
  settings_schema_source_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Settings_schema_source.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSettingsSchemaSource], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_from_directory :
  string ->
  Raw.Settings_schema_source.t option ->
  bool ->
  (settings_schema_source_t, GError.t) result
(** Attempts to create a new schema source corresponding to the contents of the
    given directory.

    This function is not required for normal uses of [GSettings] but it may be
    useful to authors of plugin management systems.

    The directory should contain a file called [gschemas.compiled] as produced
    by the \[glib-compile-schemas\]\[glib-compile-schemas\] tool.

    If [trusted] is [TRUE] then [gschemas.compiled] is trusted not to be
    corrupted. This assumption has a performance advantage, but can result in
    crashes or inconsistent behaviour in the case of a corrupted file.
    Generally, you should set [trusted] to [TRUE] for files installed by the
    system and to [FALSE] for files in the home directory.

    In either case, an empty file or some types of corruption in the file will
    result in [G_FILE_ERROR_INVAL] being returned.

    If [parent] is non-[NULL] then there are two effects.

    First, if g_settings_schema_source_lookup() is called with the [recursive]
    flag set to [TRUE] and the schema can not be found in the source, the lookup
    will recurse to the parent.

    Second, any references to other schemas specified within this source (ie:
    [child] or [extends]) references may be resolved from the [parent].

    For this second reason, except in very unusual situations, the [parent]
    should probably be given as the default schema source, as returned by
    g_settings_schema_source_get_default(). *)
