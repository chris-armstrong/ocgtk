class type text_tag_table_t = object
  inherit Buildable.buildable_t

  method on_tag_added :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_changed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> size_changed:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tag_removed :
    ?after:bool ->
    callback:(tag:Text_tag.text_tag_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add : Text_tag.text_tag_t -> bool
  method get_size : unit -> int
  method lookup : string -> Text_tag.text_tag_t option
  method remove : Text_tag.text_tag_t -> unit
  method as_text_tag_table : Raw.Text_tag_table.t
end

(* High-level class for TextTagTable *)
class text_tag_table (obj : Raw.Text_tag_table.t) : text_tag_table_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method on_tag_added ?(after = false) ~callback () =
      Raw.Text_tag_table.on_tag_added ~after self#as_text_tag_table
        ~callback:(fun ~tag -> callback ~tag:(new Text_tag.text_tag tag))

    method on_tag_changed ?(after = false) ~callback () =
      Raw.Text_tag_table.on_tag_changed ~after self#as_text_tag_table
        ~callback:(fun ~tag ~size_changed ->
          callback ~tag:(new Text_tag.text_tag tag) ~size_changed)

    method on_tag_removed ?(after = false) ~callback () =
      Raw.Text_tag_table.on_tag_removed ~after self#as_text_tag_table
        ~callback:(fun ~tag -> callback ~tag:(new Text_tag.text_tag tag))

    method add : Text_tag.text_tag_t -> bool =
      fun tag ->
        let tag = tag#as_text_tag in
        Raw.Text_tag_table.add obj tag

    method get_size : unit -> int = fun () -> Raw.Text_tag_table.get_size obj

    method lookup : string -> Text_tag.text_tag_t option =
      fun name ->
        Option.map
          (fun ret -> new Text_tag.text_tag ret)
          (Raw.Text_tag_table.lookup obj name)

    method remove : Text_tag.text_tag_t -> unit =
      fun tag ->
        let tag = tag#as_text_tag in
        Raw.Text_tag_table.remove obj tag

    method as_text_tag_table = obj
  end

let new_ () : text_tag_table_t = new text_tag_table (Raw.Text_tag_table.new_ ())
