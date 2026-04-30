/* GENERATED CODE - DO NOT EDIT */
/* C bindings for UnixMountEntry */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gio.h>
#ifdef __linux__
#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
#endif /* __linux__ */
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if !(defined(_WIN32))
/* Conversion functions for GUnixMountEntry (opaque record with hidden fields) */
GUnixMountEntry *GUnixMountEntry_val(value v) {
  return (GUnixMountEntry *)ml_gir_record_ptr_val(v, "GUnixMountEntry");
}

value Val_GUnixMountEntry(const GUnixMountEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr_with_type(g_unix_mount_entry_get_type(), ptr);
}

value Val_GUnixMountEntry_option(const GUnixMountEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GUnixMountEntry(ptr));
}
#endif /* not windows */


#if !(defined(_WIN32))

#else


#endif /* not windows */
