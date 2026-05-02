(** Signal parameter marshalling — maps a GIR type to the OCaml
    getter/setter expressions and OCaml type string needed to marshal
    a signal parameter through [Gobject.Value.t].

    This module is purely functional: it has no side effects and does
    not perform any I/O or code emission.  Callers use the returned
    [marshaller] record to splice getter/setter expressions into the
    generated signal wrappers. *)

open Types

(** A resolved marshalling specification for a single signal parameter
    or return type. *)
type marshaller = {
  ocaml_type : string;
      (** The OCaml type expression that the signal callback will see.

          Examples:
          - ["bool"] for [gboolean]
          - ["Gtk_enums.orientation"] for a same-namespace enum
          - ["Ocgtk_gdk.Gdk_enums.modifiertype"] for a cross-namespace bitfield
          - ["Gtk.Widget.t Gobject.obj"] for a same-namespace GObject class
          - ["Gvariant.t"] for [GLib.Variant] *)
  getter_expr : string;
      (** OCaml expression that extracts the typed value from a
          [Gobject.Value.t].

          For primitives this is a direct [Gobject.Value.get_*] call.
          For enums/bitfields the expression composes [get_enum_int] /
          [get_flags_int] with the corresponding [_of_int] decoder. *)
  setter_expr : string;
      (** OCaml expression that stores a typed value into a
          [Gobject.Value.t].

          For primitives this is a direct [Gobject.Value.set_*] call.
          For enums/bitfields the expression composes [_to_int] with
          [set_enum_int] / [set_flags_int]. *)
}

(** The result of classifying a GIR type for signal marshalling. *)
type result =
  | Supported of marshaller
      (** The type can be marshalled; the record contains full details. *)
  | Unsupported of string
      (** The type cannot currently be marshalled; the string is a
          human-readable reason (used for error messages and test
          assertions). *)

(** [classify ~ctx ~gir_type] determines how to marshal [gir_type] as
    a signal parameter or return type in the context of the namespace
    described by [ctx].

    Same-namespace types are resolved directly from [ctx.enums],
    [ctx.bitfields], [ctx.classes], [ctx.interfaces], and [ctx.records].
    Cross-namespace types are resolved via [ctx.cross_references].

    Returns [Supported m] when marshalling is possible, [Unsupported
    reason] otherwise.  Currently unsupported cases include:
    - Array types ([GLib.Array])
    - Boxed record types (e.g. [Gtk.TextIter])
    - Callback parameter types (deferred to Milestone 4) *)
val classify : ctx:generation_context -> gir_type:gir_type -> result
