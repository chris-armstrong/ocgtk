class type settings_schema_key_t = object
    method get_description : unit -> string option
    method get_name : unit -> string
    method get_summary : unit -> string option
    method ref : unit -> Settings_schema_key.t
    method unref : unit -> unit
    method as_settings_schema_key : Settings_schema_key.t
end

(* High-level class for SettingsSchemaKey *)
class settings_schema_key (obj : Settings_schema_key.t) : settings_schema_key_t = object (self)

  method get_description : unit -> string option =
    fun () ->
      (Settings_schema_key.get_description obj)

  method get_name : unit -> string =
    fun () ->
      (Settings_schema_key.get_name obj)

  method get_summary : unit -> string option =
    fun () ->
      (Settings_schema_key.get_summary obj)

  method ref : unit -> Settings_schema_key.t =
    fun () ->
      (Settings_schema_key.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Settings_schema_key.unref obj)

    method as_settings_schema_key = obj
end

