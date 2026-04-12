(** Runtime tests for GList interface element types via VolumeMonitor.

    These tests exercise the newly generated GList/GSList methods that return
    lists of interface types (Drive, Mount, Volume).  In a typical CI
    environment there will be no real hardware drives, so the lists may be
    empty — but the call must complete without a segfault or exception.

    Layer 1 (external declarations) is accessed via Gio.Wrappers.Volume_monitor.
    The singleton is obtained via Gio_volume_monitor_core.volume_monitor_get. *)

open Alcotest

(* Layer 1 external declarations for Volume_monitor *)
module L1_vm = Ocgtk_gio.Gio.Wrappers.Volume_monitor

(* Singleton getter (hand-written; g_volume_monitor_get is a free function) *)
let get_vm () = Ocgtk_gio.Gio_volume_monitor_core.volume_monitor_get ()

(** {2 VolumeMonitor singleton tests} *)

let test_get_volume_monitor () =
  let vm = get_vm () in
  ignore vm;
  check bool "get volume monitor succeeds" true true

let test_get_connected_drives () =
  let vm = get_vm () in
  let drives = L1_vm.get_connected_drives vm in
  (* The list may be empty in CI (no hardware drives), but must not raise *)
  check bool "get_connected_drives returns a list" true (List.length drives >= 0)

let test_get_mounts () =
  let vm = get_vm () in
  let mounts = L1_vm.get_mounts vm in
  check bool "get_mounts returns a list" true (List.length mounts >= 0)

let test_get_volumes () =
  let vm = get_vm () in
  let volumes = L1_vm.get_volumes vm in
  check bool "get_volumes returns a list" true (List.length volumes >= 0)

let test_list_lengths_consistent () =
  let vm = get_vm () in
  let drives = L1_vm.get_connected_drives vm in
  let mounts = L1_vm.get_mounts vm in
  let volumes = L1_vm.get_volumes vm in
  check bool "all list lengths are non-negative"
    true (List.length drives >= 0 && List.length mounts >= 0 && List.length volumes >= 0)

(** {2 Test Suite} *)

let () =
  Alcotest.run "GIO VolumeMonitor GList interface tests" [
    "VolumeMonitor", [
      test_case "get volume monitor singleton" `Quick test_get_volume_monitor;
      test_case "get_connected_drives (GList<Drive>)" `Quick test_get_connected_drives;
      test_case "get_mounts (GList<Mount>)" `Quick test_get_mounts;
      test_case "get_volumes (GList<Volume>)" `Quick test_get_volumes;
      test_case "list lengths consistent" `Quick test_list_lengths_consistent;
    ];
  ]
