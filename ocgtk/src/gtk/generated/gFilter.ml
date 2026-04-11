(* Signal class defined in gfilter_signals.ml *)

class type filter_t = object
  inherit Gfilter_signals.filter_signals
  method changed : Gtk_enums.filterchange -> unit
  method get_strictness : unit -> Gtk_enums.filtermatch
  method match_ : [ `object_ ] Gobject.obj -> bool
  method as_filter : Filter.t
end

(* High-level class for Filter *)
class filter (obj : Filter.t) : filter_t =
  object (self)
    inherit Gfilter_signals.filter_signals obj

    method changed : Gtk_enums.filterchange -> unit =
      fun change -> Filter.changed obj change

    method get_strictness : unit -> Gtk_enums.filtermatch =
      fun () -> Filter.get_strictness obj

    method match_ : [ `object_ ] Gobject.obj -> bool =
      fun item -> Filter.match_ obj item

    method as_filter = obj
  end
