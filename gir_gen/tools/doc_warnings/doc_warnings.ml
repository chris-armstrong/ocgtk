(* Prints a summary of the odoc warnings in a `dune build @doc` log. See
   README.md. *)

type format = Count | Line | Markdown

let main format log_file =
  let log = In_channel.with_open_bin log_file In_channel.input_all in
  let summary = Odoc_warnings.(summarise (parse log)) in
  print_string
    (match format with
    | Count -> Printf.sprintf "%d\n" (Odoc_warnings.total summary)
    | Line -> Odoc_warnings.to_line summary ^ "\n"
    | Markdown -> Odoc_warnings.to_markdown summary)

open Cmdliner

let format_arg =
  let formats = [ ("count", Count); ("line", Line); ("markdown", Markdown) ] in
  let doc =
    Printf.sprintf
      "Output: the total ($(b,count)), the total and the non-empty buckets on \
       one line ($(b,line)), or a table of every bucket ($(b,markdown)). One \
       of %s."
      (Arg.doc_alts_enum formats)
  in
  Arg.(value & opt (enum formats) Markdown & info [ "format" ] ~doc)

let log_arg =
  let doc = "Output of $(b,dune build @doc), stdout and stderr." in
  Arg.(required & pos 0 (some file) None & info [] ~docv:"LOG" ~doc)

let () =
  let doc = "classify the odoc warnings in a dune build @doc log" in
  Cmd.v (Cmd.info "doc_warnings" ~doc) Term.(const main $ format_arg $ log_arg)
  |> Cmd.eval |> exit
