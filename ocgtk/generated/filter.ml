class type filter_t = object
  method on_changed :
    ?after:bool ->
    callback:(change:Enums.filterchange -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method changed : Enums.filterchange -> unit
  method get_strictness : unit -> Enums.filtermatch
  method match_ : [ `object_ ] Gobject.obj -> bool
  method as_filter : Raw.Filter.t
end

(* High-level class for Filter *)
class filter (obj : Raw.Filter.t) : filter_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Filter.on_changed ~after self#as_filter ~callback

    method changed : Enums.filterchange -> unit =
      fun change -> Raw.Filter.changed obj change

    method get_strictness : unit -> Enums.filtermatch =
      fun () -> Raw.Filter.get_strictness obj

    method match_ : [ `object_ ] Gobject.obj -> bool =
      fun item -> Raw.Filter.match_ obj item

    method as_filter = obj
  end
