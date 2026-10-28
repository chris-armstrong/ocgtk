(** Specifies a transfer function for a color component to be applied while
    rendering.

    The available functions include linear, piecewise-linear, gamma and step
    functions.

    Note that the transfer function is applied to un-premultiplied values, and
    all results are clamped to the \[0, 1\] range.

    Its methods, signals and properties are on
    {!class-type-component_transfer_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Component_transfer}. *)

(** {b The methods, signals and properties of a [ComponentTransfer].}

    Specifies a transfer function for a color component to be applied while
    rendering.

    The available functions include linear, piecewise-linear, gamma and step
    functions.

    Note that the transfer function is applied to un-premultiplied values, and
    all results are clamped to the \[0, 1\] range. *)
class type component_transfer_t = object
  method as_component_transfer : Raw.Component_transfer.t
end

class component_transfer : Raw.Component_transfer.t -> component_transfer_t
(** Wraps a raw handle of {!Ocgsk.Raw.Component_transfer.t}. *)

(** {2:constructors Constructors} *)

val new_discrete : int -> float array -> component_transfer_t
(** Creates a new component transfer that applies a step function.

    The new value is computed as

    C' = values\[k\]

    where k is the smallest value such that

    k / n <= C < (k + 1) / n

    <figure>

    Component transfer: discrete

    </figure> *)

val new_gamma : float -> float -> float -> component_transfer_t
(** Creates a new component transfer that applies a gamma transform.

    The new value is computed as

    C' = amp * pow (C, exp) + ofs

    <figure>

    Component transfer: gamma

    </figure> *)

val new_identity : unit -> component_transfer_t
(** Creates a new component transfer that doesn't change the component value.

    <figure>

    Component transfer: identity

    </figure> *)

val new_levels : float -> component_transfer_t
(** Creates a new component transfer that limits the values of the component to
    [n] levels.

    The new value is computed as

    C' = (floor (C * n) + 0.5) / n

    <figure>

    Component transfer: levels

    </figure> *)

val new_linear : float -> float -> component_transfer_t
(** Creates a new component transfer that applies a linear transform.

    The new value is computed as

    C' = C * m + b

    <figure>

    Component transfer: linear

    </figure> *)

val new_table : int -> float array -> component_transfer_t
(** Creates a new component transfer that applies a piecewise linear function.

    The new value is computed as

    C' = values\[k\] + (C - k / (n - 1)) * n * (values\[k + 1\] - values\[k\])

    where k is the smallest value such that

    k / (n - 1) <= C < (k + 1) / (n - 1)

    <figure>

    Component transfer: table

    </figure> *)
