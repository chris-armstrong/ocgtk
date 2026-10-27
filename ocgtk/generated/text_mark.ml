(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextMark from cyclic group Text_buffer_and__text_iter_and__text_mark *)

class type text_mark_t = Text_buffer_and__text_iter_and__text_mark.text_mark_t

class text_mark = Text_buffer_and__text_iter_and__text_mark.text_mark

let new_ (name : string option) (left_gravity : bool) : text_mark_t =
  let obj_ = Raw.Text_mark.new_ name left_gravity in
  new text_mark obj_
