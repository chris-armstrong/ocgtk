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

class filter : Raw.Filter.t -> filter_t
