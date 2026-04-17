class type builder_t = object
    method add_from_file : string -> (bool, GError.t) result
    method add_from_resource : string -> (bool, GError.t) result
    method add_from_string : string -> int -> (bool, GError.t) result
    method add_objects_from_file : string -> string array -> (bool, GError.t) result
    method add_objects_from_resource : string -> string array -> (bool, GError.t) result
    method add_objects_from_string : string -> int -> string array -> (bool, GError.t) result
    method expose_object : string -> [`object_] Gobject.obj -> unit
    method extend_with_template : [`object_] Gobject.obj -> int -> string -> int -> (bool, GError.t) result
    method get_current_object : unit -> [`object_] Gobject.obj option
    method get_object : string -> [`object_] Gobject.obj option
    method get_objects : unit -> [`object_] Gobject.obj list
    method get_scope : unit -> GBuilder_scope.builder_scope_t
    method get_translation_domain : unit -> string option
    method get_type_from_name : string -> int
    method set_current_object : [`object_] Gobject.obj option -> unit
    method set_scope : GBuilder_scope.builder_scope_t option -> unit
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

  method add_from_string : string -> int -> (bool, GError.t) result =
    fun buffer length ->
      (Builder.add_from_string obj buffer length)

  method add_objects_from_file : string -> string array -> (bool, GError.t) result =
    fun filename object_ids ->
      (Builder.add_objects_from_file obj filename object_ids)

  method add_objects_from_resource : string -> string array -> (bool, GError.t) result =
    fun resource_path object_ids ->
      (Builder.add_objects_from_resource obj resource_path object_ids)

  method add_objects_from_string : string -> int -> string array -> (bool, GError.t) result =
    fun buffer length object_ids ->
      (Builder.add_objects_from_string obj buffer length object_ids)

  method expose_object : string -> [`object_] Gobject.obj -> unit =
    fun name object_ ->
      (Builder.expose_object obj name object_)

  method extend_with_template : [`object_] Gobject.obj -> int -> string -> int -> (bool, GError.t) result =
    fun object_ template_type buffer length ->
      (Builder.extend_with_template obj object_ template_type buffer length)

  method get_current_object : unit -> [`object_] Gobject.obj option =
    fun () ->
      (Builder.get_current_object obj)

  method get_object : string -> [`object_] Gobject.obj option =
    fun name ->
      (Builder.get_object obj name)

  method get_objects : unit -> [`object_] Gobject.obj list =
    fun () ->
      (Builder.get_objects obj)

  method get_scope : unit -> GBuilder_scope.builder_scope_t =
    fun () ->
      new  GBuilder_scope.builder_scope(Builder.get_scope obj)

  method get_translation_domain : unit -> string option =
    fun () ->
      (Builder.get_translation_domain obj)

  method get_type_from_name : string -> int =
    fun type_name ->
      (Builder.get_type_from_name obj type_name)

  method set_current_object : [`object_] Gobject.obj option -> unit =
    fun current_object ->
      (Builder.set_current_object obj current_object)

  method set_scope : GBuilder_scope.builder_scope_t option -> unit =
    fun scope ->
      let scope = Option.map (fun (c) -> c#as_builder_scope) scope in
      (Builder.set_scope obj scope)

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

let new_from_string (string : string) (length : int) : builder_t =
  let obj_ = Builder.new_from_string string length in
  new builder obj_

