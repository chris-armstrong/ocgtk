(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutIter from cyclic group Layout_and__layout_iter *)

(** A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    To obtain a [PangoLayoutIter], use [Pango.Layout.get_iter].

    The [PangoLayoutIter] structure is opaque, and has no user-visible fields.

    Its methods, signals and properties are on {!class-type-layout_iter_t}. The
    functions it is built on are in {!Ocpango.Raw.Layout_iter}. *)

class type layout_iter_t = Layout_and__layout_iter.layout_iter_t
(** The methods, signals and properties of a [LayoutIter]. *)

class layout_iter : Raw.Layout_iter.t -> layout_iter_t
(** Wraps a raw handle of {!Ocpango.Raw.Layout_iter.t}. *)
