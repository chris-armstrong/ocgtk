(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutLine from cyclic group Layout_and__layout_iter_and__layout_line *)

class type layout_line_t =
  GLayout_and__layout_iter_and__layout_line.layout_line_t

class layout_line = GLayout_and__layout_iter_and__layout_line.layout_line

let make (layout : GLayout_and__layout_iter_and__layout_line.layout_t)
    (start_index : int) (length : int) (runs : unit) (is_paragraph_start : int)
    (resolved_dir : int) : layout_line_t =
  new layout_line
    (Layout_and__layout_iter_and__layout_line.Layout_line.make layout#as_layout
       start_index length runs is_paragraph_start resolved_dir)
