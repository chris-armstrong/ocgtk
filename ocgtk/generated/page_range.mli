(** A range of pages to print.

    See also [Gtk.PrintSettings.set_page_ranges].

    Its methods, signals and properties are on {!class-type-page_range_t}. The
    functions it is built on are in {!Ocgtk.Raw.Page_range}. *)

(** The methods, signals and properties of a [GtkPageRange]. *)
class type page_range_t = object
  method as_page_range : Raw.Page_range.t
end

class page_range : Raw.Page_range.t -> page_range_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Page_range.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPageRange], give one already wrapped. *)
