(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextMark from cyclic group Text_buffer_and__text_iter_and__text_mark *)

class type text_mark_t = GText_buffer_and__text_iter_and__text_mark.text_mark_t

class text_mark :
  Text_buffer_and__text_iter_and__text_mark.Text_mark.t ->
  text_mark_t

val new_ : string option -> bool -> text_mark_t
