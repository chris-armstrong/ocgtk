(* Signal class defined in gtext_tag_table_signals.ml *)

class type text_tag_table_t = object
    inherit Gtext_tag_table_signals.text_tag_table_signals
    method add : GText_tag.text_tag_t -> bool
    method get_size : unit -> int
    method lookup : string -> GText_tag.text_tag_t option
    method remove : GText_tag.text_tag_t -> unit
    method as_text_tag_table : Text_tag_table.t
end

(* High-level class for TextTagTable *)
class text_tag_table (obj : Text_tag_table.t) : text_tag_table_t = object (self)
  inherit Gtext_tag_table_signals.text_tag_table_signals obj

  method add : GText_tag.text_tag_t -> bool =
    fun tag ->
      let tag = tag#as_text_tag in
      (Text_tag_table.add obj tag)

  method get_size : unit -> int =
    fun () ->
      (Text_tag_table.get_size obj)

  method lookup : string -> GText_tag.text_tag_t option =
    fun name ->
      Option.map (fun ret -> new GText_tag.text_tag ret) (Text_tag_table.lookup obj name)

  method remove : GText_tag.text_tag_t -> unit =
    fun tag ->
      let tag = tag#as_text_tag in
      (Text_tag_table.remove obj tag)

    method as_text_tag_table = obj
end

