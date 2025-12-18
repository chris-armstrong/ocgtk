class filter : Filter.t ->
  object
    inherit Gfilter_signals.filter_signals
    method changed : Gtk_enums.filterchange -> unit
    method get_strictness : unit -> Gtk_enums.filtermatch
    method as_filter : Filter.t
  end

