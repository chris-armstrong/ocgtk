type bucket =
  | Own_line
  | Misplaced_tag
  | Not_allowed
  | Empty_markup
  | Unpaired
  | Bad_markup
  | Unresolved_reference
  | Other

let all_buckets =
  [
    Own_line;
    Misplaced_tag;
    Not_allowed;
    Empty_markup;
    Unpaired;
    Bad_markup;
    Unresolved_reference;
    Other;
  ]

let bucket_name = function
  | Own_line -> "own-line"
  | Misplaced_tag -> "misplaced-tag"
  | Not_allowed -> "not-allowed"
  | Empty_markup -> "empty-markup"
  | Unpaired -> "unpaired"
  | Bad_markup -> "bad-markup"
  | Unresolved_reference -> "unresolved-reference"
  | Other -> "other"

let is_fixed_at_emission = function
  | Own_line | Misplaced_tag -> true
  | Not_allowed | Empty_markup | Unpaired | Bad_markup | Unresolved_reference
  | Other ->
      false

let equal_bucket a b =
  match (a, b) with
  | Own_line, Own_line
  | Misplaced_tag, Misplaced_tag
  | Not_allowed, Not_allowed
  | Empty_markup, Empty_markup
  | Unpaired, Unpaired
  | Bad_markup, Bad_markup
  | Unresolved_reference, Unresolved_reference
  | Other, Other ->
      true
  | ( ( Own_line | Misplaced_tag | Not_allowed | Empty_markup | Unpaired
      | Bad_markup | Unresolved_reference | Other ),
      _ ) ->
      false

type warning = { file : string; line : int; message : string }

(* First match wins: a misplaced tag is reported with the same wording as
   own-line and not-allowed markup, so it is tried first, and an empty
   reference with the wording of empty markup. The patterns are
   odoc's message texts (odoc 3.x). *)
let rules =
  let open Re in
  let tag_subject = seq [ bos; str "'@" ] in
  let placement =
    alt [ str "should begin on its own line"; str "is not allowed in" ]
  in
  List.map
    (fun (re, bucket) -> (compile re, bucket))
    [
      (seq [ tag_subject; rep any; placement ], Misplaced_tag);
      (str "should begin on its own line", Own_line);
      (str "is not allowed in", Not_allowed);
      (str "Identifier in reference", Bad_markup);
      (str "should not be empty", Empty_markup);
      (seq [ bos; alt [ str "Unpaired "; str "Missing end of" ] ], Unpaired);
      (str "Failed to resolve reference", Unresolved_reference);
      ( alt
          [
            str "bad markup";
            str "bad heading level";
            str "heading level should be";
            seq [ bos; str "Unknown tag" ];
            str "expects";
          ],
        Bad_markup );
    ]

let classify message =
  List.find_map
    (fun (re, bucket) -> if Re.execp re message then Some bucket else None)
    rules
  |> Option.value ~default:Other

let location_re =
  Re.compile
    Re.(
      seq
        [
          bos;
          str "File \"";
          group (rep1 (compl [ char '"' ]));
          str "\", line ";
          group (rep1 digit);
          str ", characters ";
          rep1 (alt [ digit; char '-' ]);
          char ':';
          eos;
        ])

let warning_prefix = "Warning: "

let is_doc_source file =
  List.exists (Filename.check_suffix file) [ ".ml"; ".mli"; ".mld" ]

(* odoc names a page by its path from its build directory
   ("../../../../ocgtk/index.mld"), a module by its path from the build
   context ("ocgtk/generated/button.mli"). *)
let rec normalise_path path =
  let strip prefix =
    if String.starts_with ~prefix path then
      Some
        (String.sub path (String.length prefix)
           (String.length path - String.length prefix))
    else None
  in
  match (strip "../", strip "_build/default/") with
  | Some rest, _ | None, Some rest -> normalise_path rest
  | None, None -> path

let location_of_line text =
  let ( let* ) = Option.bind in
  let* groups = Re.exec_opt location_re text in
  let file = Re.Group.get groups 1 in
  let* line = int_of_string_opt (Re.Group.get groups 2) in
  if is_doc_source file then Some (normalise_path file, line) else None

let message_of_line text =
  if String.starts_with ~prefix:warning_prefix text then
    Some
      (String.sub text
         (String.length warning_prefix)
         (String.length text - String.length warning_prefix))
  else None

let parse log =
  let rec go acc = function
    | header :: next :: rest -> (
        match (location_of_line header, message_of_line next) with
        | Some (file, line), Some message ->
            go ({ file; line; message } :: acc) rest
        | _ -> go acc (next :: rest))
    | [ _ ] | [] -> List.rev acc
  in
  go [] (String.split_on_char '\n' log)

type summary = (bucket * warning list) list

let summarise warnings =
  let classified = List.map (fun w -> (classify w.message, w)) warnings in
  List.map
    (fun bucket ->
      ( bucket,
        List.filter_map
          (fun (b, w) -> if equal_bucket b bucket then Some w else None)
          classified ))
    all_buckets

let count summary bucket =
  List.find_opt (fun (b, _) -> equal_bucket b bucket) summary
  |> Option.fold ~none:0 ~some:(fun (_, ws) -> List.length ws)

let total summary =
  List.fold_left (fun acc (_, ws) -> acc + List.length ws) 0 summary

let to_line summary =
  let counts =
    List.filter_map
      (fun (bucket, ws) ->
        match ws with
        | [] -> None
        | _ :: _ ->
            Some (Printf.sprintf "%s %d" (bucket_name bucket) (List.length ws)))
      summary
  in
  match counts with
  | [] -> string_of_int (total summary)
  | _ :: _ ->
      Printf.sprintf "%d (%s)" (total summary) (String.concat ", " counts)

(* Table cells: a "|" ends the cell and a backquote opens code. *)
let escape_cell text =
  String.to_seq text
  |> Seq.map (function
    | ('|' | '`') as c -> Printf.sprintf "\\%c" c
    | c -> String.make 1 c)
  |> List.of_seq |> String.concat ""

let markdown_row (bucket, ws) =
  let first =
    match ws with
    | [] -> ""
    | { file; line; message } :: _ ->
        Printf.sprintf "%s:%d: %s" file line message |> escape_cell
  in
  Printf.sprintf "| %s | %d | %s | %s |" (bucket_name bucket) (List.length ws)
    (if is_fixed_at_emission bucket then "yes" else "no")
    first

let to_markdown summary =
  String.concat "\n"
    ([
       Printf.sprintf "### odoc warnings: %d" (total summary);
       "";
       "| Bucket | Count | Fixed at emission | First warning |";
       "| --- | ---: | --- | --- |";
     ]
    @ List.map markdown_row summary)
  ^ "\n"
