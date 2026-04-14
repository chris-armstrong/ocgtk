(** GVariantType Module Tests

    These tests validate the GVariantType implementation including:
    - Type constant constructors (boolean, int32, string, etc.)
    - Type construction from strings
    - Type predicates (is_basic, is_container, is_array, etc.)
*)

(** {2 Type Constant Tests} *)

let test_boolean_type () =
  let t = Gvariant_type.boolean in
  Alcotest.(check string) "boolean type string" "b" (Gvariant_type.to_string t);
  Alcotest.(check bool) "boolean is basic" true (Gvariant_type.is_basic t);
  Alcotest.(check bool) "boolean is not container" false (Gvariant_type.is_container t)

let test_int32_type () =
  let t = Gvariant_type.int32 in
  Alcotest.(check string) "int32 type string" "i" (Gvariant_type.to_string t);
  Alcotest.(check bool) "int32 is basic" true (Gvariant_type.is_basic t)

let test_int64_type () =
  let t = Gvariant_type.int64 in
  Alcotest.(check string) "int64 type string" "x" (Gvariant_type.to_string t);
  Alcotest.(check bool) "int64 is basic" true (Gvariant_type.is_basic t)

let test_double_type () =
  let t = Gvariant_type.double in
  Alcotest.(check string) "double type string" "d" (Gvariant_type.to_string t);
  Alcotest.(check bool) "double is basic" true (Gvariant_type.is_basic t)

let test_string_type () =
  let t = Gvariant_type.string in
  Alcotest.(check string) "string type string" "s" (Gvariant_type.to_string t);
  Alcotest.(check bool) "string is basic" true (Gvariant_type.is_basic t)

let test_unit_type () =
  let t = Gvariant_type.unit in
  Alcotest.(check string) "unit type string" "()" (Gvariant_type.to_string t);
  Alcotest.(check bool) "unit is tuple" true (Gvariant_type.is_tuple t)

let test_variant_type () =
  let t = Gvariant_type.variant in
  Alcotest.(check string) "variant type string" "v" (Gvariant_type.to_string t);
  Alcotest.(check bool) "variant is variant" true (Gvariant_type.is_variant t)

let test_object_path_type () =
  let t = Gvariant_type.object_path in
  Alcotest.(check string) "object path type string" "o" (Gvariant_type.to_string t)

let test_signature_type () =
  let t = Gvariant_type.signature in
  Alcotest.(check string) "signature type string" "g" (Gvariant_type.to_string t)

(** {2 Type Construction Tests} *)

let test_of_string_basic () =
  let t = Gvariant_type.of_string "i" in
  Alcotest.(check string) "int32 from string" "i" (Gvariant_type.to_string t);
  Alcotest.(check bool) "int32 is basic" true (Gvariant_type.is_basic t)

let test_of_string_array () =
  let t = Gvariant_type.of_string "as" in
  Alcotest.(check string) "string array from string" "as" (Gvariant_type.to_string t);
  Alcotest.(check bool) "string array is array" true (Gvariant_type.is_array t);
  Alcotest.(check bool) "string array is container" true (Gvariant_type.is_container t)

let test_of_string_dict () =
  let t = Gvariant_type.of_string "a{sv}" in
  Alcotest.(check string) "dict from string" "a{sv}" (Gvariant_type.to_string t);
  Alcotest.(check bool) "dict is container" true (Gvariant_type.is_container t)

let test_of_string_tuple () =
  let t = Gvariant_type.of_string "(is)" in
  Alcotest.(check string) "tuple from string" "(is)" (Gvariant_type.to_string t);
  Alcotest.(check bool) "tuple is tuple" true (Gvariant_type.is_tuple t);
  Alcotest.(check bool) "tuple is container" true (Gvariant_type.is_container t)

(** {2 Predicate Tests} *)

let test_is_basic_variants () =
  Alcotest.(check bool) "boolean is basic" true (Gvariant_type.is_basic Gvariant_type.boolean);
  Alcotest.(check bool) "string is basic" true (Gvariant_type.is_basic Gvariant_type.string);
  Alcotest.(check bool) "int32 is basic" true (Gvariant_type.is_basic Gvariant_type.int32);
  (* Arrays and tuples are not basic *)
  let arr = Gvariant_type.of_string "ai" in
  Alcotest.(check bool) "array is not basic" false (Gvariant_type.is_basic arr)

let test_is_container_variants () =
  let arr = Gvariant_type.of_string "as" in
  let tup = Gvariant_type.of_string "(ii)" in
  let dict = Gvariant_type.of_string "a{sv}" in
  Alcotest.(check bool) "array is container" true (Gvariant_type.is_container arr);
  Alcotest.(check bool) "tuple is container" true (Gvariant_type.is_container tup);
  Alcotest.(check bool) "dict is container" true (Gvariant_type.is_container dict);
  Alcotest.(check bool) "string is not container" false (Gvariant_type.is_container Gvariant_type.string)

let test_is_array () =
  let arr = Gvariant_type.of_string "ai" in
  let tup = Gvariant_type.of_string "(ii)" in
  Alcotest.(check bool) "int array is array" true (Gvariant_type.is_array arr);
  Alcotest.(check bool) "tuple is not array" false (Gvariant_type.is_array tup);
  Alcotest.(check bool) "string is not array" false (Gvariant_type.is_array Gvariant_type.string)

let test_is_tuple () =
  let tup = Gvariant_type.of_string "(is)" in
  let arr = Gvariant_type.of_string "as" in
  Alcotest.(check bool) "tuple is tuple" true (Gvariant_type.is_tuple tup);
  Alcotest.(check bool) "array is not tuple" false (Gvariant_type.is_tuple arr);
  Alcotest.(check bool) "unit is tuple" true (Gvariant_type.is_tuple Gvariant_type.unit)

let test_is_dict_entry () =
  (* Note: a{sv} is an array of dict entries, not a dict entry itself.
     A dict entry type is {sv} - but this can only appear inside an array. *)
  let dict_array = Gvariant_type.of_string "a{sv}" in
  let arr = Gvariant_type.of_string "as" in
  (* a{sv} is an array containing dict entries, so it's a container but not a dict_entry *)
  Alcotest.(check bool) "dict array is container" true (Gvariant_type.is_container dict_array);
  Alcotest.(check bool) "dict array is not dict entry" false (Gvariant_type.is_dict_entry dict_array);
  Alcotest.(check bool) "array is not dict entry" false (Gvariant_type.is_dict_entry arr)

let test_is_variant () =
  Alcotest.(check bool) "variant type is variant" true (Gvariant_type.is_variant Gvariant_type.variant);
  Alcotest.(check bool) "string is not variant" false (Gvariant_type.is_variant Gvariant_type.string)

(** {2 Test Suite} *)

let () =
  Alcotest.run "GVariantType Tests" [
    "Type Constants", [
      Alcotest.test_case "boolean" `Quick test_boolean_type;
      Alcotest.test_case "int32" `Quick test_int32_type;
      Alcotest.test_case "int64" `Quick test_int64_type;
      Alcotest.test_case "double" `Quick test_double_type;
      Alcotest.test_case "string" `Quick test_string_type;
      Alcotest.test_case "unit" `Quick test_unit_type;
      Alcotest.test_case "variant" `Quick test_variant_type;
      Alcotest.test_case "object_path" `Quick test_object_path_type;
      Alcotest.test_case "signature" `Quick test_signature_type;
    ];

    "Type Construction", [
      Alcotest.test_case "basic from string" `Quick test_of_string_basic;
      Alcotest.test_case "array from string" `Quick test_of_string_array;
      Alcotest.test_case "dict from string" `Quick test_of_string_dict;
      Alcotest.test_case "tuple from string" `Quick test_of_string_tuple;
    ];

    "Predicates", [
      Alcotest.test_case "is_basic variants" `Quick test_is_basic_variants;
      Alcotest.test_case "is_container variants" `Quick test_is_container_variants;
      Alcotest.test_case "is_array" `Quick test_is_array;
      Alcotest.test_case "is_tuple" `Quick test_is_tuple;
      Alcotest.test_case "is_dict_entry" `Quick test_is_dict_entry;
      Alcotest.test_case "is_variant" `Quick test_is_variant;
    ];
  ]
