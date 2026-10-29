(* Class_gen_inheritance — see class_gen_inheritance.mli for the contract. *)

open StdLabels
open Types

let split_qualified ~ctx name =
  match String.index_opt name '.' with
  | Some dot ->
      ( String.sub name ~pos:0 ~len:dot,
        String.sub name ~pos:(dot + 1) ~len:(String.length name - dot - 1) )
  | None -> (ctx.namespace.namespace_name, name)

(* The type mappings key a same-namespace interface by its C type, so an
   unqualified name is looked up through the entity that declares it. *)
let mapping_name ~ctx name =
  if String.contains name '.' then name
  else
    List.find_map ctx.interfaces ~f:(fun iface ->
        if String.equal iface.interface_name name then Some iface.c_type
        else None)
    |> Option.value ~default:name

let ancestor ~ctx name =
  let namespace, simple = split_qualified ~ctx name in
  let gir_type =
    Class_gen_type_resolution.gir_type_of_name (mapping_name ~ctx name)
  in
  match Class_gen_type_resolution.find_layer2_class_for_type ~ctx gir_type with
  | Some _ -> Entity_doc.Bound { namespace; name = simple }
  | None -> Entity_doc.Unbound (namespace ^ "." ^ simple)

(* Every class without another parent has GObject.Object, so naming it says
   nothing. *)
let is_root_class name = String.equal name "GObject.Object"

let parent_ancestor ~ctx parent =
  if is_root_class parent then None else Some (ancestor ~ctx parent)

let of_entity ~ctx ~(entity_kind : Filtering.entity_kind) class_name =
  match entity_kind with
  | Record -> Entity_doc.no_inheritance
  | Class ->
      List.find_opt ctx.classes ~f:(fun (cls : gir_class) ->
          String.equal cls.class_name class_name)
      |> Option.fold ~none:Entity_doc.no_inheritance
           ~some:(fun (cls : gir_class) ->
             {
               Entity_doc.parent = Option.bind cls.parent (parent_ancestor ~ctx);
               implements = List.map cls.implements ~f:(ancestor ~ctx);
               requires = [];
             })
  | Interface ->
      List.find_opt ctx.interfaces ~f:(fun iface ->
          String.equal iface.interface_name class_name)
      |> Option.fold ~none:Entity_doc.no_inheritance ~some:(fun iface ->
          {
            Entity_doc.no_inheritance with
            requires = List.map iface.prerequisites ~f:(ancestor ~ctx);
          })
