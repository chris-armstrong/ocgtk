(* Type Resolution - Shared OCaml type resolution utilities
   This module consolidates type resolution logic from class_gen.ml and ml_interface.ml
*)

(** Resolve a GIR type to its layer 2 class reference
    Returns Some with the fully qualified type reference if found,
    or None if no layer 2 class mapping exists *)
val resolve_layer2_class_ref
  : ctx:Types.generation_context
  -> current_layer2_module:string
  -> gir_type:Types.gir_type
  -> string option

(** Resolve a GIR type to its OCaml type string
    Returns the OCaml type representation with proper nullable handling *)
val resolve_ocaml_type
  : ctx:Types.generation_context
  -> current_layer2_module:string
  -> gir_type:Types.gir_type
  -> string option

(** Map a GIR type to its OCaml representation with self-reference simplification
    Simplifies type references like "CurrentModule.t" to just "t" *)
val map_gir_type_to_ocaml
  : ctx:Types.generation_context
  -> class_name:string
  -> gir_type:Types.gir_type
  -> is_nullable:bool
  -> string

(** Simplify type references when they refer to the current module's type
    Converts patterns like "CurrentModule.t" to "t" to reduce verbosity *)
val simplify_self_reference
  : class_name:string
  -> ocaml_type:string
  -> string

(** Wrap a result type with GError.t if the function throws
    Converts: "unit" -> "(unit, GError.t) result" *)
val wrap_result_if_throws
  : base_type:string
  -> throws:bool
  -> string