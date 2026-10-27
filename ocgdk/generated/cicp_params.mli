(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for CicpParams from cyclic group Cicp_params_and__color_state *)

(** Contains the parameters that define a colorstate with cicp parameters.

    Cicp parameters are specified in the ITU-T H.273
    {{:https://www.itu.int/rec/T-REC-H.273/en}specification}.

    See the documentation of individual properties for supported values.

    The 'unspecified' value (2) is not treated in any special way, and must be
    replaced by a different value before creating a color state.

    [GdkCicpParams] can be used as a builder object to construct a color state
    from Cicp data with [Gdk.CicpParams.build_color_state]. The function will
    return an error if the given parameters are not supported.

    You can obtain a [GdkCicpParams] object from a color state with
    [Gdk.ColorState.create_cicp_params]. This can be used to create a variant of
    a color state, by changing just one of the cicp parameters, or just to
    obtain information about the color state.

    Its methods, signals and properties are on {!class-type-cicp_params_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgdk.Raw.Cicp_params}. *)

class type cicp_params_t = Cicp_params_and__color_state.cicp_params_t
(** The methods, signals and properties of a [GdkCicpParams]. *)

class cicp_params : Raw.Cicp_params.t -> cicp_params_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Cicp_params.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkCicpParams], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> cicp_params_t
[@@ocaml.doc
  "Creates a new [GdkCicpParams] object.\n\n\
   The initial values of the properties are the values for \"undefined\"\n\
   and need to be set before a color state object can be built."]
