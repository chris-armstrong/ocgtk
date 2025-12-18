(* High-level class for Scrollable *)
class scrollable (obj : Scrollable.t) = object (self)

  method get_hadjustment : unit -> GAdjustment.adjustment option = fun () -> Option.map (fun ret -> new GAdjustment.adjustment ret) (Scrollable.get_hadjustment obj )

  method get_hscroll_policy : unit -> Gtk_enums.scrollablepolicy = fun () -> (Scrollable.get_hscroll_policy obj )

  method get_vadjustment : unit -> GAdjustment.adjustment option = fun () -> Option.map (fun ret -> new GAdjustment.adjustment ret) (Scrollable.get_vadjustment obj )

  method get_vscroll_policy : unit -> Gtk_enums.scrollablepolicy = fun () -> (Scrollable.get_vscroll_policy obj )

  method set_hadjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit = fun hadjustment -> (Scrollable.set_hadjustment obj ( hadjustment |> Option.map (fun x -> x#as_adjustment) ))

  method set_hscroll_policy : Gtk_enums.scrollablepolicy -> unit = fun policy -> (Scrollable.set_hscroll_policy obj policy)

  method set_vadjustment : 'p1. (#GAdjustment.adjustment as 'p1) option -> unit = fun vadjustment -> (Scrollable.set_vadjustment obj ( vadjustment |> Option.map (fun x -> x#as_adjustment) ))

  method set_vscroll_policy : Gtk_enums.scrollablepolicy -> unit = fun policy -> (Scrollable.set_vscroll_policy obj policy)

    method as_scrollable = obj
end

