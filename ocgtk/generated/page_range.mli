(** A range of pages to print.

    Its methods, signals and properties are on {!class-type-page_range_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgtk.Raw.Page_range}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PageRange].}

    A range of pages to print.

    See also [Gtk.PrintSettings.set_page_ranges]. *)
class type page_range_t = object
  method as_page_range : Raw.Page_range.t
end

class page_range : Raw.Page_range.t -> page_range_t
(** Wraps a raw handle of {!Ocgtk.Raw.Page_range.t}. *)

(** {1:description Description}

    A range of pages to print.

    See also [Gtk.PrintSettings.set_page_ranges]. *)
