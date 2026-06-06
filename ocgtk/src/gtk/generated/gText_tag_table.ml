class type text_tag_table_t = object
  inherit GBuildable.buildable_t

  method on_tag_added :
    ?after:bool ->
    callback:(tag:GText_tag.text_tag_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_changed :
    ?after:bool ->
    callback:(tag:GText_tag.text_tag_t option -> size_changed:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_removed :
    ?after:bool ->
    callback:(tag:GText_tag.text_tag_t option -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add : GText_tag.text_tag_t -> bool
  method get_size : unit -> int
  method lookup : string -> GText_tag.text_tag_t option
  method remove : GText_tag.text_tag_t -> unit
  method as_text_tag_table : Text_tag_table.t
end

(* High-level class for TextTagTable *)
class text_tag_table (obj : Text_tag_table.t) : text_tag_table_t =
  object (self)
    inherit GBuildable.buildable (Buildable.from_gobject obj)

    method on_tag_added ?(after = false) ~callback () =
      Text_tag_table.on_tag_added ~after self#as_text_tag_table
        ~callback:(fun ~tag ->
          callback ~tag:(Option.map (fun w -> new GText_tag.text_tag w) tag))

    method on_tag_changed ?(after = false) ~callback () =
      Text_tag_table.on_tag_changed ~after self#as_text_tag_table
        ~callback:(fun ~tag ~size_changed ->
          callback
            ~tag:(Option.map (fun w -> new GText_tag.text_tag w) tag)
            ~size_changed)

    method on_tag_removed ?(after = false) ~callback () =
      Text_tag_table.on_tag_removed ~after self#as_text_tag_table
        ~callback:(fun ~tag ->
          callback ~tag:(Option.map (fun w -> new GText_tag.text_tag w) tag))

    method add : GText_tag.text_tag_t -> bool =
      fun tag ->
        let tag = tag#as_text_tag in
        Text_tag_table.add obj tag

    method get_size : unit -> int = fun () -> Text_tag_table.get_size obj

    method lookup : string -> GText_tag.text_tag_t option =
      fun name ->
        Option.map
          (fun ret -> new GText_tag.text_tag ret)
          (Text_tag_table.lookup obj name)

    method remove : GText_tag.text_tag_t -> unit =
      fun tag ->
        let tag = tag#as_text_tag in
        Text_tag_table.remove obj tag

    method as_text_tag_table = obj
  end

let new_ () : text_tag_table_t = new text_tag_table (Text_tag_table.new_ ())
