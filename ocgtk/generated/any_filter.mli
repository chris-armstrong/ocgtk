(** Matches an item when at least one of its filters matches.

    To add filters to a [GtkAnyFilter], use [Gtk.MultiFilter.append].

    Its methods, signals and properties are on {!class-type-any_filter_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Any_filter}. *)

(** The methods, signals and properties of a [AnyFilter]. *)
class type any_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_any_filter : Raw.Any_filter.t
end

class any_filter : Raw.Any_filter.t -> any_filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Any_filter.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> any_filter_t
[@@ocaml.doc
  "Creates a new empty \"any\" filter.\n\n\
   Use [Gtk.MultiFilter.append] to add filters to it.\n\n\
   This filter matches an item if any of the filters added to it\n\
   matches the item. In particular, this means that if no filter\n\
   has been added to it, the filter matches no item."]
