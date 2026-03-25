class type builder_t = object
    method add_from_file : string -> (bool, GError.t) result
    method add_from_resource : string -> (bool, GError.t) result
    method add_objects_from_file : string -> string array -> (bool, GError.t) result
    method add_objects_from_resource : string -> string array -> (bool, GError.t) result
    method expose_object : string -> [`object_] Gobject.obj -> unit
    method get_current_object : unit -> [`object_] Gobject.obj option
    method get_object : string -> [`object_] Gobject.obj option
    method get_scope : unit -> GBuilder_scope.builder_scope_t
    method get_translation_domain : unit -> string option
    method set_current_object : [`object_] Gobject.obj option -> unit
    method set_translation_domain : string option -> unit
    method as_builder : Builder.t
end

(* High-level class for Builder *)
class builder (obj : Builder.t) : builder_t = object (self)

  method add_from_file : string -> (bool, GError.t) result =
    fun filename ->
      (Builder.add_from_file obj filename)

  method add_from_resource : string -> (bool, GError.t) result =
    fun resource_path ->
      (Builder.add_from_resource obj resource_path)

  method add_objects_from_file : string -> string array -> (bool, GError.t) result =
    fun filename object_ids ->
      (Builder.add_objects_from_file obj filename object_ids)

  method add_objects_from_resource : string -> string array -> (bool, GError.t) result =
    fun resource_path object_ids ->
      (Builder.add_objects_from_resource obj resource_path object_ids)

  method expose_object : string -> [`object_] Gobject.obj -> unit =
    fun name object_ ->
      (Builder.expose_object obj name object_)

  method get_current_object : unit -> [`object_] Gobject.obj option =
    fun () ->
      (Builder.get_current_object obj)

  method get_object : string -> [`object_] Gobject.obj option =
    fun name ->
      (Builder.get_object obj name)

  method get_scope : unit -> GBuilder_scope.builder_scope_t =
    fun () ->
      new  GBuilder_scope.builder_scope(Builder.get_scope obj)

  method get_translation_domain : unit -> string option =
    fun () ->
      (Builder.get_translation_domain obj)

  method set_current_object : [`object_] Gobject.obj option -> unit =
    fun current_object ->
      (Builder.set_current_object obj current_object)

  method set_translation_domain : string option -> unit =
    fun domain ->
      (Builder.set_translation_domain obj domain)

    method as_builder = obj
end

let new_ () : builder_t =
  new builder (Builder.new_ ())

let new_from_file (filename : string) : builder_t =
  let obj_ = Builder.new_from_file filename in
  new builder obj_

let new_from_resource (resource_path : string) : builder_t =
  let obj_ = Builder.new_from_resource resource_path in
  new builder obj_

