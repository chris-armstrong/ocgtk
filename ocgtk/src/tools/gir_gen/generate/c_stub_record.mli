(** C Stub Code Generation - Record Support *)

(** [has_copy_method record] checks if a record has a copy method, indicating it's a
    value-like record that should be stack-allocated in C but heap-allocated in OCaml. *)
val has_copy_method : Types.gir_record -> bool

(** [is_value_like_record record] determines if a record is value-like, meaning it is
    non-opaque and has a copy method. *)
val is_value_like_record : Types.gir_record -> bool

(** [generate_forward_decls ~records] generates C forward declarations and macros for
    record converters. Handles both value-like records (with copy methods) and
    non-value-like records. *)
val generate_forward_decls : records:Types.gir_record list -> string

(** [generate_record_converters ~buf record] generates conversion functions for a record,
    writing the C code to the provided buffer. Handles both opaque and value-like records. *)
val generate_record_converters : buf:Buffer.t -> Types.gir_record -> unit

(** [generate_record_c_code ~ctx record] generates the complete C code for a record,
    including conversion functions, constructors, and methods. *)
val generate_record_c_code : ctx:Types.generation_context -> Types.gir_record -> string
