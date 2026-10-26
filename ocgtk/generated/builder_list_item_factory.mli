class type builder_list_item_factory_t = object
  inherit List_item_factory.list_item_factory_t
  method get_bytes : unit -> Glib_bytes.t
  method get_resource : unit -> string option
  method get_scope : unit -> Builder_scope.builder_scope_t option
  method as_builder_list_item_factory : Raw.Builder_list_item_factory.t
end

class builder_list_item_factory :
  Raw.Builder_list_item_factory.t ->
  builder_list_item_factory_t

val new_from_bytes :
  Builder_scope.builder_scope_t option ->
  Glib_bytes.t ->
  builder_list_item_factory_t

val new_from_resource :
  Builder_scope.builder_scope_t option -> string -> builder_list_item_factory_t
