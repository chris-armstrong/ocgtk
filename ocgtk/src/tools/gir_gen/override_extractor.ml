(* Override Extractor: Version extraction from GIR doc strings *)

(** Extract a "Since X.Y[.Z]" version string from a doc comment.
    Matches patterns like:
      "Since 2.26"
      "Since: 2.74"
      "(Since: 1.16)."
      "Available since 1.50"
    Returns None if no Since pattern is found. *)
let extract_since_version doc_text =
  let re =
    Re.(
      compile
        (seq
           [
             str "Since";
             rep (set " \t");
             opt (char ':');
             rep (set " \t");
             group
               (seq
                  [
                    rep1 digit;
                    char '.';
                    rep1 digit;
                    opt (seq [ char '.'; rep1 digit ]);
                  ]);
           ]))
  in
  match Re.exec_opt re doc_text with
  | None -> None
  | Some groups -> (
      try Some (Re.Group.get groups 1)
      with Not_found -> None)
