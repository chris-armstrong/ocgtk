(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextBuffer from cyclic group Text_buffer_and__text_iter_and__text_mark *)

class type text_buffer_t = GText_buffer_and__text_iter_and__text_mark.text_buffer_t

class text_buffer : Text_buffer_and__text_iter_and__text_mark.Text_buffer.t -> text_buffer_t

val new_ : GText_tag_table.text_tag_table_t option -> text_buffer_t
