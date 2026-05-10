(* Tests for Dependency_analysis.build_module_dependency_graph and
   Dependency_analysis.module_reaches_module *)

open Type_factory
open Gir_gen_lib

(** Build a module-level dependency graph from a context and assert the shape
    of the result. *)

(* Helper: look up a module's deps in the graph, failing if absent *)
let find_deps_in_graph graph module_name =
  match List.assoc_opt module_name graph with
  | Some deps -> deps
  | None ->
      Alcotest.failf "Module '%s' not found in graph (keys: [%s])" module_name
        (String.concat ", " (List.map fst graph))

(* -------------------------------------------------------------------------
   test_module_graph_singleton

   One class A, no methods.  After collapsing to module granularity the graph
   has exactly one entry and module_reaches_module returns true for A -> A.
   ------------------------------------------------------------------------- *)
let test_module_graph_singleton () =
  let cls_a = make_gir_class ~class_name:"A" () in
  let ctx =
    make_generation_context ~classes:[ cls_a ]
      ~module_groups:[ ("A", "A_module") ]
      ()
  in
  let graph = Dependency_analysis.build_module_dependency_graph ctx in
  Alcotest.(check int) "graph has one entry" 1 (List.length graph);
  let a_deps = find_deps_in_graph graph "A_module" in
  Alcotest.(check (list string)) "A_module has no deps" [] a_deps;
  let reaches =
    Dependency_analysis.module_reaches_module graph ~from_module:"A_module"
      ~to_module:"A_module"
  in
  Alcotest.(check bool) "A_module reaches A_module (reflexive)" true reaches

(* -------------------------------------------------------------------------
   test_module_graph_simple_path

   Three classes A, B, C in distinct modules MA, MB, MC.
   A has a method returning B; B has a method returning C.
   Edges at class level: A->B, B->C.
   Edges at module level: MA->MB, MB->MC.
   module_reaches_module MA MC = true (transitivity).
   module_reaches_module MC MA = false (no back edge).
   ------------------------------------------------------------------------- *)
let test_module_graph_simple_path () =
  let b_type = make_gir_type ~name:"B" ~c_type:"B*" () in
  let c_type = make_gir_type ~name:"C" ~c_type:"C*" () in
  let method_a_returns_b =
    make_gir_method ~method_name:"get_b" ~c_identifier:"a_get_b"
      ~return_type:b_type ()
  in
  let method_b_returns_c =
    make_gir_method ~method_name:"get_c" ~c_identifier:"b_get_c"
      ~return_type:c_type ()
  in
  let cls_a = make_gir_class ~class_name:"A" ~methods:[ method_a_returns_b ] () in
  let cls_b = make_gir_class ~class_name:"B" ~methods:[ method_b_returns_c ] () in
  let cls_c = make_gir_class ~class_name:"C" () in
  let ctx =
    make_generation_context ~classes:[ cls_a; cls_b; cls_c ]
      ~module_groups:[ ("A", "MA"); ("B", "MB"); ("C", "MC") ]
      ()
  in
  let graph = Dependency_analysis.build_module_dependency_graph ctx in
  let reaches_ma_mc =
    Dependency_analysis.module_reaches_module graph ~from_module:"MA"
      ~to_module:"MC"
  in
  Alcotest.(check bool) "MA reaches MC (via MB)" true reaches_ma_mc;
  let reaches_mc_ma =
    Dependency_analysis.module_reaches_module graph ~from_module:"MC"
      ~to_module:"MA"
  in
  Alcotest.(check bool) "MC does not reach MA" false reaches_mc_ma

(* -------------------------------------------------------------------------
   test_module_graph_self_loop_filtered

   Class A has a method that returns A (self-reference at class level).
   build_dependency_graph already filters self-loops at class level; the
   module-level graph should also have no self-edge for A's module.
   ------------------------------------------------------------------------- *)
let test_module_graph_self_loop_filtered () =
  let a_type = make_gir_type ~name:"A" ~c_type:"A*" () in
  let method_returns_self =
    make_gir_method ~method_name:"clone" ~c_identifier:"a_clone"
      ~return_type:a_type ()
  in
  let cls_a =
    make_gir_class ~class_name:"A" ~methods:[ method_returns_self ] ()
  in
  let ctx =
    make_generation_context ~classes:[ cls_a ]
      ~module_groups:[ ("A", "MA") ]
      ()
  in
  let graph = Dependency_analysis.build_module_dependency_graph ctx in
  let ma_deps = find_deps_in_graph graph "MA" in
  Alcotest.(check (list string)) "MA self-loop is filtered" [] ma_deps

(* -------------------------------------------------------------------------
   test_module_graph_combined_module_intra_filtered

   Three classes A, B, C all mapped to the same module "CombinedABC".
   Each class has a method returning another class in the same module, so at
   the class level there are cross-class edges.  After collapsing to module
   level all edges become intra-module self-loops and are filtered.
   The single entry in the graph has an empty dep list.
   ------------------------------------------------------------------------- *)
let test_module_graph_combined_module_intra_filtered () =
  let b_type = make_gir_type ~name:"B" ~c_type:"B*" () in
  let c_type = make_gir_type ~name:"C" ~c_type:"C*" () in
  let a_type = make_gir_type ~name:"A" ~c_type:"A*" () in
  let method_a = make_gir_method ~method_name:"to_b" ~c_identifier:"a_to_b" ~return_type:b_type () in
  let method_b = make_gir_method ~method_name:"to_c" ~c_identifier:"b_to_c" ~return_type:c_type () in
  let method_c = make_gir_method ~method_name:"to_a" ~c_identifier:"c_to_a" ~return_type:a_type () in
  let cls_a = make_gir_class ~class_name:"A" ~methods:[ method_a ] () in
  let cls_b = make_gir_class ~class_name:"B" ~methods:[ method_b ] () in
  let cls_c = make_gir_class ~class_name:"C" ~methods:[ method_c ] () in
  let ctx =
    make_generation_context ~classes:[ cls_a; cls_b; cls_c ]
      ~module_groups:
        [ ("A", "CombinedABC"); ("B", "CombinedABC"); ("C", "CombinedABC") ]
      ()
  in
  let graph = Dependency_analysis.build_module_dependency_graph ctx in
  let combined_deps = find_deps_in_graph graph "CombinedABC" in
  Alcotest.(check (list string))
    "CombinedABC has no deps (intra-cluster edges filtered)" []
    combined_deps

(* -------------------------------------------------------------------------
   test_module_reaches_simulates_tooltip_widget_cycle

   Two modules MA (Tooltip) and MB (Widget) with edge MA->MB only.
   module_reaches_module graph MB MA = false — MB does not reach MA yet.
   (Adding a signal edge MB->MA would create a cycle, which is what Stage 2
   will detect using this helper.)
   ------------------------------------------------------------------------- *)
let test_module_reaches_simulates_tooltip_widget_cycle () =
  let b_type = make_gir_type ~name:"B" ~c_type:"B*" () in
  let method_a_to_b =
    make_gir_method ~method_name:"get_b" ~c_identifier:"a_get_b"
      ~return_type:b_type ()
  in
  let cls_a = make_gir_class ~class_name:"A" ~methods:[ method_a_to_b ] () in
  let cls_b = make_gir_class ~class_name:"B" () in
  let ctx =
    make_generation_context ~classes:[ cls_a; cls_b ]
      ~module_groups:[ ("A", "MA"); ("B", "MB") ]
      ()
  in
  let graph = Dependency_analysis.build_module_dependency_graph ctx in
  let reaches_ma_mb =
    Dependency_analysis.module_reaches_module graph ~from_module:"MA"
      ~to_module:"MB"
  in
  Alcotest.(check bool) "MA reaches MB (direct edge)" true reaches_ma_mb;
  let reaches_mb_ma =
    Dependency_analysis.module_reaches_module graph ~from_module:"MB"
      ~to_module:"MA"
  in
  Alcotest.(check bool)
    "MB does not reach MA (adding signal edge would create cycle)" false
    reaches_mb_ma

let tests =
  [
    ( "test_module_graph_singleton",
      `Quick,
      test_module_graph_singleton );
    ( "test_module_graph_simple_path",
      `Quick,
      test_module_graph_simple_path );
    ( "test_module_graph_self_loop_filtered",
      `Quick,
      test_module_graph_self_loop_filtered );
    ( "test_module_graph_combined_module_intra_filtered",
      `Quick,
      test_module_graph_combined_module_intra_filtered );
    ( "test_module_reaches_simulates_tooltip_widget_cycle",
      `Quick,
      test_module_reaches_simulates_tooltip_widget_cycle );
  ]
