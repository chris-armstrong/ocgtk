class scrollable : Scrollable.t ->
  object
    method get_hadjustment : unit -> GAdjustment.adjustment option
    method get_hscroll_policy : unit -> Gtk_enums.scrollablepolicy
    method get_vadjustment : unit -> GAdjustment.adjustment option
    method get_vscroll_policy : unit -> Gtk_enums.scrollablepolicy
    method set_hadjustment : #GAdjustment.adjustment option -> unit
    method set_hscroll_policy : Gtk_enums.scrollablepolicy -> unit
    method set_vadjustment : #GAdjustment.adjustment option -> unit
    method set_vscroll_policy : Gtk_enums.scrollablepolicy -> unit
    method as_scrollable : Scrollable.t
  end

