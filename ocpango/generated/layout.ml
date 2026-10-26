(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Layout from cyclic group Layout_and__layout_iter *)

class type layout_t = GLayout_and__layout_iter.layout_t

class layout = GLayout_and__layout_iter.layout

let new_ (context : GContext_and__font_and__font_map_and__fontset.context_t) :
    layout_t =
  let context = context#as_context in
  let obj_ = Layout_and__layout_iter.Layout.new_ context in
  new layout obj_
