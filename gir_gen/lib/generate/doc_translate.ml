(* Composition of Doc_ast / Doc_parse / Doc_render; see the .mli. *)

include Doc_ast

let parse = Doc_parse.parse
let parse_with_fallbacks = Doc_parse.parse_with_fallbacks
let render = Doc_render.render
let render_as = Doc_render.render_as
let render_with_fallbacks = Doc_render.render_with_fallbacks

let translate_with_fallbacks ?ret_shape ctx s =
  let t, parse_fbs = parse_with_fallbacks ctx s in
  let out, render_fbs = render_with_fallbacks ?ret_shape ctx t in
  (out, parse_fbs @ render_fbs)

let translate ?ret_shape ctx s = fst (translate_with_fallbacks ?ret_shape ctx s)
