(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutIter from cyclic group Layout_and__layout_iter *)

(** A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    Its methods, signals and properties are on {!class-type-layout_iter_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocpango.Raw.Layout_iter}. *)

(** {1:class Class} *)

class type layout_iter_t = Layout_and__layout_iter.layout_iter_t
(** {b The methods, signals and properties of a [LayoutIter].}

    A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    To obtain a [PangoLayoutIter], use [Pango.Layout.get_iter].

    The [PangoLayoutIter] structure is opaque, and has no user-visible fields.
*)

class layout_iter : Raw.Layout_iter.t -> layout_iter_t
(** Wraps a raw handle of {!Ocpango.Raw.Layout_iter.t}. *)

(** {1:description Description}

    A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    To obtain a [PangoLayoutIter], use [Pango.Layout.get_iter].

    The [PangoLayoutIter] structure is opaque, and has no user-visible fields.
*)
