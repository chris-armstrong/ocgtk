(* GENERATED CODE - DO NOT EDIT *)
(* LayoutIter, a member of the cyclic module Layout_and__layout_iter *)

(** A [PangoLayoutIter] can be used to iterate over the visual extents of a
    [PangoLayout].

    To obtain a [PangoLayoutIter], use [Pango.Layout.get_iter].

    The [PangoLayoutIter] structure is opaque, and has no user-visible fields.

    The class built on this module is in {!Ocpango.Layout_iter}. *)

include module type of struct
  include Layout_and__layout_iter.Layout_iter
end
