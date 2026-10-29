(** A range inside the text of an accessible object.

    Its methods, signals and properties are on
    {!class-type-accessible_text_range_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Accessible_text_range}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AccessibleTextRange].}

    A range inside the text of an accessible object. *)
class type accessible_text_range_t = object
  (** {2:conversions Conversions} *)

  method as_accessible_text_range : Raw.Accessible_text_range.t
end

class accessible_text_range :
  Raw.Accessible_text_range.t ->
  accessible_text_range_t
(** Wraps a raw handle of {!Ocgtk.Raw.Accessible_text_range.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
