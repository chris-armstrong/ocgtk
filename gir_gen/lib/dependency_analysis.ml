(* Dependency Analysis and SCC for Module Ordering *)

open StdLabels
open Types

(* Tarjan's SCC algorithm implementation *)
module SCC = struct
  type node_state = {
    mutable index : int option;
    mutable lowlink : int;
    mutable on_stack : bool;
  }

  let tarjan (graph : (string * string list) list) : string list list =
    let node_count = List.length graph in
    let state_tbl = Hashtbl.create node_count in
    let stack = ref [] in
    let index_counter = ref 0 in
    let sccs = ref [] in

    (* Initialize state for all nodes *)
    List.iter
      ~f:(fun (node, _) ->
        Hashtbl.add state_tbl node
          { index = None; lowlink = 0; on_stack = false })
      graph;

    let rec strongconnect node neighbors =
      let state = Hashtbl.find state_tbl node in
      state.index <- Some !index_counter;
      state.lowlink <- !index_counter;
      incr index_counter;
      state.on_stack <- true;
      stack := node :: !stack;

      (* Consider successors *)
      List.iter
        ~f:(fun neighbor ->
          if Hashtbl.mem state_tbl neighbor then begin
            let neighbor_state = Hashtbl.find state_tbl neighbor in
            match neighbor_state.index with
            | None ->
                (* Successor not yet visited; recurse on it *)
                let neighbor_neighbors =
                  try List.assoc neighbor graph with Not_found -> []
                in
                strongconnect neighbor neighbor_neighbors;
                let neighbor_state = Hashtbl.find state_tbl neighbor in
                state.lowlink <- min state.lowlink neighbor_state.lowlink
            | Some _ ->
                (* Successor has been visited *)
                if neighbor_state.on_stack then
                  state.lowlink <- min state.lowlink neighbor_state.lowlink
          end)
        neighbors;

      (* If node is a root node, pop the stack and generate an SCC *)
      match state.index with
      | Some idx when state.lowlink = idx ->
          let rec pop_scc acc =
            match !stack with
            | [] -> acc
            | w :: rest ->
                stack := rest;
                let w_state = Hashtbl.find state_tbl w in
                w_state.on_stack <- false;
                if w = node then w :: acc else pop_scc (w :: acc)
          in
          let scc = pop_scc [] in
          sccs := scc :: !sccs
      | _ -> ()
    in

    (* Run algorithm on all nodes *)
    List.iter
      ~f:(fun (node, neighbors) ->
        let state = Hashtbl.find state_tbl node in
        match state.index with
        | None -> strongconnect node neighbors
        | Some _ -> ())
      graph;

    List.rev !sccs
end

(* Check if a name is a same-namespace entity *)
let is_same_ns_entity (ctx : generation_context) name : bool =
  List.exists ~f:(fun cls -> cls.class_name = name) ctx.classes
  || List.exists ~f:(fun intf -> intf.interface_name = name) ctx.interfaces
  || List.exists ~f:(fun rec_ -> rec_.record_name = name) ctx.records

(* Dependency extraction from types *)
let extract_dependencies_from_type (ctx : generation_context)
    (gir_type : gir_type) : string list =
  let type_name = gir_type.name in

  (* For GList/GSList, also extract the element type as a dependency *)
  let list_elem_deps =
    match gir_type.array with
    | Some arr when type_name = "GLib.List" || type_name = "GLib.SList" ->
        let elem_name = arr.element_type.name in
        if is_same_ns_entity ctx elem_name then [ elem_name ] else []
    | _ -> []
  in

  let direct_deps =
    if is_same_ns_entity ctx type_name then [ type_name ] else []
  in

  direct_deps @ list_elem_deps

(* Extract all dependencies from parameters *)
let extract_param_dependencies (ctx : generation_context)
    (params : gir_param list) : string list =
  List.concat_map params ~f:(fun param ->
      extract_dependencies_from_type ctx param.param_type)

(* Extract dependencies from a method *)
let extract_method_dependencies (ctx : generation_context)
    (method_ : gir_method) : string list =
  let return_deps = extract_dependencies_from_type ctx method_.return_type in
  let param_deps = extract_param_dependencies ctx method_.parameters in
  return_deps @ param_deps

(* Extract dependencies from a property *)
let extract_property_dependencies (ctx : generation_context)
    (prop : gir_property) : string list =
  extract_dependencies_from_type ctx prop.prop_type

(* Extract dependencies from a constructor *)
let extract_constructor_dependencies (ctx : generation_context)
    (ctor : gir_constructor) : string list =
  extract_param_dependencies ctx ctor.ctor_parameters

(* Extract all dependencies for a class *)
let extract_class_dependencies (ctx : generation_context) (cls : gir_class) :
    string list =
  let parent_deps = match cls.parent with Some p -> [ p ] | None -> [] in
  let interface_deps = cls.implements in
  let method_deps =
    List.concat_map cls.methods ~f:(extract_method_dependencies ctx)
  in
  let property_deps =
    List.concat_map cls.properties ~f:(extract_property_dependencies ctx)
  in
  let constructor_deps =
    List.concat_map cls.constructors ~f:(extract_constructor_dependencies ctx)
  in

  (* Remove self-references and duplicates *)
  let all_deps =
    parent_deps @ interface_deps @ method_deps @ property_deps
    @ constructor_deps
  in
  List.filter all_deps ~f:(fun dep -> dep <> cls.class_name)
  |> List.sort_uniq ~cmp:String.compare

(* Extract all dependencies for an interface *)
let extract_interface_dependencies (ctx : generation_context)
    (intf : gir_interface) : string list =
  let method_deps =
    List.concat_map intf.methods ~f:(extract_method_dependencies ctx)
  in
  let property_deps =
    List.concat_map intf.properties ~f:(extract_property_dependencies ctx)
  in

  (* Remove self-references and duplicates *)
  let all_deps = method_deps @ property_deps in
  List.filter all_deps ~f:(fun dep -> dep <> intf.interface_name)
  |> List.sort_uniq ~cmp:String.compare

(* Extract all dependencies for a record *)
let extract_record_dependencies (ctx : generation_context) (rec_ : gir_record) :
    string list =
  let method_deps =
    List.concat_map rec_.methods ~f:(extract_method_dependencies ctx)
  in
  let constructor_deps =
    List.concat_map rec_.constructors ~f:(extract_constructor_dependencies ctx)
  in

  (* Remove self-references and duplicates *)
  let all_deps = method_deps @ constructor_deps in
  List.filter all_deps ~f:(fun dep -> dep <> rec_.record_name)
  |> List.sort_uniq ~cmp:String.compare

(* Build dependency graph for all entities *)
let build_dependency_graph (ctx : generation_context) :
    (string * string list) list =
  let class_graph =
    List.map ctx.classes ~f:(fun cls ->
        (cls.class_name, extract_class_dependencies ctx cls))
  in

  let interface_graph =
    List.map ctx.interfaces ~f:(fun intf ->
        (intf.interface_name, extract_interface_dependencies ctx intf))
  in

  let record_graph =
    List.map ctx.records ~f:(fun rec_ ->
        (rec_.record_name, extract_record_dependencies ctx rec_))
  in

  class_graph @ interface_graph @ record_graph

(* Module group type *)
type module_group = Single of entity | Cycle of entity list

let create_module_name_for_cycle (entities : entity list) : string =
  (* Sort entity names for consistent ordering *)
  let names =
    List.map entities ~f:(fun e -> e.name) |> List.sort ~cmp:String.compare
  in
  (* Convert each class name to module name format *)
  let module_names = List.map names ~f:Utils.module_name_of_class in
  let joined = String.concat ~sep:"_and_" module_names in
  (* Long cycles (many members) produce filenames that exceed Windows MAX_PATH.
     When the joined name is too long, fall back to first-name + short MD5 hash. *)
  if String.length joined <= 150 then joined
  else
    let first_name = Utils.to_snake_case (List.hd names) in
    let hash_input = String.concat ~sep:"," names in
    let short_hash =
      String.sub (Digest.to_hex (Digest.string hash_input)) ~pos:0 ~len:8
    in
    first_name ^ "_cycle_" ^ short_hash

(* Compute SCC-based module groups *)
let compute_module_groups (ctx : generation_context) (entities : entity list) :
    module_group list =
  (* Build dependency graph *)
  let graph = build_dependency_graph ctx in

  (* Run SCC algorithm *)
  let sccs = SCC.tarjan graph in

  (* Create entity lookup *)
  let entity_tbl = Hashtbl.create (List.length entities) in
  List.iter entities ~f:(fun e -> Hashtbl.add entity_tbl e.name e);

  (* Convert SCCs to module groups *)
  List.filter_map sccs ~f:(fun scc ->
      (* Get entities for this SCC *)
      let scc_entities =
        List.filter_map scc ~f:(fun name -> Hashtbl.find_opt entity_tbl name)
      in

      match scc_entities with
      | [] -> None (* Skip empty groups *)
      | [ single ] -> Some (Single single)
      | multiple -> Some (Cycle multiple))

(* Check if a module group is cyclic *)
let is_cyclic_group = function Single _ -> false | Cycle _ -> true

(* Get entities from a module group *)
let entities_of_group = function Single e -> [ e ] | Cycle es -> es

(* Get module name for a group *)
let module_name_of_group = function
  | Single e -> Utils.module_name_of_class e.name
  | Cycle es ->
      (* For cyclic modules, we need to return the name as OCaml will see it
         after file naming conversion: CamelCase -> snake_case -> Capitalized *)
      let combined = create_module_name_for_cycle es in
      let snake_case = Utils.to_snake_case combined in
      String.capitalize_ascii snake_case

(* Create a hashtable mapping class names to their module names
   For cyclic modules, maps each class to the combined module name *)
let create_module_groups_table (groups : module_group list) :
    (string, string) Hashtbl.t =
  let tbl = Hashtbl.create 256 in
  List.iter groups ~f:(fun group ->
      let module_name = module_name_of_group group in
      let entities = entities_of_group group in
      List.iter entities ~f:(fun entity ->
          Hashtbl.add tbl entity.name module_name));
  tbl

(** [build_module_dependency_graph ctx] collapses the class-level dependency
    graph to module granularity using [ctx.module_groups].

    For every class-level edge (A -> B), emits an edge (module(A) -> module(B)),
    filters self-loops, deduplicates, and merges entries sharing the same
    from-module. Returns a list of [(module_name, dep_module_names)] pairs.

    Precondition: [ctx.module_groups] must be fully populated (i.e.
    [create_module_groups_table] must have been called and the result stored in
    [ctx.module_groups]) before calling this function. If a class name is absent
    from [module_groups], the fallback [Utils.module_name_of_class] is used. *)
let build_module_dependency_graph (ctx : generation_context) :
    (string * string list) list =
  let module_of name =
    match Hashtbl.find_opt ctx.module_groups name with
    | Some m -> m
    | None -> Utils.module_name_of_class name
  in
  let class_graph = build_dependency_graph ctx in
  let module_edges =
    List.map class_graph ~f:(fun (class_name, deps) ->
        let from_mod = module_of class_name in
        let to_mods =
          List.filter_map deps ~f:(fun dep ->
              let to_mod = module_of dep in
              if String.equal from_mod to_mod then None else Some to_mod)
        in
        (from_mod, to_mods))
  in
  (* Merge entries with the same from-module and deduplicate deps *)
  let merged : (string, string list) Hashtbl.t = Hashtbl.create 64 in
  List.iter module_edges ~f:(fun (from_mod, to_mods) ->
      let existing =
        match Hashtbl.find_opt merged from_mod with
        | Some xs -> xs
        | None -> []
      in
      Hashtbl.replace merged from_mod (existing @ to_mods));
  Hashtbl.fold
    (fun from_mod to_mods acc ->
      let deduped = List.sort_uniq ~cmp:String.compare to_mods in
      (from_mod, deduped) :: acc)
    merged []

(** [module_reaches_module graph ~from_module ~to_module] returns [true] if
    [to_module] is reachable from [from_module] via a directed path in [graph].
    Returns [true] when [from_module = to_module] (reflexive).

    Uses depth-first search with a visited set to handle cycles.

    [graph] should be the result of [build_module_dependency_graph]. *)
let module_reaches_module (graph : (string * string list) list)
    ~(from_module : string) ~(to_module : string) : bool =
  if String.equal from_module to_module then true
  else
    let visited : (string, bool) Hashtbl.t = Hashtbl.create 16 in
    let rec dfs current =
      if Hashtbl.mem visited current then false
      else begin
        Hashtbl.add visited current true;
        let neighbors =
          match List.assoc_opt current graph with
          | Some ns -> ns
          | None -> []
        in
        List.exists neighbors ~f:(fun neighbor ->
            String.equal neighbor to_module || dfs neighbor)
      end
    in
    dfs from_module
