(* High-level class for ThreadedResolver *)
class threaded_resolver (obj : Threaded_resolver.t) = object (self)

    method as_threaded_resolver = obj
end

