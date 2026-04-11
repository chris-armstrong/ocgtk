(* Signal handlers for Resolver *)
class resolver_signals (obj : Resolver.t) =
  object
    method on_reload ~callback =
      Gobject.Signal.connect_simple obj ~name:"reload" ~callback ~after:false
    (** Emitted when the resolver notices that the system resolver configuration
        has changed. *)
  end
