(* High-level class for Scrollbar *)
class scrollbar (obj : Scrollbar.t) = object (self)

  method get_adjustment : unit -> GAdjustment.adjustment =
    fun () ->
      new  GAdjustment.adjustment(Scrollbar.get_adjustment obj)

  method set_adjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit =
    fun adjustment ->
      let adjustment = Option.map (fun (c) -> c#as_adjustment) adjustment in
      (Scrollbar.set_adjustment obj adjustment)

    method as_scrollbar = obj
end

