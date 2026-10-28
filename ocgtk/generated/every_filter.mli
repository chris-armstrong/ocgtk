(** Matches an item when each of its filters matches.

    Its methods, signals and properties are on {!class-type-every_filter_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Every_filter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EveryFilter].}

    Inherits from:
    {{!Ocgtk.Multi_filter.class-type-multi_filter_t}Ocgtk.Multi_filter}

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}

    Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use [Gtk.MultiFilter.append]. *)
class type every_filter_t = object
  inherit Multi_filter.multi_filter_t

  (** {2:conversions Conversions} *)

  method as_every_filter : Raw.Every_filter.t
end

class every_filter : Raw.Every_filter.t -> every_filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Every_filter.t}. *)

(** {1:description Description}

    Matches an item when each of its filters matches.

    To add filters to a [GtkEveryFilter], use [Gtk.MultiFilter.append]. *)

(** {1:constructors Constructors} *)

val new_ : unit -> every_filter_t
[@@ocaml.doc
  "Creates a new empty \"every\" filter.\n\n\
   Use [Gtk.MultiFilter.append] to add filters to it.\n\n\
   This filter matches an item if each of the filters added to it\n\
   matches the item. In particular, this means that if no filter\n\
   has been added to it, the filter matches every item."]
