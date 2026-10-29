class type settings_schema_t = object
  (** {2:methods Methods} *)

  method get_id : unit -> string
  (** Get the ID of [schema]. *)

  method get_key : string -> Raw.Settings_schema_key.t
  (** Gets the key named [name] from [schema].

      It is a programmer error to request a key that does not exist. See
      g_settings_schema_list_keys(). *)

  method get_path : unit -> string option
  (** Gets the path associated with [schema], or [None].

      Schemas may be single-instance or relocatable. Single-instance schemas
      correspond to exactly one set of keys in the backend database: those
      located at the path returned by this function.

      Relocatable schemas can be referenced by other schemas and can therefore
      describe multiple sets of keys at different locations. For relocatable
      schemas, this function will return [None]. *)

  method has_key : string -> bool
  (** Checks if [schema] has a key named [name]. *)

  method list_children : unit -> string array
  (** Gets the list of children in [schema]. *)

  method list_keys : unit -> string array
  [@@ocaml.doc
    "Introspects the list of keys on [schema].\n\n\
     You should probably not be calling this function from \"normal\" code\n\
     (since you should already know what keys are in your schema).  This\n\
     function is intended for introspection reasons."]

  method ref : unit -> Raw.Settings_schema.t
  (** Increase the reference count of [schema], returning a new reference. *)

  (** {2:conversions Conversions} *)

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
