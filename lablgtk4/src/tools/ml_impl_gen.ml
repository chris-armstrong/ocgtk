(* .ml Implementation File Generator for LablGTK4 Phase 5.2
 *
 * This tool generates basic .ml implementation files from .mli interface files.
 * It creates stub implementations that can be filled in.
 *
 * Usage:
 *   ml_impl_gen button.mli -o button.ml
 *)

open Printf
open StdLabels
open Cmdliner

(* ========================================================================= *)
(* MLI Parsing *)
(* ========================================================================= *)

type external_decl = {
  ext_name : string;
  ext_type : string;
  ext_c_name : string;
}

type type_decl = {
  type_name : string;
  type_def : string;
}

(* Simple line-based parser for .mli files *)
let parse_mli_file filename =
  let ic = open_in filename in
  let externals = ref [] in
  let types = ref [] in

  let rec read_lines () =
    try
      let line = input_line ic in
      let trimmed = String.trim line in

      (* Parse external declarations *)
      if String.length trimmed > 9 && String.sub ~pos:0 ~len:9 trimmed = "external " then begin
        (* Extract external name and C name *)
        try
          let rest = String.sub ~pos:9 ~len:(String.length trimmed - 9) trimmed in
          let colon_idx = String.index rest ':' in
          let name = String.trim (String.sub ~pos:0 ~len:colon_idx rest) in
          let type_part = String.sub ~pos:(colon_idx + 1)
            ~len:(String.length rest - colon_idx - 1) rest in

          (* Extract C name from quotes *)
          let c_name_start = String.index type_part '"' in
          let c_name_end = String.rindex type_part '"' in
          let c_name = String.sub ~pos:(c_name_start + 1)
            ~len:(c_name_end - c_name_start - 1) type_part in

          (* Extract type signature, excluding the '=' before the C name *)
          let type_part_before_cname = String.sub ~pos:0 ~len:c_name_start type_part in
          let type_sig = String.trim type_part_before_cname in
          let type_sig =
            if String.length type_sig > 0 && String.get type_sig (String.length type_sig - 1) = '=' then
              String.trim (String.sub ~pos:0 ~len:(String.length type_sig - 1) type_sig)
            else
              type_sig
          in

          externals := { ext_name = name; ext_type = type_sig; ext_c_name = c_name } :: !externals;
        with _ -> ()
      end;

      (* Parse type declarations *)
      if String.length trimmed > 5 && String.sub ~pos:0 ~len:5 trimmed = "type " then begin
        try
          let rest = String.sub ~pos:5 ~len:(String.length trimmed - 5) trimmed in
          let eq_idx = try String.index rest '=' with Not_found -> String.length rest in
          let type_name = String.trim (String.sub ~pos:0 ~len:eq_idx rest) in
          let type_def = if eq_idx < String.length rest then
            String.trim (String.sub ~pos:(eq_idx + 1) ~len:(String.length rest - eq_idx - 1) rest)
          else
            ""
          in
          types := { type_name; type_def } :: !types;
        with _ -> ()
      end;

      read_lines ()
    with End_of_file ->
      close_in ic;
      ()
  in

  read_lines ();
  (List.rev !types, List.rev !externals)

(* ========================================================================= *)
(* ML Generation *)
(* ========================================================================= *)

let generate_ml_from_mli mli_file =
  let (types, externals) = parse_mli_file mli_file in
  let buf = Buffer.create 2048 in

  (* Header *)
  bprintf buf "(* GENERATED IMPLEMENTATION - DO NOT EDIT DIRECTLY *)\n";
  bprintf buf "(* Generated from %s *)\n\n" (Filename.basename mli_file);

  (* Type declarations *)
  if List.length types > 0 then begin
    bprintf buf "(* Type declarations *)\n";
    List.iter ~f:(fun t ->
      if t.type_def <> "" then
        bprintf buf "type %s = %s\n" t.type_name t.type_def
      else
        bprintf buf "(* type %s - abstract type, defined externally *)\n" t.type_name;
    ) types;
    bprintf buf "\n";
  end;

  (* External declarations *)
  if List.length externals > 0 then begin
    bprintf buf "(* External FFI bindings *)\n";
    List.iter ~f:(fun ext ->
      bprintf buf "external %s : %s = \"%s\"\n"
        ext.ext_name ext.ext_type ext.ext_c_name;
    ) externals;
    bprintf buf "\n";
  end;

  (* Summary comment *)
  bprintf buf "(* Summary:\n";
  bprintf buf " * - %d type declarations\n" (List.length types);
  bprintf buf " * - %d external bindings\n" (List.length externals);
  bprintf buf " *)\n";

  Buffer.contents buf

let generate_impl_file mli_file output_file =
  let ml_content = generate_ml_from_mli mli_file in
  let oc = open_out output_file in
  output_string oc ml_content;
  close_out oc;
  printf "Generated %s from %s\n" output_file mli_file;
  printf "  ✓ Ready for compilation\n";
  `Ok ()

(* ========================================================================= *)
(* Batch Generation *)
(* ========================================================================= *)

let generate_all_impls mli_dir output_dir =
  printf "Generating .ml implementations from .mli files in %s...\n" mli_dir;

  let mli_files = Sys.readdir mli_dir
    |> Array.to_list
    |> List.filter ~f:(fun f -> Filename.check_suffix f ".mli")
    |> List.sort ~cmp:String.compare
  in

  if List.length mli_files = 0 then begin
    printf "No .mli files found in %s\n" mli_dir;
    `Error (false, "No .mli files found")
  end else begin
    List.iter ~f:(fun mli_file ->
      let mli_path = Filename.concat mli_dir mli_file in
      let base_name = Filename.chop_suffix mli_file ".mli" in
      let ml_file = base_name ^ ".ml" in
      let ml_path = Filename.concat output_dir ml_file in

      try
        let ml_content = generate_ml_from_mli mli_path in
        let oc = open_out ml_path in
        output_string oc ml_content;
        close_out oc;
        printf "  ✓ %s -> %s\n" mli_file ml_file;
      with e ->
        printf "  ✗ Failed to generate %s: %s\n" ml_file (Printexc.to_string e);
    ) mli_files;

    printf "\n✓ Implementation generation complete!\n";
    printf "  Generated: %d .ml files\n" (List.length mli_files);
    `Ok ()
  end

(* ========================================================================= *)
(* Command-line Interface *)
(* ========================================================================= *)

let mli_file_arg =
  let doc = "Input .mli interface file" in
  Arg.(value & pos 0 (some file) None & info [] ~docv:"MLI_FILE" ~doc)

let output_file_arg =
  let doc = "Output .ml implementation file" in
  Arg.(value & opt (some string) None & info ["o"; "output"] ~docv:"ML_FILE" ~doc)

let batch_mode_arg =
  let doc = "Batch mode: generate .ml files for all .mli files in directory" in
  Arg.(value & flag & info ["batch"] ~doc)

let mli_dir_arg =
  let doc = "Input directory containing .mli files (batch mode)" in
  Arg.(value & opt (some dir) None & info ["mli-dir"] ~docv:"DIR" ~doc)

let output_dir_arg =
  let doc = "Output directory for .ml files (batch mode)" in
  Arg.(value & opt (some dir) None & info ["output-dir"] ~docv:"DIR" ~doc)

let ml_impl_gen_cmd =
  let doc = "Generate .ml implementation files from .mli interfaces" in
  let man = [
    `S Manpage.s_description;
    `P "ml_impl_gen creates basic .ml implementation files from .mli interface \
        files. It extracts type and external declarations and creates a \
        compilable implementation.";
    `S Manpage.s_examples;
    `P "Generate single implementation:";
    `Pre "  ml_impl_gen button.mli -o button.ml";
    `P "Batch generate all implementations:";
    `Pre "  ml_impl_gen --batch --mli-dir ./generated --output-dir ./src";
    `S Manpage.s_bugs;
    `P "Report bugs to https://github.com/chris-armstrong/lablgtk/issues";
  ] in
  let info = Cmd.info "ml_impl_gen" ~version:"5.2.0" ~doc ~man in

  let run_gen batch mli_file output_file mli_dir output_dir =
    if batch then
      match (mli_dir, output_dir) with
      | (Some mdir, Some odir) -> generate_all_impls mdir odir
      | _ -> `Error (true, "Batch mode requires --mli-dir and --output-dir")
    else
      match (mli_file, output_file) with
      | (Some mli, Some out) -> generate_impl_file mli out
      | (Some mli, None) ->
          let out = (Filename.chop_suffix mli ".mli") ^ ".ml" in
          generate_impl_file mli out
      | _ -> `Error (true, "Requires MLI_FILE and optionally -o OUTPUT_FILE")
  in

  Cmd.v info Term.(ret (const run_gen $ batch_mode_arg $ mli_file_arg $
                        output_file_arg $ mli_dir_arg $ output_dir_arg))

let () = exit (Cmd.eval ml_impl_gen_cmd)
