(* GENERATED CODE - DO NOT EDIT *)
(* CicpParams, a member of the cyclic module Cicp_params_and__color_state *)

(** Contains the parameters that define a colorstate with cicp parameters.

    Cicp parameters are specified in the ITU-T H.273
    {{:https://www.itu.int/rec/T-REC-H.273/en}specification}.

    See the documentation of individual properties for supported values.

    The 'unspecified' value (2) is not treated in any special way, and must be
    replaced by a different value before creating a color state.

    [GdkCicpParams] can be used as a builder object to construct a color state
    from Cicp data with
    {{!Ocgdk.Raw.Cicp_params.val-build_color_state}[Gdk.CicpParams.build_color_state]}.
    The function will return an error if the given parameters are not supported.

    You can obtain a [GdkCicpParams] object from a color state with
    {{!Ocgdk.Raw.Color_state.val-create_cicp_params}[Gdk.ColorState.create_cicp_params]}.
    This can be used to create a variant of a color state, by changing just one
    of the cicp parameters, or just to obtain information about the color state.

    The class built on this module is in {!Ocgdk.Cicp_params}. *)

include module type of struct
  include Cicp_params_and__color_state.Cicp_params
end
