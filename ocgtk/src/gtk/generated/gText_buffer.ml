(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextBuffer from cyclic group Text_buffer_and__text_iter_and__text_mark *)

class type text_buffer_t = GText_buffer_and__text_iter_and__text_mark.text_buffer_t

class text_buffer = GText_buffer_and__text_iter_and__text_mark.text_buffer

let new_ (table : GText_tag_table.text_tag_table_t option) : text_buffer_t =
  let table = Option.map (fun c -> c#as_text_tag_table) table in
  new text_buffer
    (Text_buffer_and__text_iter_and__text_mark.Text_buffer.new_ table)
