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

class scrollable : Scrollable.t -> scrollable_t

