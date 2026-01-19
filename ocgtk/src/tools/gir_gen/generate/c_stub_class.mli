(** C Stub Code Generation - Class/Interface Support *)

(** {1 Public API} *)

(** Generate C constructor wrapper function for a GIR constructor.
    Handles parameter conversion from OCaml to C types, C constructor invocation,
    ref_sink for GObject types, and conversion of result to OCaml. Supports error
    handling if constructor throws. Generates both native and bytecode variants
    when parameter count exceeds 5. Returns the complete C function code as a string. *)
val generate_c_constructor :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  Types.gir_constructor ->
  string

(** Generate C method wrapper function for a GIR method.
    Handles parameter conversion from OCaml to C, C method invocation with proper
    direction handling (In, Out, InOut), array parameter support with length maps,
    and conversion of result to OCaml. Supports error handling if method throws.
    Returns the complete C function code as a string. *)
val generate_c_method :
  ctx:Types.generation_context ->
  c_type:string ->
  Types.gir_method ->
  string ->
  string

(** Generate the complete C stub code for a class or interface.
    Produces C header, C wrapper functions for constructors, methods, and properties.
    Skips constructors with unsupported features (throws, varargs, cross-namespace
    types, array params). Generates property getters and setters only if configured.
    Returns the full C file content including header and all wrapper functions
    as a single string. *)
val generate_class_c_code :
  ctx:Types.generation_context ->
  c_type:string ->
  string ->
  Types.gir_constructor list ->
  Types.gir_method list ->
  Types.gir_property list ->
  string

(** Generate forward declaration macros for class and interface conversion functions.
    Creates #define macros for Val_<type> and <type>_val conversions that map between
    OCaml values and C pointers using helper functions. Avoids duplicate declarations
    using a hashtable of seen types to handle shared inheritance.
    Returns the complete C macro declarations as a string. *)
val generate_forward_decls :
  classes:Types.gir_class list ->
  interfaces:Types.gir_interface list ->
  string
