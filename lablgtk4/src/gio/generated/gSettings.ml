(* Signal class defined in gsettings_signals.ml *)

(* High-level class for Settings *)
class settings (obj : Settings.t) = object (self)
  inherit Gsettings_signals.settings_signals obj

  method apply : unit -> unit =
    fun () ->
      (Settings.apply obj)

  method delay : unit -> unit =
    fun () ->
      (Settings.delay obj)

  method get_boolean : string -> bool =
    fun key ->
      (Settings.get_boolean obj key)

  method get_child : string -> settings =
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

  method get_uint : string -> int =
    fun key ->
      (Settings.get_uint obj key)

  method is_writable : string -> bool =
    fun name ->
      (Settings.is_writable obj name)

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

  method set_uint : string -> int -> bool =
    fun key value ->
      (Settings.set_uint obj key value)

  method backend = new GSettings_backend.settings_backend (Settings.get_backend obj)

  method delay_apply = Settings.get_delay_apply obj

  method path = Settings.get_path obj

  method schema = Settings.get_schema obj

  method schema_id = Settings.get_schema_id obj

  method settings_schema = Settings.get_settings_schema obj

    method as_settings = obj
end

