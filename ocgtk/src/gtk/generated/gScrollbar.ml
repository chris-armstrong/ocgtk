class type scrollbar_t = object
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t option -> unit
    method as_scrollbar : Scrollbar.t
end

(* High-level class for Scrollbar *)
class scrollbar (obj : Scrollbar.t) : scrollbar_t = object (self)

  method get_adjustment : unit -> GAdjustment.adjustment_t =
    fun () ->
      new  GAdjustment.adjustment(Scrollbar.get_adjustment obj)

  method set_adjustment : GAdjustment.adjustment_t option -> unit =
    fun adjustment ->
      let adjustment = Option.map (fun (c) -> c#as_adjustment) adjustment in
      (Scrollbar.set_adjustment obj adjustment)

    method as_scrollbar = obj
end

