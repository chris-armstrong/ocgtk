(* High-level class for BuilderListItemFactory *)
class builder_list_item_factory (obj : Builder_list_item_factory.t) = object (self)

  method get_resource : unit -> string option =
    fun () ->
      (Builder_list_item_factory.get_resource obj)

    method as_builder_list_item_factory = obj
end

