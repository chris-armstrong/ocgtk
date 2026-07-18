(* Fold-based helper for parsing Xmlm element trees.

   The Xmlm event stream is a flat sequence of [`El_start], [`El_end],
   [`Data], [`Dtd] events. Parsing a single element with sibling children is
   the same pattern everywhere in the GIR parser: consume events, match each
   child's tag, handle it, advance. Doing this by hand with a [let rec] loop
   and mutable accumulators is verbose and error-prone — forgetting the
   recursive call after a branch silently drops the rest of the element's
   children (a bug class already present in the wild, e.g. the <function>
   branch of [parse_record_contents]).

   [fold_element] owns the sibling-advance loop. Each child is dispatched to
   a handler that consumes the child entirely; [fold_element] then moves to
   the next sibling automatically. A handler cannot forget to advance. *)

type input = Xmlm.input
type attrs = Xmlm.attribute list
type tag = Xmlm.name

type 'acc handler = attrs:attrs -> 'acc -> 'acc
type 'acc dispatch = tag -> 'acc handler option

(* Skip to the end of the current element, given that its [`El_start] has
   just been consumed. [depth] is the current nesting depth relative to the
   element we want to skip; it starts at 1. *)
let rec skip_element input depth =
  if depth = 0 then ()
  else
    match Xmlm.input input with
    | `El_start _ -> skip_element input (depth + 1)
    | `El_end -> skip_element input (depth - 1)
    | `Data _ -> skip_element input depth
    | `Dtd _ -> skip_element input depth

(* [leaf ~input f] is a handler for a child whose body is irrelevant — only
   its attributes matter. It computes the new accumulator from [attrs] via
   [f] and then [skip_element]s the rest of the child (consuming its
   [`El_end]). Use for self-closing or empty children such as <type>. *)
let leaf ~input f =
  (fun ~attrs acc ->
     let acc' = f ~attrs acc in
     skip_element input 1;
     acc')

let default_on_data _ acc = acc

(* [fold_element ~input ~dispatch ~init ()] folds the children of the element
   whose [`El_start] has just been consumed, and returns the accumulator at
   the matching [`El_end] (which it consumes).

   For each child [`El_start (tag, attrs)] it calls [dispatch tag]:
   - [Some h] -> invoke [h ~attrs acc]; the handler must consume the rest of
     the child, including its matching [`El_end] (typically by recursing into
     [fold_element], or via [leaf] / [skip_element]).
   - [None] -> [skip_element] the unknown child (the only safe default;
     interpreting an unknown child as anything else would silently mis-parse
     the parent's remaining children).

   [on_data] folds interleaved text data (default: ignore). *)
let fold_element ~input ~dispatch ?(on_data = default_on_data) ~init () =
  let rec loop acc =
    match Xmlm.input input with
    | `El_start (tag, attrs) ->
        let acc =
          match dispatch tag with
          | Some h -> h ~attrs acc
          | None ->
              skip_element input 1;
              acc
        in
        loop acc
    | `El_end -> acc
    | `Data s -> loop (on_data s acc)
    | `Dtd _ -> loop acc
  in
  loop init

(* [fold_document] is the top-level variant: it folds a sequence of sibling
   elements until end-of-input rather than until a matching [`El_end]. The
   GIR document is not wrapped in a single element, so [parse_document] needs
   this, not [fold_element]. *)
let fold_document ~input ~dispatch ?(on_data = default_on_data) ~init () =
  let rec loop acc =
    if Xmlm.eoi input then acc
    else
      match Xmlm.input input with
      | `El_start (tag, attrs) ->
          let acc =
            match dispatch tag with
            | Some h -> h ~attrs acc
            | None ->
                skip_element input 1;
                acc
          in
          loop acc
      | `El_end -> loop acc
      | `Data s -> loop (on_data s acc)
      | `Dtd _ -> loop acc
  in
  loop init