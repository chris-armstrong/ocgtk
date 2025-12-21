/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FileDescriptorBased */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GFileDescriptorBased */
#ifndef Val_GFileDescriptorBased
#define GFileDescriptorBased_val(val) ((GFileDescriptorBased*)ext_of_val(val))
#define Val_GFileDescriptorBased(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GFileDescriptorBased */


CAMLexport CAMLprim value ml_g_file_descriptor_based_get_fd(value self)
{
CAMLparam1(self);

int result = g_file_descriptor_based_get_fd(GFileDescriptorBased_val(self));
CAMLreturn(Val_int(result));
}
