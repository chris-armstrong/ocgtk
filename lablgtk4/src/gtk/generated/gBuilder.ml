(* High-level class for Builder *)
class builder (obj : Builder.t) = object (self)

  method translation_domain = Builder.get_translation_domain obj
  method set_translation_domain v = Builder.set_translation_domain obj v

  method add_from_file : string -> (bool, GError.t) result = fun filename -> (Builder.add_from_file obj filename)

  method add_from_resource : string -> (bool, GError.t) result = fun resource_path -> (Builder.add_from_resource obj resource_path)

  method get_scope : unit -> GBuilder_scope.builder_scope = fun () -> new  GBuilder_scope.builder_scope(Builder.get_scope obj )

  method set_scope : GBuilder_scope.builder_scope option -> unit = fun scope -> (Builder.set_scope obj ( scope |> Option.map (fun x -> x#as_builder_scope) ))

    method as_builder = obj
end

