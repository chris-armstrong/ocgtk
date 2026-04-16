class type settings_schema_t = object
  method get_id : unit -> string
  method get_key : string -> Settings_schema_key.t
  method get_path : unit -> string option
  method has_key : string -> bool
  method list_children : unit -> string array
  method list_keys : unit -> string array
  method ref : unit -> Settings_schema.t
  method unref : unit -> unit
  method as_settings_schema : Settings_schema.t
end

(* High-level class for SettingsSchema *)
class settings_schema (obj : Settings_schema.t) : settings_schema_t =
  object (self)
    method get_id : unit -> string = fun () -> Settings_schema.get_id obj

    method get_key : string -> Settings_schema_key.t =
      fun name -> Settings_schema.get_key obj name

    method get_path : unit -> string option =
      fun () -> Settings_schema.get_path obj

    method has_key : string -> bool =
      fun name -> Settings_schema.has_key obj name

    method list_children : unit -> string array =
      fun () -> Settings_schema.list_children obj

    method list_keys : unit -> string array =
      fun () -> Settings_schema.list_keys obj

    method ref : unit -> Settings_schema.t = fun () -> Settings_schema.ref obj
    method unref : unit -> unit = fun () -> Settings_schema.unref obj
    method as_settings_schema = obj
  end
