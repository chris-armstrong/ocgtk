class type initable_t = object
  method init : GCancellable.cancellable_t option -> (bool, GError.t) result
  method as_initable : Initable.t
end

(* High-level class for Initable *)
class initable (obj : Initable.t) : initable_t =
  object (self)
    method init : GCancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Initable.init obj cancellable

    method as_initable = obj
  end
