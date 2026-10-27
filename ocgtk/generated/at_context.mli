(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ATContext from cyclic group At_context_and__accessible *)

(** Communicates with platform-specific assistive technologies API.

    Each platform supported by GTK implements a [GtkATContext] subclass, and is
    responsible for updating the accessible state in response to state changes
    in [GtkAccessible].

    Its methods, signals and properties are on {!class-type-at_context_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.At_context}. *)

class type at_context_t = At_context_and__accessible.at_context_t
(** The methods, signals and properties of a [GtkATContext]. *)

class at_context : Raw.At_context.t -> at_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.At_context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkATContext], give one already wrapped. *)

(** {2:constructors Constructors} *)

val create :
  Enums.accessiblerole ->
  At_context_and__accessible.accessible_t ->
  Ocgdk.Display.display_t ->
  at_context_t
(** Creates a new [GtkATContext] instance for the given accessible role,
    accessible instance, and display connection.

    The [GtkATContext] implementation being instantiated will depend on the
    platform. *)
