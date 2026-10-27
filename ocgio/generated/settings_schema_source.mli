(** This is an opaque structure type. You may not access it directly.

    Its methods, signals and properties are on
    {!class-type-settings_schema_source_t}. The functions it is built on are in
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

val new_from_directory :
  string ->
  Raw.Settings_schema_source.t option ->
  bool ->
  (settings_schema_source_t, GError.t) result
