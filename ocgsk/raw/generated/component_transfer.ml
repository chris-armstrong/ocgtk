(* GENERATED CODE - DO NOT EDIT *)
(* ComponentTransfer: ComponentTransfer *)

(** Specifies a transfer function for a color component to be applied while
    rendering.

    The available functions include linear, piecewise-linear, gamma and step
    functions.

    Note that the transfer function is applied to un-premultiplied values, and
    all results are clamped to the \[0, 1\] range.

    The class built on this module is in {!Ocgsk.Component_transfer}. *)

type t = [ `component_transfer ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gsk_component_transfer_get_type"

external new_discrete : int -> float array -> t
  = "ml_gsk_component_transfer_new_discrete"
(** Creates a new component transfer that applies a step function.

    The new value is computed as

    C' = values\[k\]

    where k is the smallest value such that

    k / n <= C < (k + 1) / n

    <figure>

    Component transfer: discrete

    </figure> *)

external new_gamma : float -> float -> float -> t
  = "ml_gsk_component_transfer_new_gamma"
(** Creates a new component transfer that applies a gamma transform.

    The new value is computed as

    C' = amp * pow (C, exp) + ofs

    <figure>

    Component transfer: gamma

    </figure> *)

external new_identity : unit -> t = "ml_gsk_component_transfer_new_identity"
(** Creates a new component transfer that doesn't change the component value.

    <figure>

    Component transfer: identity

    </figure> *)

external new_levels : float -> t = "ml_gsk_component_transfer_new_levels"
(** Creates a new component transfer that limits the values of the component to
    [n] levels.

    The new value is computed as

    C' = (floor (C * n) + 0.5) / n

    <figure>

    Component transfer: levels

    </figure> *)

external new_linear : float -> float -> t
  = "ml_gsk_component_transfer_new_linear"
(** Creates a new component transfer that applies a linear transform.

    The new value is computed as

    C' = C * m + b

    <figure>

    Component transfer: linear

    </figure> *)

external new_table : int -> float array -> t
  = "ml_gsk_component_transfer_new_table"
(** Creates a new component transfer that applies a piecewise linear function.

    The new value is computed as

    C' = values\[k\] + (C - k / (n - 1)) * n * (values\[k + 1\] - values\[k\])

    where k is the smallest value such that

    k / (n - 1) <= C < (k + 1) / (n - 1)

    <figure>

    Component transfer: table

    </figure> *)

(* Methods *)
