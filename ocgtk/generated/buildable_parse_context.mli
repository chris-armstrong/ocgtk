(** Provides context for parsing GtkBuilder UI files.

    [GtkBuildableParseContext] is an opaque struct.

    Its methods, signals and properties are on
    {!class-type-buildable_parse_context_t}. The functions it is built on are in
    {!Ocgtk.Raw.Buildable_parse_context}. *)

(** The methods, signals and properties of a [GtkBuildableParseContext]. *)
class type buildable_parse_context_t = object
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

  method as_buildable_parse_context : Raw.Buildable_parse_context.t
end

class buildable_parse_context :
  Raw.Buildable_parse_context.t ->
  buildable_parse_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Buildable_parse_context.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkBuildableParseContext], give one already wrapped.
*)
