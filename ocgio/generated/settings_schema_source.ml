class type settings_schema_source_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_settings_schema_source : Raw.Settings_schema_source.t
end

(* High-level class for SettingsSchemaSource *)
class settings_schema_source (obj : Raw.Settings_schema_source.t) :
  settings_schema_source_t =
  object (self)
    method lookup : string -> bool -> Raw.Settings_schema.t option =
      fun schema_id recursive ->
        Raw.Settings_schema_source.lookup obj schema_id recursive

    method ref : unit -> Raw.Settings_schema_source.t =
      fun () -> Raw.Settings_schema_source.ref obj

    method as_settings_schema_source = obj
  end

let new_from_directory (directory : string)
    (parent : Raw.Settings_schema_source.t option) (trusted : bool) :
    (settings_schema_source_t, GError.t) result =
  let obj_ =
    Raw.Settings_schema_source.new_from_directory directory parent trusted
  in
  Result.map (fun obj_ -> new settings_schema_source obj_) obj_
