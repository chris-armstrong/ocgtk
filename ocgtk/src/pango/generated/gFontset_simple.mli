class fontset_simple : Fontset_simple.t ->
  object
    method append : #GContext_and__font_and__font_map_and__fontset.font -> unit
    method size : unit -> int
    method as_fontset_simple : Fontset_simple.t
  end

