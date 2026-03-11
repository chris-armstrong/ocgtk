(* OCaml Interface (.mli) Generation - Thin delegation wrapper *)
(* This module re-exports the Layer 1 generation API *)

type output_mode = Layer1.Layer1_helpers.output_mode =
  | Interface
  | Implementation

let generate_ml_interface = Layer1.Layer1_main.generate_ml_interface

let generate_combined_ml_modules = Layer1.Layer1_main.generate_combined_ml_modules
