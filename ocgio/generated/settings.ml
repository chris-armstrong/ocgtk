class type settings_t = object
  method on_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_writable_change_event :
    ?after:bool ->
    callback:(key:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_writable_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method apply : unit -> unit

  method bind :
    string ->
    [ `object_ ] Gobject.obj ->
    string ->
    Enums.settingsbindflags ->
    unit

  method bind_writable :
    string -> [ `object_ ] Gobject.obj -> string -> bool -> unit

  method create_action : string -> Action.action_t
  method delay : unit -> unit
  method get_boolean : string -> bool
  method get_child : string -> settings_t
  method get_default_value : string -> Gvariant.t option
  method get_double : string -> float
  method get_enum : string -> int
  method get_flags : string -> int
  method get_has_unapplied : unit -> bool
  method get_int : string -> int
  method get_int64 : string -> int64
  method get_range : string -> Gvariant.t
  method get_string : string -> string
  method get_strv : string -> string array
  method get_uint : string -> int
  method get_uint64 : string -> UInt64.t
  method get_user_value : string -> Gvariant.t option
  method get_value : string -> Gvariant.t
  method is_writable : string -> bool
  method list_children : unit -> string array
  method list_keys : unit -> string array
  method range_check : string -> Gvariant.t -> bool
  method reset : string -> unit
  method revert : unit -> unit
  method set_boolean : string -> bool -> bool
  method set_double : string -> float -> bool
  method set_enum : string -> int -> bool
  method set_flags : string -> int -> bool
  method set_int : string -> int -> bool
  method set_int64 : string -> int64 -> bool
  method set_string : string -> string -> bool
  method set_strv : string -> string array option -> bool
  method set_uint : string -> int -> bool
  method set_uint64 : string -> UInt64.t -> bool
  method set_value : string -> Gvariant.t -> bool
  method delay_apply : bool
  method path : string
  method schema : string
  method schema_id : string
  method settings_schema : Raw.Settings_schema.t
  method as_settings : Raw.Settings.t
end

(* High-level class for Settings *)
class settings (obj : Raw.Settings.t) : settings_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Settings.on_changed ~after self#as_settings ~callback

    method on_writable_change_event ?(after = false) ~callback () =
      Raw.Settings.on_writable_change_event ~after self#as_settings ~callback

    method on_writable_changed ?(after = false) ~callback () =
      Raw.Settings.on_writable_changed ~after self#as_settings ~callback

    method apply : unit -> unit = fun () -> Raw.Settings.apply obj

    method bind :
        string ->
        [ `object_ ] Gobject.obj ->
        string ->
        Enums.settingsbindflags ->
        unit =
      fun key object_ property flags ->
        Raw.Settings.bind obj key object_ property flags

    method bind_writable :
        string -> [ `object_ ] Gobject.obj -> string -> bool -> unit =
      fun key object_ property inverted ->
        Raw.Settings.bind_writable obj key object_ property inverted

    method create_action : string -> Action.action_t =
      fun key -> new Action.action (Raw.Settings.create_action obj key)

    method delay : unit -> unit = fun () -> Raw.Settings.delay obj

    method get_boolean : string -> bool =
      fun key -> Raw.Settings.get_boolean obj key

    method get_child : string -> settings_t =
      fun name -> new settings (Raw.Settings.get_child obj name)

    method get_default_value : string -> Gvariant.t option =
      fun key -> Raw.Settings.get_default_value obj key

    method get_double : string -> float =
      fun key -> Raw.Settings.get_double obj key

    method get_enum : string -> int = fun key -> Raw.Settings.get_enum obj key
    method get_flags : string -> int = fun key -> Raw.Settings.get_flags obj key

    method get_has_unapplied : unit -> bool =
      fun () -> Raw.Settings.get_has_unapplied obj

    method get_int : string -> int = fun key -> Raw.Settings.get_int obj key

    method get_int64 : string -> int64 =
      fun key -> Raw.Settings.get_int64 obj key

    method get_range : string -> Gvariant.t =
      fun key -> Raw.Settings.get_range obj key

    method get_string : string -> string =
      fun key -> Raw.Settings.get_string obj key

    method get_strv : string -> string array =
      fun key -> Raw.Settings.get_strv obj key

    method get_uint : string -> int = fun key -> Raw.Settings.get_uint obj key

    method get_uint64 : string -> UInt64.t =
      fun key -> Raw.Settings.get_uint64 obj key

    method get_user_value : string -> Gvariant.t option =
      fun key -> Raw.Settings.get_user_value obj key

    method get_value : string -> Gvariant.t =
      fun key -> Raw.Settings.get_value obj key

    method is_writable : string -> bool =
      fun name -> Raw.Settings.is_writable obj name

    method list_children : unit -> string array =
      fun () -> Raw.Settings.list_children obj

    method list_keys : unit -> string array =
      fun () -> Raw.Settings.list_keys obj

    method range_check : string -> Gvariant.t -> bool =
      fun key value -> Raw.Settings.range_check obj key value

    method reset : string -> unit = fun key -> Raw.Settings.reset obj key
    method revert : unit -> unit = fun () -> Raw.Settings.revert obj

    method set_boolean : string -> bool -> bool =
      fun key value -> Raw.Settings.set_boolean obj key value

    method set_double : string -> float -> bool =
      fun key value -> Raw.Settings.set_double obj key value

    method set_enum : string -> int -> bool =
      fun key value -> Raw.Settings.set_enum obj key value

    method set_flags : string -> int -> bool =
      fun key value -> Raw.Settings.set_flags obj key value

    method set_int : string -> int -> bool =
      fun key value -> Raw.Settings.set_int obj key value

    method set_int64 : string -> int64 -> bool =
      fun key value -> Raw.Settings.set_int64 obj key value

    method set_string : string -> string -> bool =
      fun key value -> Raw.Settings.set_string obj key value

    method set_strv : string -> string array option -> bool =
      fun key value -> Raw.Settings.set_strv obj key value

    method set_uint : string -> int -> bool =
      fun key value -> Raw.Settings.set_uint obj key value

    method set_uint64 : string -> UInt64.t -> bool =
      fun key value -> Raw.Settings.set_uint64 obj key value

    method set_value : string -> Gvariant.t -> bool =
      fun key value -> Raw.Settings.set_value obj key value

    method delay_apply = Raw.Settings.get_delay_apply obj
    method path = Raw.Settings.get_path obj
    method schema = Raw.Settings.get_schema obj
    method schema_id = Raw.Settings.get_schema_id obj
    method settings_schema = Raw.Settings.get_settings_schema obj
    method as_settings = obj
  end

let new_ (schema_id : string) : settings_t =
  let obj_ = Raw.Settings.new_ schema_id in
  new settings obj_

let new_with_path (schema_id : string) (path : string) : settings_t =
  let obj_ = Raw.Settings.new_with_path schema_id path in
  new settings obj_
