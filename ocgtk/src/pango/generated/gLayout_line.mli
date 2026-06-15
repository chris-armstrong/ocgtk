(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for LayoutLine from cyclic group Layout_and__layout_iter_and__layout_line *)

class type layout_line_t =
  GLayout_and__layout_iter_and__layout_line.layout_line_t

class layout_line :
  Layout_and__layout_iter_and__layout_line.Layout_line.t ->
  layout_line_t

val make :
  GLayout_and__layout_iter_and__layout_line.layout_t ->
  int ->
  int ->
  unit ->
  int ->
  int ->
  layout_line_t
