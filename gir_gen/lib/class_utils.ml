open Types

(* Get the properly qualified module name for a class, accounting for cyclic modules *)
let get_qualified_module_name ~ctx class_name =
  Module_paths.same_ns_layer1_module
    ~ctx:{ ctx with current_cycle_classes = [] }
    class_name
