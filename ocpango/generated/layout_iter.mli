(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutIter from cyclic group Layout_and__layout_iter *)

(** A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    To obtain a [PangoLayoutIter], use [Pango.Layout.get_iter].

    The [PangoLayoutIter] structure is opaque, and has no user-visible fields.

    Its methods, signals and properties are on {!class-type-layout_iter_t}. The
    functions it is built on are in {!Ocpango.Raw.Layout_iter}. *)

class type layout_iter_t = Layout_and__layout_iter.layout_iter_t
(** The methods, signals and properties of a [PangoLayoutIter]. *)

class layout_iter : Raw.Layout_iter.t -> layout_iter_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Layout_iter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoLayoutIter], give one already wrapped. *)
