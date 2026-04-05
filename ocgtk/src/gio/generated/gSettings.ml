(* Signal class defined in gsettings_signals.ml *)

class type settings_t = object
    inherit Gsettings_signals.settings_signals
    method apply : unit -> unit
    method bind : string -> [`object_] Gobject.obj -> string -> Gio_enums.settingsbindflags -> unit
    method bind_writable : string -> [`object_] Gobject.obj -> string -> bool -> unit
    method create_action : string -> GAction.action_t
    method delay : unit -> unit
    method get_boolean : string -> bool
    method get_child : string -> settings_t
    method get_double : string -> float
    method get_enum : string -> int
    method get_flags : string -> int
    method get_has_unapplied : unit -> bool
    method get_int : string -> int
    method get_string : string -> string
    method get_strv : string -> string array
    method get_uint : string -> int
    method is_writable : string -> bool
    method list_children : unit -> string array
    method list_keys : unit -> string array
    method reset : string -> unit
    method revert : unit -> unit
    method set_boolean : string -> bool -> bool
    method set_double : string -> float -> bool
    method set_enum : string -> int -> bool
    method set_flags : string -> int -> bool
    method set_int : string -> int -> bool
    method set_string : string -> string -> bool
    method set_strv : string -> string array option -> bool
    method set_uint : string -> int -> bool
    method delay_apply : bool
    method path : string
    method schema : string
    method schema_id : string
    method settings_schema : Settings_schema.t
    method as_settings : Settings.t
end

(* High-level class for Settings *)
class settings (obj : Settings.t) : settings_t = object (self)
  inherit Gsettings_signals.settings_signals obj

  method apply : unit -> unit =
    fun () ->
      (Settings.apply obj)

  method bind : string -> [`object_] Gobject.obj -> string -> Gio_enums.settingsbindflags -> unit =
    fun key object_ property flags ->
      (Settings.bind obj key object_ property flags)

  method bind_writable : string -> [`object_] Gobject.obj -> string -> bool -> unit =
    fun key object_ property inverted ->
      (Settings.bind_writable obj key object_ property inverted)

  method create_action : string -> GAction.action_t =
    fun key ->
      new  GAction.action(Settings.create_action obj key)

  method delay : unit -> unit =
    fun () ->
      (Settings.delay obj)

  method get_boolean : string -> bool =
    fun key ->
      (Settings.get_boolean obj key)

  method get_child : string -> settings_t =
    fun name ->
      new  settings(Settings.get_child obj name)

  method get_double : string -> float =
    fun key ->
      (Settings.get_double obj key)

  method get_enum : string -> int =
    fun key ->
      (Settings.get_enum obj key)

  method get_flags : string -> int =
    fun key ->
      (Settings.get_flags obj key)

  method get_has_unapplied : unit -> bool =
    fun () ->
      (Settings.get_has_unapplied obj)

  method get_int : string -> int =
    fun key ->
      (Settings.get_int obj key)

  method get_string : string -> string =
    fun key ->
      (Settings.get_string obj key)

  method get_strv : string -> string array =
    fun key ->
      (Settings.get_strv obj key)

  method get_uint : string -> int =
    fun key ->
      (Settings.get_uint obj key)

  method is_writable : string -> bool =
    fun name ->
      (Settings.is_writable obj name)

  method list_children : unit -> string array =
    fun () ->
      (Settings.list_children obj)

  method list_keys : unit -> string array =
    fun () ->
      (Settings.list_keys obj)

  method reset : string -> unit =
    fun key ->
      (Settings.reset obj key)

  method revert : unit -> unit =
    fun () ->
      (Settings.revert obj)

  method set_boolean : string -> bool -> bool =
    fun key value ->
      (Settings.set_boolean obj key value)

  method set_double : string -> float -> bool =
    fun key value ->
      (Settings.set_double obj key value)

  method set_enum : string -> int -> bool =
    fun key value ->
      (Settings.set_enum obj key value)

  method set_flags : string -> int -> bool =
    fun key value ->
      (Settings.set_flags obj key value)

  method set_int : string -> int -> bool =
    fun key value ->
      (Settings.set_int obj key value)

  method set_string : string -> string -> bool =
    fun key value ->
      (Settings.set_string obj key value)

  method set_strv : string -> string array option -> bool =
    fun key value ->
      (Settings.set_strv obj key value)

  method set_uint : string -> int -> bool =
    fun key value ->
      (Settings.set_uint obj key value)

  method delay_apply = Settings.get_delay_apply obj

  method path = Settings.get_path obj

  method schema = Settings.get_schema obj

  method schema_id = Settings.get_schema_id obj

  method settings_schema = Settings.get_settings_schema obj

    method as_settings = obj
end

let new_ (schema_id : string) : settings_t =
  let obj_ = Settings.new_ schema_id in
  new settings obj_

let new_with_path (schema_id : string) (path : string) : settings_t =
  let obj_ = Settings.new_with_path schema_id path in
  new settings obj_

