class type builder_list_item_factory_t = object
  inherit List_item_factory.list_item_factory_t

  (** {2:methods Methods} *)

  method get_bytes : unit -> Glib_bytes.t
  (** Gets the data used as the [GtkBuilder] UI template for constructing
      listitems. *)

  method get_resource : unit -> string option
  (** If the data references a resource, gets the path of that resource. *)

  method get_scope : unit -> Builder_scope.builder_scope_t option
  (** Gets the scope used when constructing listitems. *)

  (** {2:conversions Conversions} *)

  method as_builder_list_item_factory : Raw.Builder_list_item_factory.t
end

(* High-level class for BuilderListItemFactory *)
class builder_list_item_factory (obj : Raw.Builder_list_item_factory.t) :
  builder_list_item_factory_t =
  object (self)
    inherit List_item_factory.list_item_factory (obj :> Raw.List_item_factory.t)

    method get_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Builder_list_item_factory.get_bytes obj

    method get_resource : unit -> string option =
      fun () -> Raw.Builder_list_item_factory.get_resource obj

    method get_scope : unit -> Builder_scope.builder_scope_t option =
      fun () ->
        Option.map
          (fun ret -> new Builder_scope.builder_scope ret)
          (Raw.Builder_list_item_factory.get_scope obj)

    method as_builder_list_item_factory = obj
  end

let new_from_bytes (scope : Builder_scope.builder_scope_t option)
    (bytes : Glib_bytes.t) : builder_list_item_factory_t =
  let scope = Option.map (fun c -> c#as_builder_scope) scope in
  let obj_ = Raw.Builder_list_item_factory.new_from_bytes scope bytes in
  new builder_list_item_factory obj_

let new_from_resource (scope : Builder_scope.builder_scope_t option)
    (resource_path : string) : builder_list_item_factory_t =
  let scope = Option.map (fun c -> c#as_builder_scope) scope in
  let obj_ =
    Raw.Builder_list_item_factory.new_from_resource scope resource_path
  in
  new builder_list_item_factory obj_
