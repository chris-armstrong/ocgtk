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
    method set_translation_domain : string option -> unit
    method as_builder : Builder.t
end

class builder : Builder.t -> builder_t

val new_ : unit -> builder_t
val new_from_file : string -> builder_t
val new_from_resource : string -> builder_t
val new_from_string : string -> int -> builder_t
