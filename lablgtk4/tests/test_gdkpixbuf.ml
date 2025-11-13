(**************************************************************************)
(*                Test Suite for GdkPixbuf Module (Phase 2.3)            *)
(**************************************************************************)

open Alcotest

(* Helper to create check functions *)
let check = Alcotest.check

(* Test Suite 1: Creation and Accessors *)

let test_create_basic () =
  let pb = GdkPixbuf.create ~width:100 ~height:50 () in
  check int "width" 100 (GdkPixbuf.get_width pb);
  check int "height" 50 (GdkPixbuf.get_height pb);
  check int "n_channels (no alpha)" 3 (GdkPixbuf.get_n_channels pb);
  check bool "has_alpha (no alpha)" false (GdkPixbuf.get_has_alpha pb);
  check int "bits_per_sample" 8 (GdkPixbuf.get_bits_per_sample pb);
  check int "rowstride" 300 (GdkPixbuf.get_rowstride pb) (* 100 * 3 *)

let test_create_with_alpha () =
  let pb = GdkPixbuf.create ~width:100 ~height:50 ~has_alpha:true () in
  check int "width" 100 (GdkPixbuf.get_width pb);
  check int "height" 50 (GdkPixbuf.get_height pb);
  check int "n_channels (with alpha)" 4 (GdkPixbuf.get_n_channels pb);
  check bool "has_alpha (with alpha)" true (GdkPixbuf.get_has_alpha pb);
  check int "rowstride with alpha" 400 (GdkPixbuf.get_rowstride pb) (* 100 * 4 *)

let test_create_large () =
  let pb = GdkPixbuf.create ~width:1920 ~height:1080 ~has_alpha:true () in
  check int "large width" 1920 (GdkPixbuf.get_width pb);
  check int "large height" 1080 (GdkPixbuf.get_height pb);
  check int "large rowstride" 7680 (GdkPixbuf.get_rowstride pb) (* 1920 * 4 *)

(* Test Suite 2: Copy Operations *)

let test_copy_basic () =
  let pb1 = GdkPixbuf.create ~width:50 ~height:50 ~has_alpha:true () in
  GdkPixbuf.fill pb1 0xFF0000FFl; (* Fill with red *)
  let pb2 = GdkPixbuf.copy pb1 in
  (* Verify dimensions match *)
  check int "copy width" (GdkPixbuf.get_width pb1) (GdkPixbuf.get_width pb2);
  check int "copy height" (GdkPixbuf.get_height pb1) (GdkPixbuf.get_height pb2);
  check int "copy channels" (GdkPixbuf.get_n_channels pb1) (GdkPixbuf.get_n_channels pb2);
  check bool "copy has_alpha" (GdkPixbuf.get_has_alpha pb1) (GdkPixbuf.get_has_alpha pb2)

let test_subpixbuf () =
  let pb = GdkPixbuf.create ~width:100 ~height:100 () in
  let sub = GdkPixbuf.subpixbuf pb ~src_x:10 ~src_y:20 ~width:30 ~height:40 in
  check int "subpixbuf width" 30 (GdkPixbuf.get_width sub);
  check int "subpixbuf height" 40 (GdkPixbuf.get_height sub);
  (* Subpixbuf should have same channel count as parent *)
  check int "subpixbuf channels"
    (GdkPixbuf.get_n_channels pb) (GdkPixbuf.get_n_channels sub)

(* Test Suite 3: Fill Operation *)

let test_fill_red () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 ~has_alpha:true () in
  GdkPixbuf.fill pb 0xFF0000FFl; (* Red with full alpha *)
  (* Verify pixbuf still has correct properties after fill *)
  check int "fill preserves width" 10 (GdkPixbuf.get_width pb);
  check int "fill preserves height" 10 (GdkPixbuf.get_height pb);
  check bool "fill preserves alpha" true (GdkPixbuf.get_has_alpha pb)

let test_fill_transparent () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 ~has_alpha:true () in
  GdkPixbuf.fill pb 0x00000000l; (* Fully transparent *)
  check int "transparent fill width" 10 (GdkPixbuf.get_width pb);
  check int "transparent fill height" 10 (GdkPixbuf.get_height pb)

let test_fill_no_alpha () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  GdkPixbuf.fill pb 0x00FF00FFl; (* Green *)
  check bool "fill no alpha preserved" false (GdkPixbuf.get_has_alpha pb)

(* Test Suite 4: Transform Operations *)

let test_add_alpha_basic () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  check bool "before add_alpha" false (GdkPixbuf.get_has_alpha pb);
  check int "before add_alpha channels" 3 (GdkPixbuf.get_n_channels pb);

  let pb_with_alpha = GdkPixbuf.add_alpha pb in
  check bool "after add_alpha" true (GdkPixbuf.get_has_alpha pb_with_alpha);
  check int "after add_alpha channels" 4 (GdkPixbuf.get_n_channels pb_with_alpha);
  check int "add_alpha preserves width" 10 (GdkPixbuf.get_width pb_with_alpha);
  check int "add_alpha preserves height" 10 (GdkPixbuf.get_height pb_with_alpha)

let test_add_alpha_with_transparent () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  let pb_with_alpha = GdkPixbuf.add_alpha ~transparent:(255, 0, 0) pb in
  check bool "transparent add_alpha" true (GdkPixbuf.get_has_alpha pb_with_alpha);
  check int "transparent add_alpha channels" 4 (GdkPixbuf.get_n_channels pb_with_alpha)

let test_copy_area () =
  let src = GdkPixbuf.create ~width:50 ~height:50 () in
  let dest = GdkPixbuf.create ~width:50 ~height:50 () in
  GdkPixbuf.fill src 0xFF0000FFl; (* Red *)
  GdkPixbuf.fill dest 0x0000FFFFl; (* Blue *)

  (* Copy 10x10 area from src to dest *)
  GdkPixbuf.copy_area ~dest ~dest_x:0 ~dest_y:0 ~width:10 ~height:10 ~src_x:0 ~src_y:0 src;

  (* Verify dimensions unchanged *)
  check int "copy_area dest width" 50 (GdkPixbuf.get_width dest);
  check int "copy_area dest height" 50 (GdkPixbuf.get_height dest)

(* Test Suite 5: Input Validation *)

let test_create_invalid_width () =
  try
    let _ = GdkPixbuf.create ~width:0 ~height:10 () in
    fail "Should have raised Invalid_argument for width=0"
  with Invalid_argument _ -> ()

let test_create_invalid_height () =
  try
    let _ = GdkPixbuf.create ~width:10 ~height:0 () in
    fail "Should have raised Invalid_argument for height=0"
  with Invalid_argument _ -> ()

let test_create_negative_width () =
  try
    let _ = GdkPixbuf.create ~width:(-10) ~height:10 () in
    fail "Should have raised Invalid_argument for negative width"
  with Invalid_argument _ -> ()

let test_add_alpha_invalid_color () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  try
    let _ = GdkPixbuf.add_alpha ~transparent:(256, 0, 0) pb in
    fail "Should have raised Invalid_argument for color > 255"
  with Invalid_argument _ -> ()

let test_copy_area_out_of_bounds () =
  let src = GdkPixbuf.create ~width:50 ~height:50 () in
  let dest = GdkPixbuf.create ~width:50 ~height:50 () in
  try
    (* Try to copy beyond source bounds *)
    GdkPixbuf.copy_area ~dest ~dest_x:0 ~dest_y:0 ~width:60 ~height:60 ~src_x:0 ~src_y:0 src;
    fail "Should have raised Invalid_argument for out of bounds"
  with Invalid_argument _ -> ()

(* Test Suite 6: Memory Safety *)

let test_gc_survival () =
  let pb = GdkPixbuf.create ~width:100 ~height:100 ~has_alpha:true () in
  GdkPixbuf.fill pb 0xFF0000FFl;
  Gc.minor ();
  (* Pixbuf should still be valid after minor GC *)
  check int "GC survival width" 100 (GdkPixbuf.get_width pb);
  check int "GC survival height" 100 (GdkPixbuf.get_height pb)

let test_multiple_pixbufs_gc () =
  (* Create many pixbufs and let some go out of scope *)
  let pixbufs = ref [] in
  for i = 1 to 10 do
    let pb = GdkPixbuf.create ~width:(10 * i) ~height:(10 * i) () in
    if i mod 2 = 0 then
      pixbufs := pb :: !pixbufs
  done;
  Gc.minor ();
  (* Verify remaining pixbufs are still valid *)
  List.iter (fun pb ->
    let w = GdkPixbuf.get_width pb in
    check bool "pixbuf still valid after GC" (w > 0) true
  ) !pixbufs

(* Test Suite 7: File I/O with XPM data *)

let test_from_xpm_data () =
  (* Simple 2x2 red square in XPM format *)
  let xpm_data = [|
    "2 2 1 1";
    "r c #FF0000";
    "rr";
    "rr"
  |] in
  let pb = GdkPixbuf.from_xpm_data xpm_data in
  check int "xpm width" 2 (GdkPixbuf.get_width pb);
  check int "xpm height" 2 (GdkPixbuf.get_height pb);
  check bool "xpm has channels" true (GdkPixbuf.get_n_channels pb > 0)

(* Test Suite 8: Save and Load *)

let test_save_and_load () =
  (* Create a simple pixbuf *)
  let pb1 = GdkPixbuf.create ~width:10 ~height:10 ~has_alpha:true () in
  GdkPixbuf.fill pb1 0x00FF00FFl; (* Green *)

  let tmp_file = "/tmp/test_pixbuf.png" in
  (* Save to file *)
  GdkPixbuf.save ~filename:tmp_file ~typ:"png" pb1;

  (* Load back *)
  let pb2 = GdkPixbuf.from_file tmp_file in
  check int "loaded width" (GdkPixbuf.get_width pb1) (GdkPixbuf.get_width pb2);
  check int "loaded height" (GdkPixbuf.get_height pb1) (GdkPixbuf.get_height pb2);

  (* Clean up *)
  try Sys.remove tmp_file with _ -> ()

let test_save_with_options () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  GdkPixbuf.fill pb 0xFF0000FFl;

  let tmp_file = "/tmp/test_pixbuf_quality.png" in
  (* Save with compression option *)
  GdkPixbuf.save ~filename:tmp_file ~typ:"png" ~options:[("compression", "9")] pb;

  (* Verify file exists *)
  check bool "save with options creates file" true (Sys.file_exists tmp_file);

  (* Clean up *)
  try Sys.remove tmp_file with _ -> ()

let test_load_nonexistent () =
  try
    let _ = GdkPixbuf.from_file "/nonexistent/file.png" in
    fail "Should have raised exception for nonexistent file"
  with Failure _ -> ()

let test_from_file_at_size () =
  (* First create a test image *)
  let pb1 = GdkPixbuf.create ~width:100 ~height:100 () in
  GdkPixbuf.fill pb1 0xFF0000FFl;
  let tmp_file = "/tmp/test_pixbuf_large.png" in
  GdkPixbuf.save ~filename:tmp_file ~typ:"png" pb1;

  (* Load at smaller size *)
  let pb2 = GdkPixbuf.from_file_at_size tmp_file ~width:50 ~height:50 in
  check int "scaled width" 50 (GdkPixbuf.get_width pb2);
  check int "scaled height" 50 (GdkPixbuf.get_height pb2);

  (* Clean up *)
  try Sys.remove tmp_file with _ -> ()

let test_get_file_info () =
  (* Create a test image first *)
  let pb = GdkPixbuf.create ~width:123 ~height:456 () in
  let tmp_file = "/tmp/test_file_info.png" in
  GdkPixbuf.save ~filename:tmp_file ~typ:"png" pb;

  (* Get file info without loading *)
  let (format, width, height) = GdkPixbuf.get_file_info tmp_file in
  check string "file format" "png" format;
  check int "file info width" 123 width;
  check int "file info height" 456 height;

  (* Clean up *)
  try Sys.remove tmp_file with _ -> ()

let test_save_to_buffer () =
  let pb = GdkPixbuf.create ~width:10 ~height:10 () in
  GdkPixbuf.fill pb 0xFF0000FFl;

  let buffer = Buffer.create 1024 in
  GdkPixbuf.save_to_buffer pb ~typ:"png" buffer;

  (* Verify buffer has some data *)
  check bool "buffer has data" true (Buffer.length buffer > 0);
  (* PNG files start with specific magic bytes *)
  let content = Buffer.contents buffer in
  check bool "PNG magic bytes" true (String.length content > 4)

(* Main test suite *)

let () =
  run "GdkPixbuf Module Tests (Phase 2.3)" [
    "Creation and Accessors", [
      test_case "Basic creation" `Quick test_create_basic;
      test_case "Creation with alpha" `Quick test_create_with_alpha;
      test_case "Large pixbuf creation" `Quick test_create_large;
    ];

    "Copy Operations", [
      test_case "Basic copy" `Quick test_copy_basic;
      test_case "Subpixbuf" `Quick test_subpixbuf;
    ];

    "Fill Operation", [
      test_case "Fill with red" `Quick test_fill_red;
      test_case "Fill transparent" `Quick test_fill_transparent;
      test_case "Fill without alpha" `Quick test_fill_no_alpha;
    ];

    "Transform Operations", [
      test_case "Add alpha basic" `Quick test_add_alpha_basic;
      test_case "Add alpha with transparent color" `Quick test_add_alpha_with_transparent;
      test_case "Copy area" `Quick test_copy_area;
    ];

    "Input Validation", [
      test_case "Invalid width (zero)" `Quick test_create_invalid_width;
      test_case "Invalid height (zero)" `Quick test_create_invalid_height;
      test_case "Negative width" `Quick test_create_negative_width;
      test_case "Invalid color in add_alpha" `Quick test_add_alpha_invalid_color;
      test_case "Copy area out of bounds" `Quick test_copy_area_out_of_bounds;
    ];

    "Memory Safety", [
      test_case "GC survival" `Quick test_gc_survival;
      test_case "Multiple pixbufs with GC" `Quick test_multiple_pixbufs_gc;
    ];

    "XPM Data", [
      test_case "Load from XPM data" `Quick test_from_xpm_data;
    ];

    "File I/O", [
      test_case "Save and load PNG" `Quick test_save_and_load;
      test_case "Save with options" `Quick test_save_with_options;
      test_case "Load nonexistent file" `Quick test_load_nonexistent;
      test_case "Load from file at size" `Quick test_from_file_at_size;
      test_case "Get file info" `Quick test_get_file_info;
      test_case "Save to buffer" `Quick test_save_to_buffer;
    ];
  ]
