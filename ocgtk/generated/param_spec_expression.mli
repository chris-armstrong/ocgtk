(** A [GParamSpec] for properties holding a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-param_spec_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Param_spec_expression}. *)

(** The methods, signals and properties of a [ParamSpecExpression]. *)
class type param_spec_expression_t = object
  method as_param_spec_expression : Raw.Param_spec_expression.t
end

class param_spec_expression :
  Raw.Param_spec_expression.t ->
  param_spec_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.Param_spec_expression.t}. *)
