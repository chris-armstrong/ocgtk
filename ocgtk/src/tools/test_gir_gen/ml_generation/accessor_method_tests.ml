(* Accessor Method Tests - Validates hierarchy accessor methods (as_widget, etc.) *)

(* NOTE: Accessor methods (as_widget, as_event_controller, etc.) are generated based
 * on hierarchy detection which requires a properly configured context with all
 * classes registered. These tests validate that generated code contains the expected
 * structure even without the full hierarchy system configured. *)

open Ppxlib.Parsetree

let create_test_context_with_hierarchy = Helpers.create_test_context_with_hierarchy

(* Helper to check if AST has a value declaration (for .mli) *)
let has_val_declaration (ast : Parsetree.signature) (name : string) : bool =
  List.exists (fun item ->
    match item.Parsetree.psig_desc with
    | Parsetree.Psig_value vd when vd.pval_name.txt = name -> true
    | _ -> false
  ) ast

(* Helper to check if AST has a let binding (for .ml) *)
let has_let_binding (ast : Parsetree.structure) (name : string) : bool =
  List.exists (fun item ->
    match item.Parsetree.pstr_desc with
    | Parsetree.Pstr_value (_, bindings) ->
        List.exists (fun vb ->
          match vb.Parsetree.pvb_pat.ppat_desc with
          | Parsetree.Ppat_var { txt; _ } when txt = name -> true
          | _ -> false
        ) bindings
    | _ -> false
  ) ast

(* Helper to get the type signature of a value declaration *)
let get_val_type (ast : Parsetree.signature) (name : string) : Parsetree.core_type option =
  List.find_map (fun item ->
    match item.Parsetree.psig_desc with
    | Parsetree.Psig_value vd when vd.pval_name.txt = name -> Some vd.pval_type
    | _ -> None
  ) ast

(* ========================================================================= *)
(* Test: Child Class Generates Valid Implementation *)
(* ========================================================================= *)

let test_child_class_impl_valid () =
  let ctx = create_test_context_with_hierarchy () in

  (* Button inherits from Widget *)
  let ml_code = Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
    ~ctx
    ~output_mode:Implementation
    ~class_name:"Button"
    ~class_doc:None
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~constructors:None
    ~methods:[]
    ~properties:[]
    
    () in

  (* Should parse successfully and have type t *)
  let ast = Ml_ast_helpers.parse_implementation ml_code in
  Ml_validation.assert_type_exists ast "t";

  (* Button inherits from Widget, so should have as_widget accessor *)
  Ml_validation.assert_value_exists ast "as_widget"

(* ========================================================================= *)
(* Test: Child Class Generates Valid Interface *)
(* ========================================================================= *)

let test_child_class_iface_valid () =
  let ctx = create_test_context_with_hierarchy () in

  (* Button inherits from Widget *)
  let mli_code = Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
    ~ctx
    ~output_mode:Interface
    ~class_name:"Button"
    ~class_doc:None
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~constructors:None
    ~methods:[]
    ~properties:[]
    
    () in

  (* Should parse successfully and have type t *)
  let ast = Ml_ast_helpers.parse_interface mli_code in
  Ml_validation.assert_type_exists_sig ast "t";

  (* Should have as_widget accessor in signature (converts Button to Widget.t) *)
  match Ml_ast_helpers.find_value_declaration_sig ast "as_widget" with
  | Some vd ->
      (* Validate signature: t -> Widget.t *)
      let sig_str = Ml_ast_helpers.core_type_to_string vd.pval_type in
      Alcotest.(check bool) "as_widget should have signature t -> Widget.t"
        true (sig_str = "t -> Widget.t")
  | None ->
      Alcotest.fail "as_widget accessor not found in interface"

(* ========================================================================= *)
(* Test: Root Class Generates Valid Code *)
(* ========================================================================= *)

let test_root_class_valid () =
  let ctx = create_test_context_with_hierarchy () in

  (* Widget is root, no parent chain *)
  let ml_code = Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
    ~ctx
    ~output_mode:Implementation
    ~class_name:"Widget"
    ~class_doc:None
    ~c_type:"GtkWidget"
    ~parent_chain:[]
    ~constructors:None
    ~methods:[]
    ~properties:[]
    
    () in

  (* Should parse successfully *)
  let ast = Ml_ast_helpers.parse_implementation ml_code in
  Ml_validation.assert_type_exists ast "t";

  (* Root class should NOT have as_widget accessor (it's the root itself) *)
  (* The generator only adds accessors for classes that aren't the hierarchy root *)
  match Ml_ast_helpers.find_let_binding ast "as_widget" with
  | Some _ -> Alcotest.fail "Root class Widget should not have as_widget accessor"
  | None -> ()  (* Correct - no accessor for root *)

(* ========================================================================= *)
(* Test: Child Class Has Parent Accessors *)
(* ========================================================================= *)

let test_child_has_parent_accessors () =
  let ctx = create_test_context_with_hierarchy () in

  (* Button inherits from Widget, so should have as_widget accessor *)
  let ml_code = Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
    ~ctx
    ~output_mode:Implementation
    ~class_name:"Button"
    ~class_doc:None
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~constructors:None
    ~methods:[]
    ~properties:[]
    
    () in

  let ast = Ml_ast_helpers.parse_implementation ml_code in

  (* Button should have as_widget (its hierarchy root accessor) *)
  Ml_validation.assert_value_exists ast "as_widget"

(* ========================================================================= *)
(* Test: Deep Hierarchy Generates Valid Code *)
(* ========================================================================= *)

let test_deep_hierarchy_valid () =
  let ctx = create_test_context_with_hierarchy () in

  (* Entry -> Widget -> InitiallyUnowned -> Object *)
  let ml_code = Gir_gen_lib.Generate.Ml_interface.generate_ml_interface
    ~ctx
    ~output_mode:Implementation
    ~class_name:"Entry"
    ~class_doc:None
    ~c_type:"GtkEntry"
    ~parent_chain:["Widget"; "InitiallyUnowned"; "Object"]
    ~constructors:None
    ~methods:[]
    ~properties:[]
    
    () in

  (* Should parse successfully *)
  let ast = Ml_ast_helpers.parse_implementation ml_code in
  Ml_validation.assert_type_exists ast "t";

  (* Entry is in Widget hierarchy, so should have as_widget accessor *)
  Ml_validation.assert_value_exists ast "as_widget"

(* ========================================================================= *)
(* Test Suite Registration *)
(* ========================================================================= *)

let tests = [
  Alcotest.test_case "Child class has hierarchy root accessor" `Quick test_child_class_impl_valid;
  Alcotest.test_case "Accessor in interface has correct signature" `Quick test_child_class_iface_valid;
  Alcotest.test_case "Root class does NOT have accessor to itself" `Quick test_root_class_valid;
  Alcotest.test_case "Child class has parent hierarchy accessor" `Quick test_child_has_parent_accessors;
  Alcotest.test_case "Deep hierarchy has accessor to root" `Quick test_deep_hierarchy_valid;
]
