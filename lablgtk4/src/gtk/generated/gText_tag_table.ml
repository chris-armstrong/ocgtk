(* Signal class defined in gtext_tag_table_signals.ml *)

(* High-level class for TextTagTable *)
class text_tag_table (obj : Text_tag_table.t) = object (self)
  inherit Gtext_tag_table_signals.text_tag_table_signals obj

  method add : 'p1. (#GText_tag.text_tag as 'p1) -> bool = fun tag -> (Text_tag_table.add obj ( tag#as_text_tag ))

  method get_size : unit -> int = fun () -> (Text_tag_table.get_size obj )

  method lookup : string -> GText_tag.text_tag option = fun name -> Option.map (fun ret -> new GText_tag.text_tag ret) (Text_tag_table.lookup obj name)

  method remove : 'p1. (#GText_tag.text_tag as 'p1) -> unit = fun tag -> (Text_tag_table.remove obj ( tag#as_text_tag ))

    method as_text_tag_table = obj
end

