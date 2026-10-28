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
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.String_filter}. *)

(** The methods, signals and properties of a [StringFilter]. *)
class type string_filter_t = object
  inherit Filter.filter_t

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression that the string filter uses to obtain strings from
      items. *)

  method get_ignore_case : unit -> bool
  (** Returns whether the filter ignores case differences. *)

  method get_match_mode : unit -> Enums.stringfiltermatchmode
  (** Returns the match mode that the filter is using. *)

  method get_search : unit -> string option
  (** Gets the search term. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that the string filter uses to obtain strings from
      items.

      The expression must have a value type of [G_TYPE_STRING]. *)

  method set_ignore_case : bool -> unit
  (** Sets whether the filter ignores case differences. *)

  method set_match_mode : Enums.stringfiltermatchmode -> unit
  (** Sets the match mode for the filter. *)

  method set_search : string option -> unit
  (** Sets the string to search for. *)

  method as_string_filter : Raw.String_filter.t
end

class string_filter : Raw.String_filter.t -> string_filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.String_filter.t}. *)

(** {2:constructors Constructors} *)

val new_ : Expression.expression_t option -> string_filter_t
(** Creates a new string filter.

    You will want to set up the filter by providing a string to search for and
    by providing a property to look up on the item. *)
