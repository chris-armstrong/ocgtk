(** Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use [Gtk.MultiFilter.append].

    Its methods, signals and properties are on {!class-type-every_filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Every_filter}. *)

(** The methods, signals and properties of a [GtkEveryFilter]. *)
class type every_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_every_filter : Raw.Every_filter.t
end

class every_filter : Raw.Every_filter.t -> every_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Every_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEveryFilter], give one already wrapped. *)

val new_ : unit -> every_filter_t
