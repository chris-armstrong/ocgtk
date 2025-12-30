(* High-level class for Initable *)
class initable (obj : Initable.t) = object (self)

  method init : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Initable.init obj cancellable)

    method as_initable = obj
end

