(* High-level class for BuilderListItemFactory *)
class builder_list_item_factory (obj : Builder_list_item_factory.t) = object (self)

  method get_resource : unit -> string option = fun () -> (Builder_list_item_factory.get_resource obj )

  method get_scope : unit -> GBuilder_scope.builder_scope option = fun () -> Option.map (fun ret -> new GBuilder_scope.builder_scope ret) (Builder_list_item_factory.get_scope obj )

    method as_builder_list_item_factory = obj
end

