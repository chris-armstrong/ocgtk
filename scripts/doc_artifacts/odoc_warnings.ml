let is_odoc_warning = String.starts_with ~prefix:"Warning: "
let is_location = String.starts_with ~prefix:"File \""

let report output =
  let step (previous, acc) line =
    let acc =
      if not (is_odoc_warning line) then acc
      else
        match previous with
        | Some location when is_location location ->
            (location ^ "\n" ^ line) :: acc
        | Some _ | None -> line :: acc
    in
    (Some line, acc)
  in
  String.split_on_char '\n' output
  |> List.fold_left step (None, [])
  |> snd |> List.rev
