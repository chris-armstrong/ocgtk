class type text_tag_table_t = object
  inherit GBuildable.buildable_t

  method on_tag_added :
    callback:(tag:Text_tag.t Gobject.obj option -> unit) ->
    Gobject.Signal.handler_id

  method on_tag_changed :
    callback:(tag:Text_tag.t Gobject.obj option -> size_changed:bool -> unit) ->
    Gobject.Signal.handler_id

  method on_tag_removed :
    callback:(tag:Text_tag.t Gobject.obj option -> unit) ->
    Gobject.Signal.handler_id

  method add : GText_tag.text_tag_t -> bool
  method get_size : unit -> int
  method lookup : string -> GText_tag.text_tag_t option
  method remove : GText_tag.text_tag_t -> unit
  method as_text_tag_table : Text_tag_table.t
end

class text_tag_table : Text_tag_table.t -> text_tag_table_t

val new_ : unit -> text_tag_table_t
