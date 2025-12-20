(* Signal handlers for Resolver *)
class resolver_signals (obj : Resolver.t) = object
  (** Emitted when the resolver notices that the system resolver
configuration has changed. *)
  method on_reload ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"reload" ~callback ~after:false

end
