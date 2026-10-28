(* GENERATED CODE - DO NOT EDIT *)
(* ATContext, a member of the cyclic module At_context_and__accessible *)

(** Communicates with platform-specific assistive technologies API.

    Each platform supported by GTK implements a [GtkATContext] subclass, and is
    responsible for updating the accessible state in response to state changes
    in [GtkAccessible].

    The class built on this module is in {!Ocgtk.At_context}. *)

include module type of struct
  include At_context_and__accessible.At_context
end
