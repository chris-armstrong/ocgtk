(* Doc_resolve — see doc_resolve.mli for the contract. *)

open StdLabels
open Types

type env = { namespace : string; layer : target_library; index : doc_index }

let env_of_ctx (ctx : generation_context) =
  {
    namespace = ctx.namespace.namespace_name;
    layer = ctx.target_library;
    index = ctx.doc_index;
  }

let no_links ~namespace =
  { namespace; layer = Main_library; index = StringMap.empty }

let class_member env = { env with index = StringMap.empty }

type miss_reason =
  | Namespace_not_generated
  | Unknown_target
  | Member_in_other_namespace
  | Kind_not_generated
  | Not_resolved_yet
[@@deriving eq]

let miss_reason_name = function
  | Namespace_not_generated -> "namespace-not-generated"
  | Unknown_target -> "unknown-target"
  | Member_in_other_namespace -> "member-in-other-namespace"
  | Kind_not_generated -> "kind-not-generated"
  | Not_resolved_yet -> "not-resolved-yet"

type outcome = {
  kind : Doc_ast.sym_kind option;
  endpoint : string;
  result : (unit, miss_reason) result;
}

(* What a fragment keyword names: a type, a constant, a member of a type, or
   something never generated. *)
type target_class =
  | Type_target
  | Enum_target
  | Constant_target
  | Member_target

let target_class : Doc_ast.sym_kind -> _ = function
  | Class | Iface | Struct | Type_kind -> Ok Type_target
  | Enum | Flags -> Ok Enum_target
  | Const -> Ok Constant_target
  | Ctor | Method | Property | Signal -> Ok Member_target
  | Alias | Callback | Func | Vfunc | Doc_ast.Error -> Error Kind_not_generated
  | Id -> Error Not_resolved_yet

let split_at_first ~chars s =
  let rec go i =
    if i >= String.length s then (s, "")
    else if List.exists chars ~f:(Char.equal s.[i]) then
      ( String.sub s ~pos:0 ~len:i,
        String.sub s ~pos:i ~len:(String.length s - i) )
    else go (i + 1)
  in
  go 0

let is_type_of ~env ~namespace name =
  StringMap.find_opt namespace env.index
  |> Option.fold ~none:false ~some:(fun ns -> StringMap.mem name ns.di_types)

(* The namespace an endpoint names and the rest of it. A first component that
   is not an indexed namespace is a type of the current namespace when the
   current namespace has it ([Button.clicked]), and otherwise a namespace that
   is not generated ([GObject.Object]). *)
let split_namespace ~env endpoint =
  match split_at_first ~chars:[ '.' ] endpoint with
  | _, "" -> Ok (env.namespace, endpoint)
  | first, rest when StringMap.mem first env.index ->
      Ok (first, String.sub rest ~pos:1 ~len:(String.length rest - 1))
  | first, _ ->
      let type_name, _ = split_at_first ~chars:[ ':' ] first in
      if is_type_of ~env ~namespace:env.namespace type_name then
        Ok (env.namespace, endpoint)
      else Error Namespace_not_generated

let type_path ~env ~namespace name kind =
  let main = Module_paths.main_module namespace in
  match (kind, env.layer) with
  | (Dk_class | Dk_interface | Dk_record), Main_library ->
      Fmt.str "%s.class-type-%s"
        (Module_paths.cross_ns_layer2_module ~namespace name)
        (Utils.class_type_name name)
  | (Dk_class | Dk_interface | Dk_record), Raw_library ->
      Fmt.str "%s.%s.%s" main Module_paths.raw_alias_module
        (Utils.module_name_of_class name)
  | (Dk_enum | Dk_bitfield), (Main_library | Raw_library) ->
      Fmt.str "%s.%s.type-%s" main Module_paths.enums_alias_module
        (String.lowercase_ascii name)

let lookup ~env ~namespace ~table name =
  StringMap.find_opt namespace env.index
  |> Fun.flip Option.bind (fun ns -> StringMap.find_opt name (table ns))
  |> Option.to_result ~none:Unknown_target

let resolve_type ~env ~namespace rest =
  match split_at_first ~chars:[ '.'; ':' ] rest with
  | name, "" ->
      lookup ~env ~namespace ~table:(fun ns -> ns.di_types) name
      |> Result.map (type_path ~env ~namespace name)
  | _, _member -> Error Unknown_target

let resolve_constant ~env ~namespace rest =
  lookup ~env ~namespace ~table:(fun ns -> ns.di_constants) rest
  |> Result.map (fun value ->
      Fmt.str "%s.%s.%s"
        (Module_paths.main_module namespace)
        Module_paths.constants_module value)

let resolve_member ~env ~namespace =
  if String.equal namespace env.namespace then Error Not_resolved_yet
  else Error Member_in_other_namespace

let ( let* ) = Result.bind

let path_of ~env kind endpoint =
  let* kind = Option.to_result ~none:Not_resolved_yet kind in
  let* target = target_class kind in
  let* namespace, rest = split_namespace ~env endpoint in
  match target with
  | Type_target -> resolve_type ~env ~namespace rest
  | Enum_target -> (
      match split_at_first ~chars:[ '.' ] rest with
      | _, "" -> resolve_type ~env ~namespace rest
      | _, _member -> resolve_member ~env ~namespace)
  | Constant_target -> resolve_constant ~env ~namespace rest
  | Member_target -> resolve_member ~env ~namespace

let rec resolve_inlines ~env inlines outcomes =
  List.fold_left_map inlines ~init:outcomes
    ~f:(fun outcomes (inline : Doc_ast.inline) ->
      match inline with
      | Doc_ast.Sym_ref { kind; endpoint; anchor = _ } -> (
          let path = path_of ~env kind endpoint in
          let outcome =
            { kind; endpoint; result = Result.map (fun _ -> ()) path }
          in
          match path with
          | Ok path ->
              (outcome :: outcomes, Doc_ast.Ref { path; text = endpoint })
          | Error _ -> (outcome :: outcomes, inline))
      | Bold inner ->
          let outcomes, inner = resolve_inlines ~env inner outcomes in
          (outcomes, Doc_ast.Bold inner)
      | Italic inner ->
          let outcomes, inner = resolve_inlines ~env inner outcomes in
          (outcomes, Doc_ast.Italic inner)
      | Link { text; url } ->
          let outcomes, text = resolve_inlines ~env text outcomes in
          (outcomes, Doc_ast.Link { text; url })
      | Page_ref { text; path; anchor } ->
          let outcomes, text = resolve_inlines ~env text outcomes in
          (outcomes, Doc_ast.Page_ref { text; path; anchor })
      | Text _ | Code _ | Param_ref _ | Ref _ | C_lit _ | C_prim _ ->
          (outcomes, inline))

let resolve_block ~env outcomes : Doc_ast.block -> _ = function
  | Para inlines ->
      let outcomes, inlines = resolve_inlines ~env inlines outcomes in
      (outcomes, Doc_ast.Para inlines)
  | Heading (level, inlines) ->
      let outcomes, inlines = resolve_inlines ~env inlines outcomes in
      (outcomes, Doc_ast.Heading (level, inlines))
  | List (ordered, items) ->
      let outcomes, items =
        List.fold_left_map items ~init:outcomes ~f:(fun outcomes item ->
            resolve_inlines ~env item outcomes)
      in
      (outcomes, Doc_ast.List (ordered, items))
  | Code_block _ as block -> (outcomes, block)

let resolve env ({ blocks } : Doc_ast.t) : Doc_ast.t * _ =
  let outcomes, blocks =
    List.fold_left_map blocks ~init:[] ~f:(resolve_block ~env)
  in
  (Doc_ast.{ blocks }, List.rev outcomes)

(* Summary *)

let kind_name : Doc_ast.sym_kind option -> string = function
  | None -> "sigil"
  | Some kind -> (
      match kind with
      | Class -> "class"
      | Iface -> "iface"
      | Enum -> "enum"
      | Flags -> "flags"
      | Struct -> "struct"
      | Alias -> "alias"
      | Callback -> "callback"
      | Const -> "const"
      | Ctor -> "ctor"
      | Func -> "func"
      | Method -> "method"
      | Property -> "property"
      | Signal -> "signal"
      | Vfunc -> "vfunc"
      | Doc_ast.Error -> "error"
      | Id -> "id"
      | Type_kind -> "type")

let result_name = function
  | Ok () -> "linked"
  | Error reason -> miss_reason_name reason

let counts keys =
  List.sort ~cmp:String.compare keys
  |> List.fold_left ~init:[] ~f:(fun acc key ->
      match acc with
      | (k, n) :: rest when String.equal k key -> (k, n + 1) :: rest
      | _ -> (key, 1) :: acc)
  |> List.rev

let pp_summary ppf outcomes =
  let linked =
    List.length (List.filter outcomes ~f:(fun o -> Result.is_ok o.result))
  in
  Fmt.pf ppf "Doc references: %d, %d linked@." (List.length outcomes) linked;
  counts (List.map outcomes ~f:(fun o -> kind_name o.kind))
  |> List.iter ~f:(fun (kind, total) ->
      let results =
        List.filter outcomes ~f:(fun o -> String.equal (kind_name o.kind) kind)
        |> List.map ~f:(fun o -> result_name o.result)
        |> counts
        |> List.map ~f:(fun (r, n) -> Fmt.str "%s %d" r n)
      in
      Fmt.pf ppf "  %s %d: %s@." kind total (String.concat ~sep:", " results));
  let unknown =
    List.filter_map outcomes ~f:(fun o ->
        match o.result with
        | Error Unknown_target -> Some (kind_name o.kind ^ "@" ^ o.endpoint)
        | Ok () | Error _ -> None)
    |> List.sort_uniq ~cmp:String.compare
  in
  if not (List.is_empty unknown) then
    Fmt.pf ppf "  unknown targets: %s@." (String.concat ~sep:" " unknown)
