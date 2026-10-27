(** A [GParamSpec] for properties holding a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-param_spec_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Param_spec_expression}. *)

(** The methods, signals and properties of a [GtkParamSpecExpression]. *)
class type param_spec_expression_t = object
  method as_param_spec_expression : Raw.Param_spec_expression.t
end

class param_spec_expression :
  Raw.Param_spec_expression.t ->
  param_spec_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Param_spec_expression.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkParamSpecExpression], give one already wrapped. *)
