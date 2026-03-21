class type fontset_simple_t = object
    method append : GContext_and__font_and__font_map_and__fontset.font_t -> unit
    method size : unit -> int
    method as_fontset_simple : Fontset_simple.t
end

class fontset_simple : Fontset_simple.t -> fontset_simple_t

