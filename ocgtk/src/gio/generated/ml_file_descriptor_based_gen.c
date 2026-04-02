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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"

#if GLIB_CHECK_VERSION(2,24,0)


CAMLexport CAMLprim value ml_g_file_descriptor_based_get_fd(value self)
{
CAMLparam1(self);

int result = g_file_descriptor_based_get_fd(GFileDescriptorBased_val(self));
CAMLreturn(Val_int(result));
}

#else


CAMLexport CAMLprim value ml_g_file_descriptor_based_get_fd(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("FileDescriptorBased requires GLib >= 2.24");
return Val_unit;
}


#endif
