(** Package, library and module names for generated code.

    Each GIR namespace is one opam package ([ocgio]) holding three libraries:

    - [ocgio.enums] ([Ocgio_enums]): enumerations and bitfields;
    - [ocgio.raw] ([Ocgio_raw]): layer 1 (externals and abstract types) and
      every C stub;
    - [ocgio] ([Ocgio]): layer 2 classes, plus [Raw] (one alias per layer 1
      module), [Enums] and [Constants].

    The raw library depends only on other raw and enums libraries, never on a
    main library, so the path of a type depends on which library the code naming
    it belongs to ([ctx.target_library]). *)

open Types

(** {1 Names derived from the namespace} *)

val package_name : string -> string
(** ["GdkPixbuf"] -> ["ocgdkpixbuf"]: the opam package, the main library and the
    package's directory. *)

val main_module : string -> string
(** ["Gio"] -> ["Ocgio"]. *)

val raw_module : string -> string
(** ["Gio"] -> ["Ocgio_raw"]. *)

val enums_module : string -> string
(** ["Gio"] -> ["Ocgio_enums"]: the enums library's only module. *)

val enums_file_stem : string -> string
(** ["Gio"] -> ["ocgio_enums"]. *)

val raw_alias_module : string
(** ["Raw"]: the main library's module of layer 1 aliases. *)

val enums_alias_module : string
(** ["Enums"]: the main library's re-export of the enums library. *)

val constants_module : string
(** ["Constants"]: the main library's constants module. *)

(** {1 Dune library names} *)

val raw_library_public_name : string -> string
(** ["Gio"] -> ["ocgio.raw"]. *)

val enums_library_public_name : string -> string
(** ["Gio"] -> ["ocgio.enums"]. *)

val stubs_library_name : string -> string
(** ["Gio"] -> ["ocgio_raw_stubs"]. *)

val stubs_library_public_name : string -> string
(** ["Gio"] -> ["ocgio.raw.stubs"]. *)

val stubs_batch_library_name : string -> int -> string
(** ["Gio"], [0] -> ["ocgio_raw_stubs_batch_0"]. *)

val stubs_batch_library_public_name : string -> int -> string
(** ["Gio"], [0] -> ["ocgio.raw.stubs_batch_0"]. *)

(** {1 Output directories, relative to the package directory} *)

val raw_generated_dir : string
(** ["raw/generated"]: layer 1, C stubs, the decls header and [dune.inc]. *)

val raw_core_dir : string
(** ["raw/core"]: hand-written C and layer 1 OCaml. *)

val enums_generated_dir : string
(** ["enums/generated"]. *)

val main_generated_dir : string
(** ["generated"]: layer 2, [raw.ml], [enums.ml], [constants.ml]. *)

(** {1 Module paths in generated code} *)

val layer2_module_name : string -> string
(** Layer 2 module for a class or combined module name: ["Button"] ->
    ["Button"], ["AppInfo"] -> ["App_info"]. *)

val layer2_module_filename : string -> string
(** File stem of {!layer2_module_name}: ["AppInfo"] -> ["app_info"]. *)

val same_ns_layer1_module : ctx:generation_context -> string -> string
(** Layer 1 module of a class, interface or record of the current namespace.
    From the raw library: ["Widget"], or ["A_and__b.B"] for a member of a cycle
    (just ["B"] inside that cycle's own module). From the main library:
    ["Raw.Widget"], ["Raw.B"] (clusters are flattened by [Raw]). *)

val cross_ns_layer1_module :
  ctx:generation_context -> namespace:string -> string -> string
(** Layer 1 module of a class, interface or record of another namespace. From
    the raw library: ["Ocgio_raw.Icon"]; a member of a cycle has its own shim
    module beside the combined module, so it is ["Ocgio_raw.File"] too. From the
    main library: ["Ocgio.Raw.Icon"]. *)

val namespace_enums_module : ctx:generation_context -> string -> string
(** Module holding the enums of [namespace]. Same namespace: ["Ocgio_enums"]
    from the raw library, ["Enums"] from the main one. Another namespace:
    ["Ocgio_enums"] from the raw library, ["Ocgio.Enums"] from the main one. *)

val namespace_constants_module : ctx:generation_context -> string -> string
(** Module holding the constants of [namespace]: ["Constants"] for the current
    namespace, ["Ocgio.Constants"] for another. *)

val cross_ns_layer2_module : namespace:string -> string -> string
(** Layer 2 module of a class of another namespace: ["Gio"], ["AppInfo"] ->
    ["Ocgio.App_info"]. Cycle members have their own shim module, so no cluster
    appears. *)

(** {1 Contexts} *)

val raw_library_ctx : generation_context -> generation_context
(** [ctx] for emitting into the raw library (layer 1). *)

val main_library_ctx : generation_context -> generation_context
(** [ctx] for emitting into the main library (layer 2). *)
