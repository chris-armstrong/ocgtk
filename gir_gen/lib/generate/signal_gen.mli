(** Signal code generation — pure-data API.

    [Signal_gen] classifies GIR signals into a [signal_emission] record that
    captures all information needed to emit L1 module bindings and L2 class
    method forwarders. All functions are pure and produce strings; no file I/O
    is performed here.

    Invariants:
    - [classify] only returns [Ok] when every [In]-direction parameter has a
      supported marshaller and the return type is supported.
    - [emit_l1_val] / [emit_l1_let] / [emit_l2_method] are total functions over
      [signal_emission] values — they never fail. *)

open Types

type signal_emission = {
  signal : gir_signal;  (** The original GIR signal record. *)
  method_name : string;
      (** Sanitized OCaml method name, prefixed with ["on_"]. Example:
          ["on_clicked"] for signal ["clicked"]. *)
  raw_signal_name : string;
      (** Original GIR signal name used as the GLib signal string. Example:
          ["key-pressed"]. *)
  param_marshallers : (gir_param * Signal_marshaller.marshaller) list;
      (** In-direction parameters paired with their marshalling specs. Non-In
          parameters are excluded (signals with Out/InOut params return [Error]
          from [classify]). *)
  return_marshaller : Signal_marshaller.marshaller option;
      (** [None] for void/unit return; [Some m] for a non-void return type. *)
  ocaml_callback_type : string;
      (** Full OCaml function type for the callback parameter. Examples:
          - ["unit -> unit"] for zero-param void signal (connect_simple)
          - ["n_press:int -> x:float -> y:float -> unit"] for pressed signal *)
  strategy : [ `Connect_simple | `Closure ];
      (** [`Connect_simple] when no parameters and void return (fast path);
          [`Closure] otherwise (uses [Gobject.Closure.create]). *)
}
(** All computed values for a single signal, derived from [classify].

    This record is the single source of truth for signal code generation: both
    L1 (module-level) and L2 (class-level) emission functions operate on it. *)

val sanitize_signal_name : string -> string
(** [sanitize_signal_name name] converts a GIR signal name to a valid OCaml
    identifier prefixed with ["on_"].

    Hyphens are replaced by underscores and the result is converted to
    snake_case. If the result is an OCaml keyword, a trailing underscore is
    appended before prepending ["on_"].

    Example: ["key-pressed"] -> ["on_key_pressed"]. *)

val classify :
  ctx:generation_context -> gir_signal -> (signal_emission, string) result
(** [classify ~ctx signal] analyses [signal] and returns a fully-populated
    [signal_emission] record when all parameters and the return type can be
    marshalled.

    Returns [Error reason] when:
    - Any parameter has a non-In direction (Out or InOut).
    - Any parameter type is [Unsupported] by {!Signal_marshaller.classify}.
    - The return type is [Unsupported] by {!Signal_marshaller.classify}.

    The [reason] string is human-readable and suitable for stderr skip messages
    (format: ["Skipping signal '<name>' for <Class> (<reason>)"]). *)

val emit_l1_val : signal_emission -> string
(** [emit_l1_val e] returns a single [val] declaration line for insertion into a
    generated [.mli] file.

    Example output:
    {[
    val on_clicked :
      ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
    ]}

    The [t] argument is the L1 module's own [t] (positional, not labelled). *)

val emit_l1_let : signal_emission -> string
(** [emit_l1_let e] returns a [let] binding for insertion into a generated [.ml]
    file.

    For [`Connect_simple] strategy, the binding delegates to
    [Gobject.Signal.connect_simple]. For [`Closure] strategy, a
    [Gobject.Closure.create] expression is built that extracts each parameter
    with [Gobject.Closure.nth argv ~pos:N] (positions start at 1; position 0 is
    the sender object and is implicit).

    The returned string ends with a blank line. *)

val emit_l2_method :
  signal_emission -> layer1_module_name:string -> class_snake:string -> string
(** [emit_l2_method e ~layer1_module_name ~class_snake] returns a class method
    definition for insertion into a generated L2 object body.

    The method forwards to [<layer1_module_name>.<method_name>] using
    [self#as_<class_snake>] as the object argument.

    Example output for [~layer1_module_name:"Window"] and
    [~class_snake:"window"]:
    {[
      method on_close_request ~callback =
        Window.on_close_request self#as_window ~callback
    ]}

    The returned string ends with a blank line. *)

val emit_l2_method_sig : signal_emission -> string
(** [emit_l2_method_sig e] returns a class type method signature for insertion
    into a generated L2 class type body.

    Unlike [emit_l2_method], which emits a concrete method implementation, this
    emits only the method type declaration (for use in [class type] definitions
    and generated [.mli] files). The callback type is taken directly from
    [e.ocaml_callback_type] — no re-derivation.

    Example output:
    {[
      method on_close_request : callback:(unit -> bool) -> Gobject.Signal.handler_id
    ]} *)
