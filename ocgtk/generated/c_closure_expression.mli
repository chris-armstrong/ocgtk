(** A variant of [GtkClosureExpression] using a C closure.

    Its methods, signals and properties are on
    {!class-type-c_closure_expression_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.C_closure_expression}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CClosureExpression].}

    Inherits from: {{!Ocgtk.Expression.class-type-expression_t}Ocgtk.Expression}

    A variant of [GtkClosureExpression] using a C closure. *)
class type c_closure_expression_t = object
  inherit Expression.expression_t

  (** {2:conversions Conversions} *)

  method as_c_closure_expression : Raw.C_closure_expression.t
end

class c_closure_expression :
  Raw.C_closure_expression.t ->
  c_closure_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.C_closure_expression.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
