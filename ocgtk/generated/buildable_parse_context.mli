(** Provides context for parsing GtkBuilder UI files.

    Its methods, signals and properties are on
    {!class-type-buildable_parse_context_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Buildable_parse_context}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BuildableParseContext].}

    Provides context for parsing GtkBuilder UI files.

    [GtkBuildableParseContext] is an opaque struct. *)
class type buildable_parse_context_t = object
  (** {2:methods Methods} *)

  method get_element : unit -> string option
  (** Retrieves the name of the currently open element.

      If called from the start_element or end_element handlers this will give
      the element_name as passed to those functions. For the parent elements,
      see gtk_buildable_parse_context_get_element_stack(). *)

  method get_element_stack : unit -> string array
  (** Retrieves the element stack from the internal state of the parser.

      The returned [GPtrArray] is an array of strings where the last item is the
      currently open tag (as would be returned by
      gtk_buildable_parse_context_get_element()) and the previous item is its
      immediate parent.

      This function is intended to be used in the start_element and end_element
      handlers where gtk_buildable_parse_context_get_element() would merely
      return the name of the element that is being processed. *)

  (** {2:conversions Conversions} *)

  method as_buildable_parse_context : Raw.Buildable_parse_context.t
end

class buildable_parse_context :
  Raw.Buildable_parse_context.t ->
  buildable_parse_context_t
(** Wraps a raw handle of {!Ocgtk.Raw.Buildable_parse_context.t}. *)

(** {1:description Description}

    Provides context for parsing GtkBuilder UI files.

    [GtkBuildableParseContext] is an opaque struct. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
