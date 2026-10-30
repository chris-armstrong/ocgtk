class type settings_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a key has potentially changed.

      You should call one of the [Gio.Settings.get] calls to check the new
      value.

      This signal supports detailed connections. You can connect to the detailed
      signal [changed::x] in order to only receive callbacks when key [x]
      changes.

      Note that [settings] only emits this signal if you have read [key] at
      least once while a signal handler was already connected for [key]. *)

  method on_writable_change_event :
    ?after:bool ->
    callback:(key:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once per writability change event that affects this settings
      object.

      You should connect to this signal if you are interested in viewing groups
      of changes before they are split out into multiple emissions of the
      [Gio.Settings::writable-changed] signal. For most use cases it is more
      appropriate to use the [Gio.Settings::writable-changed] signal.

      In the event that the writability change applies only to a single key,
      [key] will be set to the [GLib.Quark] for that key. In the event that the
      writability change affects the entire settings object, [key] will be [0].

      The default handler for this signal invokes the
      [Gio.Settings::writable-changed] and [Gio.Settings::changed] signals for
      each affected key. This is done because changes in writability might also
      imply changes in value (if for example, a new mandatory setting is
      introduced). If any other connected handler returns true then this default
      functionality will be suppressed. *)

  method on_writable_changed :
    ?after:bool ->
    callback:(key:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the writability of a key has potentially changed.

      You should call [Gio.Settings.is_writable] in order to determine the new
      status.

      This signal supports detailed connections. You can connect to the detailed
      signal [writable-changed::x] in order to only receive callbacks when the
      writability of [x] changes. *)

  (** {2:methods Methods} *)

  method apply : unit -> unit
  (** Applies any changes that have been made to the settings.

      This function does nothing unless [settings] is in ‘delay-apply’ mode. In
      the normal case settings are always applied immediately. *)

  method bind :
    string ->
    [ `object_ ] Gobject.obj ->
    string ->
    Enums.settingsbindflags ->
    unit
  (** Create a binding between the [key] in the [settings] object and the
      property [property] of [object].

      The binding uses the default GIO mapping functions to map between the
      settings and property values. These functions handle booleans, numeric
      types and string types in a straightforward way. Use
      [Gio.Settings.bind_with_mapping] if you need a custom mapping, or map
      between types that are not supported by the default mapping functions.

      Unless the [flags] include [Gio.SettingsBindFlags.NO_SENSITIVITY], this
      function also establishes a binding between the writability of [key] and
      the [sensitive] property of [object] (if [object] has a boolean property
      by that name). See [Gio.Settings.bind_writable] for more details about
      writable bindings.

      Note that the lifecycle of the binding is tied to [object], and that you
      can have only one binding per object property. If you bind the same
      property twice on the same object, the second binding overrides the first
      one. *)

  method bind_writable :
    string -> [ `object_ ] Gobject.obj -> string -> bool -> unit
  (** Create a binding between the writability of [key] in the [settings] object
      and the property [property] of [object].

      The property must be boolean; [sensitive] or [visible] properties of
      widgets are the most likely candidates.

      Writable bindings are always uni-directional; changes of the writability
      of the setting will be propagated to the object property, not the other
      way.

      When the [inverted] argument is true, the binding inverts the value as it
      passes from the setting to the object, i.e. [property] will be set to true
      if the key is not writable.

      Note that the lifecycle of the binding is tied to [object], and that you
      can have only one binding per object property. If you bind the same
      property twice on the same object, the second binding overrides the first
      one. *)

  method create_action : string -> Action.action_t
  (** Creates a [Gio.Action] corresponding to a given [Gio.Settings] key.

      The action has the same name as the key.

      The value of the key becomes the state of the action and the action is
      enabled when the key is writable. Changing the state of the action results
      in the key being written to. Changes to the value or writability of the
      key cause appropriate change notifications to be emitted for the action.

      For boolean-valued keys, action activations take no parameter and result
      in the toggling of the value. For all other types, activations take the
      new value for the key (which must have the correct type). *)

  method delay : unit -> unit
  (** Changes the [Gio.Settings] object into ‘delay-apply’ mode.

      In this mode, changes to [settings] are not immediately propagated to the
      backend, but kept locally until [Gio.Settings.apply] is called. *)

  method get_boolean : string -> bool
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for booleans.

      It is a programmer error to give a [key] that isn’t specified as having a
      [b] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_child : string -> settings_t
  (** Creates a child settings object which has a base path of [base-path/name],
      where [base-path] is the base path of [settings] and [name] is as
      specified by the caller.

      The schema for the child settings object must have been declared in the
      schema of [settings] using a [<child>] element.

      The created child settings object will inherit the
      [Gio.Settings:delay-apply] mode from [settings]. *)

  method get_default_value : string -> Gvariant.t option
  (** Gets the ‘default value’ of a key.

      This is the value that would be read if [Gio.Settings.reset] were to be
      called on the key.

      Note that this may be a different value than returned by
      [Gio.SettingsSchemaKey.get_default_value] if the system administrator has
      provided a default value.

      Comparing the return values of [Gio.Settings.get_default_value] and
      [Gio.Settings.get_value] is not sufficient for determining if a value has
      been set because the user may have explicitly set the value to something
      that happens to be equal to the default. The difference here is that if
      the default changes in the future, the user’s key will still be set.

      This function may be useful for adding an indication to a UI of what the
      default value was before the user set it.

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings]. *)

  method get_double : string -> float
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for doubles.

      It is a programmer error to give a [key] that isn’t specified as having a
      [d] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_enum : string -> int
  (** Gets the value that is stored in [settings] for [key] and converts it to
      the enum value that it represents.

      In order to use this function the type of the value must be a string and
      it must be marked in the schema file as an enumerated type.

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings] or is not marked as an enumerated type.

      If the value stored in the configuration database is not a valid value for
      the enumerated type then this function will return the default value. *)

  method get_flags : string -> int
  (** Gets the value that is stored in [settings] for [key] and converts it to
      the flags value that it represents.

      In order to use this function the type of the value must be an array of
      strings and it must be marked in the schema file as a flags type.

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings] or is not marked as a flags type.

      If the value stored in the configuration database is not a valid value for
      the flags type then this function will return the default value. *)

  method get_has_unapplied : unit -> bool
  (** Returns whether the [Gio.Settings] object has any unapplied changes.

      This can only be the case if it is in ‘delay-apply’ mode. *)

  method get_int : string -> int
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for 32-bit integers.

      It is a programmer error to give a [key] that isn’t specified as having an
      [i] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_int64 : string -> int64
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for 64-bit integers.

      It is a programmer error to give a [key] that isn’t specified as having an
      [x] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_range : string -> Gvariant.t
  (** Queries the range of a key. *)

  method get_string : string -> string
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for strings.

      It is a programmer error to give a [key] that isn’t specified as having an
      [s] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_strv : string -> string array
  (** A convenience variant of [Gio.Settings.get] for string arrays.

      It is a programmer error to give a [key] that isn’t specified as having an
      [as] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_uint : string -> int
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for 32-bit unsigned integers.

      It is a programmer error to give a [key] that isn’t specified as having a
      [u] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_uint64 : string -> UInt64.t
  (** Gets the value that is stored at [key] in [settings].

      A convenience variant of [Gio.Settings.get] for 64-bit unsigned integers.

      It is a programmer error to give a [key] that isn’t specified as having a
      [t] type in the schema for [settings] (see [GLib.VariantType]). *)

  method get_user_value : string -> Gvariant.t option
  (** Checks the ‘user value’ of a key, if there is one.

      The user value of a key is the last value that was set by the user.

      After calling [Gio.Settings.reset] this function should always return
      [None] (assuming something is not wrong with the system configuration).

      It is possible that [Gio.Settings.get_value] will return a different value
      than this function. This can happen in the case that the user set a value
      for a key that was subsequently locked down by the system administrator —
      this function will return the user’s old value.

      This function may be useful for adding a ‘reset’ option to a UI or for
      providing indication that a particular value has been changed.

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings]. *)

  method get_value : string -> Gvariant.t
  (** Gets the value that is stored in [settings] for [key].

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings]. *)

  method is_writable : string -> bool
  (** Finds out if a key can be written. *)

  method list_children : unit -> string array
  (** Gets the list of children on [settings].

      The list is exactly the list of strings for which it is not an error to
      call [Gio.Settings.get_child].

      There is little reason to call this function from ‘normal’ code, since you
      should already know what children are in your schema. This function may
      still be useful there for introspection reasons, however.

      You should free the return value with [GLib.strfreev] when you are done
      with it. *)

  method list_keys : unit -> string array
  (** Introspects the list of keys on [settings].

      You should probably not be calling this function from ‘normal’ code (since
      you should already know what keys are in your schema). This function is
      intended for introspection reasons.

      You should free the return value with [GLib.strfreev] when you are done
      with it. *)

  method range_check : string -> Gvariant.t -> bool
  (** Checks if the given [value] is of the correct type and within the
      permitted range for [key]. *)

  method reset : string -> unit
  (** Resets [key] to its default value.

      This call resets the key, as much as possible, to its default value. That
      might be the value specified in the schema or the one set by the
      administrator. *)

  method revert : unit -> unit
  (** Reverts all unapplied changes to the settings.

      This function does nothing unless [settings] is in ‘delay-apply’ mode. In
      the normal case settings are always applied immediately.

      Change notifications will be emitted for affected keys. *)

  method set_boolean : string -> bool -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for booleans.

      It is a programmer error to give a [key] that isn’t specified as having a
      [b] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_double : string -> float -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for doubles.

      It is a programmer error to give a [key] that isn’t specified as having a
      [d] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_enum : string -> int -> bool
  (** Looks up the enumerated type nick for [value] and writes it to [key],
      within [settings].

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings] or is not marked as an enumerated type, or for
      [value] not to be a valid value for the named type.

      After performing the write, accessing [key] directly with
      [Gio.Settings.get_string] will return the ‘nick’ associated with [value].
  *)

  method set_flags : string -> int -> bool
  (** Looks up the flags type nicks for the bits specified by [value], puts them
      in an array of strings and writes the array to [key], within [settings].

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings] or is not marked as a flags type, or for [value] to
      contain any bits that are not value for the named type.

      After performing the write, accessing [key] directly with
      [Gio.Settings.get_strv] will return an array of ‘nicks’; one for each bit
      in [value]. *)

  method set_int : string -> int -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for 32-bit integers.

      It is a programmer error to give a [key] that isn’t specified as having an
      [i] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_int64 : string -> int64 -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for 64-bit integers.

      It is a programmer error to give a [key] that isn’t specified as having an
      [x] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_string : string -> string -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for strings.

      It is a programmer error to give a [key] that isn’t specified as having an
      [s] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_strv : string -> string array option -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for string arrays. If [value]
      is [None], then [key] is set to be the empty array.

      It is a programmer error to give a [key] that isn’t specified as having an
      [as] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_uint : string -> int -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for 32-bit unsigned integers.

      It is a programmer error to give a [key] that isn’t specified as having a
      [u] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_uint64 : string -> UInt64.t -> bool
  (** Sets [key] in [settings] to [value].

      A convenience variant of [Gio.Settings.set] for 64-bit unsigned integers.

      It is a programmer error to give a [key] that isn’t specified as having a
      [t] type in the schema for [settings] (see [GLib.VariantType]). *)

  method set_value : string -> Gvariant.t -> bool
  (** Sets [key] in [settings] to [value].

      It is a programmer error to give a [key] that isn’t contained in the
      schema for [settings] or for [value] to have the incorrect type, per the
      schema.

      If [value] is floating then this function consumes the reference. *)

  (** {2:properties Properties} *)

  method delay_apply : bool
  (** Whether the [Gio.Settings] object is in ‘delay-apply’ mode. *)

  method path : string
  (** The path within the backend where the settings are stored. *)

  method schema : string
  (** The name of the schema that describes the types of keys for this
      [Gio.Settings] object.

      The type of this property is {i not} [Gio.SettingsSchema].
      [Gio.SettingsSchema] has only existed since version 2.32 and unfortunately
      this name was used in previous versions to refer to the schema ID rather
      than the schema itself. Take care to use the
      [Gio.Settings:settings-schema] property if you wish to pass in a
      [Gio.SettingsSchema]. *)

  method schema_id : string
  (** The name of the schema that describes the types of keys for this
      [Gio.Settings] object. *)

  method settings_schema : Raw.Settings_schema.t
  (** The [Gio.SettingsSchema] describing the types of keys for this
      [Gio.Settings] object.

      Ideally, this property would be called [Gio.Settings:schema].
      [Gio.SettingsSchema] has only existed since version 2.32, however, and
      before then the [Gio.Settings:schema] property was used to refer to the ID
      of the schema rather than the schema itself. Take care. *)

  (** {2:conversions Conversions} *)

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
