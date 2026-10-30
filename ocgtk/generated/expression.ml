class type expression_t = object
  (** {2:methods Methods} *)

  method bind :
    [ `object_ ] Gobject.obj ->
    string ->
    [ `object_ ] Gobject.obj option ->
    Raw.Expression_watch.t
  (** Bind [target]'s property named [property] to [self].

      The value that [self] evaluates to is set via [g_object_set()] on
      [target]. This is repeated whenever [self] changes to ensure that the
      object's property stays synchronized with [self].

      If [self]'s evaluation fails, [target]'s [property] is not updated. You
      can ensure that this doesn't happen by using a fallback expression.

      Note that this function takes ownership of [self]. If you want to keep it
      around, you should [Gtk.Expression.ref] it beforehand. *)

  method evaluate : [ `object_ ] Gobject.obj option -> Gobject.Value.t -> bool
  (** Evaluates the given expression and on success stores the result in
      [value].

      The [GType] of [value] will be the type given by
      [Gtk.Expression.get_value_type].

      It is possible that expressions cannot be evaluated - for example when the
      expression references objects that have been destroyed or set to [None].
      In that case [value] will remain empty and [false] will be returned. *)

  method get_value_type : unit -> Gobject.Type.t
  (** Gets the [GType] that this expression evaluates to.

      This type is constant and will not change over the lifetime of this
      expression. *)

  method is_static : unit -> bool
  (** Checks if the expression is static.

      A static expression will never change its result when
      [Gtk.Expression.evaluate] is called on it with the same arguments.

      That means a call to [Gtk.Expression.watch] is not necessary because it
      will never trigger a notify. *)

  method ref : unit -> expression_t
  (** Acquires a reference on the given [GtkExpression]. *)

  method unref : unit -> unit
  (** Releases a reference on the given [GtkExpression].

      If the reference was the last, the resources associated to the [self] are
      freed. *)

  (** {2:conversions Conversions} *)

  method as_expression : Raw.Expression.t
end

(* High-level class for Expression *)
class expression (obj : Raw.Expression.t) : expression_t =
  object (self)
    method bind :
        [ `object_ ] Gobject.obj ->
        string ->
        [ `object_ ] Gobject.obj option ->
        Raw.Expression_watch.t =
      fun target property this_ -> Raw.Expression.bind obj target property this_

    method evaluate : [ `object_ ] Gobject.obj option -> Gobject.Value.t -> bool
        =
      fun this_ value -> Raw.Expression.evaluate obj this_ value

    method get_value_type : unit -> Gobject.Type.t =
      fun () -> Raw.Expression.get_value_type obj

    method is_static : unit -> bool = fun () -> Raw.Expression.is_static obj

    method ref : unit -> expression_t =
      fun () -> new expression (Raw.Expression.ref obj)

    method unref : unit -> unit = fun () -> Raw.Expression.unref obj
    method as_expression = obj
  end
