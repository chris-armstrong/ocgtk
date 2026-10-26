class type settings_schema_t = object
  method get_id : unit -> string
  method get_key : string -> Raw.Settings_schema_key.t
  method get_path : unit -> string option
  method has_key : string -> bool
  method list_children : unit -> string array
  method list_keys : unit -> string array
  method ref : unit -> Raw.Settings_schema.t
  method as_settings_schema : Raw.Settings_schema.t
end

(* High-level class for SettingsSchema *)
class settings_schema (obj : Raw.Settings_schema.t) : settings_schema_t =
  object (self)
    method get_id : unit -> string = fun () -> Raw.Settings_schema.get_id obj

    method get_key : string -> Raw.Settings_schema_key.t =
      fun name -> Raw.Settings_schema.get_key obj name

    method get_path : unit -> string option =
      fun () -> Raw.Settings_schema.get_path obj

    method has_key : string -> bool =
      fun name -> Raw.Settings_schema.has_key obj name

    method list_children : unit -> string array =
      fun () -> Raw.Settings_schema.list_children obj

    method list_keys : unit -> string array =
      fun () -> Raw.Settings_schema.list_keys obj

    method ref : unit -> Raw.Settings_schema.t =
      fun () -> Raw.Settings_schema.ref obj

    method as_settings_schema = obj
  end
