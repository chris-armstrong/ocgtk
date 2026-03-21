class type scrollable_t = object
    method get_hadjustment : unit -> GAdjustment.adjustment_t option
    method get_hscroll_policy : unit -> Gtk_enums.scrollablepolicy
    method get_vadjustment : unit -> GAdjustment.adjustment_t option
    method get_vscroll_policy : unit -> Gtk_enums.scrollablepolicy
    method set_hadjustment : GAdjustment.adjustment_t option -> unit
    method set_hscroll_policy : Gtk_enums.scrollablepolicy -> unit
    method set_vadjustment : GAdjustment.adjustment_t option -> unit
    method set_vscroll_policy : Gtk_enums.scrollablepolicy -> unit
    method as_scrollable : Scrollable.t
end

(* High-level class for Scrollable *)
class scrollable (obj : Scrollable.t) : scrollable_t = object (self)

  method get_hadjustment : unit -> GAdjustment.adjustment_t option =
    fun () ->
      Option.map (fun ret -> new GAdjustment.adjustment ret) (Scrollable.get_hadjustment obj)

  method get_hscroll_policy : unit -> Gtk_enums.scrollablepolicy =
    fun () ->
      (Scrollable.get_hscroll_policy obj)

  method get_vadjustment : unit -> GAdjustment.adjustment_t option =
    fun () ->
      Option.map (fun ret -> new GAdjustment.adjustment ret) (Scrollable.get_vadjustment obj)

  method get_vscroll_policy : unit -> Gtk_enums.scrollablepolicy =
    fun () ->
      (Scrollable.get_vscroll_policy obj)

  method set_hadjustment : GAdjustment.adjustment_t option -> unit =
    fun hadjustment ->
      let hadjustment = Option.map (fun (c) -> c#as_adjustment) hadjustment in
      (Scrollable.set_hadjustment obj hadjustment)

  method set_hscroll_policy : Gtk_enums.scrollablepolicy -> unit =
    fun policy ->
      (Scrollable.set_hscroll_policy obj policy)

  method set_vadjustment : GAdjustment.adjustment_t option -> unit =
    fun vadjustment ->
      let vadjustment = Option.map (fun (c) -> c#as_adjustment) vadjustment in
      (Scrollable.set_vadjustment obj vadjustment)

  method set_vscroll_policy : Gtk_enums.scrollablepolicy -> unit =
    fun policy ->
      (Scrollable.set_vscroll_policy obj policy)

    method as_scrollable = obj
end

