(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Layout from cyclic group Layout_and__layout_iter *)

class type layout_t = Layout_and__layout_iter.layout_t

class layout = Layout_and__layout_iter.layout

let new_ (context : Context_and__font_and__font_map_and__fontset.context_t) :
    layout_t =
  let context = context#as_context in
  let obj_ = Raw.Layout.new_ context in
  new layout obj_
