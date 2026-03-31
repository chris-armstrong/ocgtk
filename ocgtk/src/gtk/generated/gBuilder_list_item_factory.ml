class type builder_list_item_factory_t = object
    inherit GList_item_factory.list_item_factory_t
    method get_resource : unit -> string option
    method get_scope : unit -> GBuilder_scope.builder_scope_t option
    method as_builder_list_item_factory : Builder_list_item_factory.t
end

(* High-level class for BuilderListItemFactory *)
class builder_list_item_factory (obj : Builder_list_item_factory.t) : builder_list_item_factory_t = object (self)
  inherit GList_item_factory.list_item_factory (obj :> List_item_factory.t)

  method get_resource : unit -> string option =
    fun () ->
      (Builder_list_item_factory.get_resource obj)

  method get_scope : unit -> GBuilder_scope.builder_scope_t option =
    fun () ->
      Option.map (fun ret -> new GBuilder_scope.builder_scope ret) (Builder_list_item_factory.get_scope obj)

    method as_builder_list_item_factory = obj
end

let new_from_resource (scope : GBuilder_scope.builder_scope_t option) (resource_path : string) : builder_list_item_factory_t =
  let scope = Option.map (fun c -> c#as_builder_scope) scope in
  let obj_ = Builder_list_item_factory.new_from_resource scope resource_path in
  new builder_list_item_factory obj_

