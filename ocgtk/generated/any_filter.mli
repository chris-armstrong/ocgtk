(** Matches an item when at least one of its filters matches.

    To add filters to a [GtkAnyFilter], use [Gtk.MultiFilter.append].

    Its methods, signals and properties are on {!class-type-any_filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Any_filter}. *)

(** The methods, signals and properties of a [GtkAnyFilter]. *)
class type any_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_any_filter : Raw.Any_filter.t
end

class any_filter : Raw.Any_filter.t -> any_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Any_filter.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAnyFilter], give one already wrapped. *)

val new_ : unit -> any_filter_t
