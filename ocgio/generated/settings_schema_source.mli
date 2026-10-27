(** This is an opaque structure type. You may not access it directly.

    Its methods, signals and properties are on
    {!class-type-settings_schema_source_t}. The functions it is built on are in
    {!Ocgio.Raw.Settings_schema_source}. *)

(** The methods, signals and properties of a [GSettingsSchemaSource]. *)
class type settings_schema_source_t = object
  method lookup : string -> bool -> Raw.Settings_schema.t option
  method ref : unit -> Raw.Settings_schema_source.t
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
