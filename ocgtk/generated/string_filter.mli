(** Determines whether to include items by comparing strings to a fixed search
    term.

    The strings are obtained from the items by evaluating an expression set with
    [Gtk.StringFilter.set_expression], and they are compared against a search
    term set with [Gtk.StringFilter.set_search].

    [GtkStringFilter] has several different modes of comparison - it can match
    the whole string, just a prefix, or any substring. Use
    [Gtk.StringFilter.set_match_mode] choose a mode.

    It is also possible to make case-insensitive comparisons, with
    [Gtk.StringFilter.set_ignore_case].

    Its methods, signals and properties are on {!class-type-string_filter_t}.
    The functions it is built on are in {!Ocgtk.Raw.String_filter}. *)

(** The methods, signals and properties of a [GtkStringFilter]. *)
class type string_filter_t = object
  inherit Filter.filter_t
  method get_expression : unit -> Expression.expression_t option
  method get_ignore_case : unit -> bool
  method get_match_mode : unit -> Enums.stringfiltermatchmode
  method get_search : unit -> string option
  method set_expression : Expression.expression_t option -> unit
  method set_ignore_case : bool -> unit
  method set_match_mode : Enums.stringfiltermatchmode -> unit
  method set_search : string option -> unit
  method as_string_filter : Raw.String_filter.t
end

class string_filter : Raw.String_filter.t -> string_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.String_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStringFilter], give one already wrapped. *)

val new_ : Expression.expression_t option -> string_filter_t
