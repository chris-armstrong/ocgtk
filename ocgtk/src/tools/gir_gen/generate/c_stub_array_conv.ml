(* Array Conversion Helpers *)

open Printf
open Containers
open StdLabels
open Types

(** Array conversion helpers *)
module Array_conv = struct
  (* Check if an array contains string elements *)
  let is_string_array (array_info : gir_array) =
    let elem_name = String.lowercase_ascii array_info.element_type.name in
    let elem_ctype = array_info.element_type.c_type in
    String.equal elem_name "utf8"
    || String.equal elem_name "gchararray"
    || String.equal elem_name "filename"
    || C_stub_type_analysis.Type_analysis.is_string_type elem_ctype

  (** Generate conversion code for zero-terminated arrays. Handles both pointer
      arrays (NULL-terminated) and non-pointer arrays (structs). *)
  let zero_terminated_conversion ~length_var ~c_array_var ~var ~element_c_type
      ~element_tm ~is_pointer_array ~deref_prefix =
    if is_pointer_array then
      sprintf
        "int %s = Wosize_val(%s);\n\
        \    %s* %s = (%s*)g_malloc(sizeof(%s) * (%s + 1));\n\
        \    for (int i = 0; i < %s; i++) {\n\
        \      %s[i] = %s(Field(%s, i));\n\
        \    }\n\
        \    %s[%s] = NULL;"
        length_var var element_c_type c_array_var element_c_type element_c_type
        length_var length_var c_array_var element_tm.ml_to_c var c_array_var
        length_var
    else
      sprintf
        "int %s = Wosize_val(%s);\n\
        \    %s* %s = (%s*)g_malloc(sizeof(%s) * (%s + 1));\n\
        \    for (int i = 0; i < %s; i++) {\n\
        \      %s[i] = %s%s(Field(%s, i));\n\
        \    }\n\
        \    %s[%s] = (%s){0};"
        length_var var element_c_type c_array_var element_c_type element_c_type
        length_var length_var c_array_var deref_prefix element_tm.ml_to_c var
        c_array_var length_var element_c_type

  (** Generate conversion code for non-zero-terminated arrays. Allocates memory
      without extra slot for NULL terminator. *)
  let non_zero_terminated_conversion ~length_var ~c_array_var ~var
      ~element_c_type ~element_tm ~deref_prefix =
    sprintf
      "int %s = Wosize_val(%s);\n\
      \    %s* %s = (%s*)g_malloc(sizeof(%s) * %s);\n\
      \    for (int i = 0; i < %s; i++) {\n\
      \      %s[i] = %s%s(Field(%s, i));\n\
      \    }"
      length_var var element_c_type c_array_var element_c_type element_c_type
      length_var length_var c_array_var deref_prefix element_tm.ml_to_c var

  (** Generate length code when length is explicitly provided. *)
  let length_code_explicit ~length_var ~expr =
    sprintf "int %s = %s;" length_var expr

  (** Generate length code for zero-terminated pointer arrays. *)
  let length_code_for_zero_terminated_pointer ~length_var ~var =
    sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;" length_var var
      length_var length_var

  (** Generate length code for zero-terminated non-pointer arrays. *)
  let length_code_for_zero_terminated_nonpointer ~length_var ~var
      ~element_c_type =
    sprintf "int %s = 0;\n    while (%s[%s] != (%s)0) %s++;" length_var var
      length_var element_c_type length_var

  (** Generate length code for string arrays (NULL-terminated). *)
  let length_code_for_string_array ~length_var ~var =
    sprintf "int %s = 0;\n    while (%s[%s] != NULL) %s++;" length_var var
      length_var length_var

  (** Generate cleanup code for string arrays (frees each string and then the
      container). *)
  let cleanup_for_string_array ~length_var ~var =
    sprintf
      "for (int i = 0; i < %s; i++) {\n\
      \      g_free((gpointer)%s[i]);\n\
      \    }\n\
      \    g_free(%s);"
      length_var var var

  (** Generate cleanup code for pointer arrays (just frees the container). *)
  let cleanup_for_pointer_array ~var = sprintf "g_free(%s);" var

  (** Generate length code for arrays when no explicit length is provided.
      Returns the appropriate length code based on array properties. *)
  let length_code_for_array ~var ~length_var ~array_info ~is_pointer_array
      ~element_c_type =
    if array_info.zero_terminated then
      if is_pointer_array then
        length_code_for_zero_terminated_pointer ~length_var ~var
      else
        length_code_for_zero_terminated_nonpointer ~length_var ~var
          ~element_c_type
    else if is_string_array array_info then
      length_code_for_string_array ~length_var ~var
    else if is_pointer_array then
      (* For pointer arrays without explicit length info, assume zero-terminated
         This handles cases where the GIR file is missing zero-terminated="1" *)
      length_code_for_zero_terminated_pointer ~length_var ~var
    else
      (* Check for common C patterns that suggest zero-terminated arrays *)
      let array_c_type =
        Option.value ~default:"" array_info.element_type.c_type ^ "*"
      in
      if String.contains array_c_type '*' then
        (* Array C type suggests it's a pointer array - assume zero-terminated *)
        length_code_for_zero_terminated_pointer ~length_var ~var
      else
        (* No length information and not a string array - cannot safely convert *)
        failwith
          (sprintf
             "Array has no length information for %s (element type: %s). \
              Either zero-terminated, length, or fixed-size attribute \
              required."
             var array_info.element_type.name)

  (** Generate cleanup code for TransferFull ownership. Returns appropriate
      cleanup based on array properties. *)
  let cleanup_code_for_transfer_full ~array_info ~is_pointer_array ~length_var
      ~var =
    if is_string_array array_info then cleanup_for_string_array ~length_var ~var
    else if is_pointer_array then
      (* Generic pointer array: might need element-wise freeing, but we can't know the type *)
      (* For now, just free the container - this may leak if elements need freeing *)
      (* TODO: Add heuristics or metadata to determine if elements need freeing *)
      cleanup_for_pointer_array ~var
    else
      (* Primitive array: just free the container *)
      cleanup_for_pointer_array ~var

  (* Generate inline code for converting OCaml array to C array *)
  let generate_array_ml_to_c ~ctx ~var ~(array_info : gir_array)
      ~element_mapping:_ ~element_c_type ~transfer_ownership =
    (* Get element type mapping for conversion *)
    match
      Type_mappings.find_type_mapping_for_gir_type ~ctx array_info.element_type
    with
    | None ->
        failwith
          (sprintf "Array element type '%s' not supported"
             array_info.element_type.name)
    | Some element_tm ->
        let length_var = var ^ "_length" in
        let c_array_var = "c_" ^ var in
        let is_pointer_array = String.contains element_c_type '*' in

        (* Determine if this array should be zero-terminated *)
        let should_zero_terminate =
          array_info.zero_terminated
          ||
          (* Default: string arrays without explicit length are typically zero-terminated in GTK *)
          (is_string_array array_info && Option.is_none array_info.length)
        in

        (* For struct arrays (non-pointer elements), we need to dereference the
           conversion result since _val macros return pointers *)
        let deref_prefix = if is_pointer_array then "" else "*" in

        (* Generate conversion code based on array type *)
        let conversion_code =
          if should_zero_terminate then
            zero_terminated_conversion ~length_var ~c_array_var ~var
              ~element_c_type ~element_tm ~is_pointer_array ~deref_prefix
          else
            non_zero_terminated_conversion ~length_var ~c_array_var ~var
              ~element_c_type ~element_tm ~deref_prefix
        in

        (* Generate cleanup code if needed (TransferNone means we still own the memory) *)
        let cleanup_code =
          match transfer_ownership with
          | Types.TransferNone ->
              (* GTK won't free it, we must clean up after the call *)
              sprintf "g_free(%s);" c_array_var
          | Types.TransferFull | Types.TransferContainer
          | Types.TransferFloating ->
              (* GTK takes ownership, no cleanup needed *)
              ""
        in

        (conversion_code, c_array_var, length_var, cleanup_code)

  (* Check if an array is a GPtrArray (GLib.PtrArray) *)
  let is_gptr_array (array_info : gir_array) =
    match array_info.array_name with
    | Some name -> String.equal name "GLib.PtrArray"
    | None -> false

  (* Generate inline code for converting C array to OCaml array *)
  let generate_array_c_to_ml ~ctx ~var ~(array_info : gir_array) ~length_expr
      ~element_c_type ~transfer_ownership =
    match
      Type_mappings.find_type_mapping_for_gir_type ~ctx array_info.element_type
    with
    | None ->
        failwith
          (sprintf "Array element type '%s' not supported"
             array_info.element_type.name)
    | Some element_tm ->
        let ml_array_var = "ml_" ^ var in
        let length_var = var ^ "_length" in
        let is_pointer_array = String.contains element_c_type '*' in

        (* Check if this is a GPtrArray *)
        let is_gptr_array = is_gptr_array array_info in

        (* Generate code to compute length and access data *)
        let length_code, data_var =
          if is_gptr_array then
            (* GPtrArray: use ->len and ->pdata fields *)
            ( sprintf "guint %s = %s->len;\n    gpointer* %s_pdata = %s->pdata;"
                length_var var var var,
              var ^ "_pdata" )
          else
            (* Regular array *)
            let lcode =
              match length_expr with
              | Some expr -> length_code_explicit ~length_var ~expr
              | None ->
                  length_code_for_array ~var ~length_var ~array_info
                    ~is_pointer_array ~element_c_type
            in
            (lcode, var)
        in

        (* Generate conversion loop *)
        let conversion_code =
          if is_gptr_array then
            (* GPtrArray: cast pdata elements to correct type *)
            sprintf
              "%s\n\
              \    CAMLlocal1(%s);\n\
              \    %s = caml_alloc(%s, 0);\n\
              \    for (int i = 0; i < %s; i++) {\n\
              \      Store_field(%s, i, %s((%s)%s[i]));\n\
              \    }"
              length_code ml_array_var ml_array_var length_var length_var
              ml_array_var element_tm.c_to_ml element_c_type data_var
          else
            sprintf
              "%s\n\
              \    CAMLlocal1(%s);\n\
              \    %s = caml_alloc(%s, 0);\n\
              \    for (int i = 0; i < %s; i++) {\n\
              \      Store_field(%s, i, %s(%s[i]));\n\
              \    }"
              length_code ml_array_var ml_array_var length_var length_var
              ml_array_var element_tm.c_to_ml data_var
        in

        (* Generate cleanup code if we own the array (TransferFull or TransferContainer) *)
        let cleanup_code =
          match transfer_ownership with
          | Types.TransferNone | Types.TransferFloating ->
              (* GTK owns the array - don't free it *)
              ""
          | Types.TransferContainer ->
              (* We own the container but not the elements *)
              if is_gptr_array then
                (* GPtrArray: use g_ptr_array_unref *)
                sprintf "g_ptr_array_unref(%s);" var
              else cleanup_for_pointer_array ~var
          | Types.TransferFull ->
              (* We own everything *)
              if is_gptr_array then
                (* GPtrArray: free with g_ptr_array_unref (TRUE to free elements) *)
                sprintf "g_ptr_array_free(%s, TRUE);" var
              else
                cleanup_code_for_transfer_full ~array_info ~is_pointer_array
                  ~length_var ~var
        in

        (conversion_code, ml_array_var, cleanup_code)
end
