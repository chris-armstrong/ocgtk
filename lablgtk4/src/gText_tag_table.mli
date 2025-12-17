class text_tag_table : Text_tag_table.t ->
  object
    inherit Gtext_tag_table_signals.text_tag_table_signals
    method add : #GText_tag.text_tag -> bool
    method get_size : unit -> int
    method lookup : string -> GText_tag.text_tag option
    method remove : #GText_tag.text_tag -> unit
    method as_text_tag_table : Text_tag_table.t
  end

