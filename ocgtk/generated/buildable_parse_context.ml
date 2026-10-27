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

(* High-level class for BuildableParseContext *)
class buildable_parse_context (obj : Raw.Buildable_parse_context.t) :
  buildable_parse_context_t =
  object (self)
    method get_element : unit -> string option =
      fun () -> Raw.Buildable_parse_context.get_element obj

    method get_element_stack : unit -> string array =
      fun () -> Raw.Buildable_parse_context.get_element_stack obj

    method as_buildable_parse_context = obj
  end
