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
CAMLexport CAMLprim value ml_gio_file_descriptor_based_from_gobject(value obj)
{
    CAMLparam1(obj);
    GObject *gobj = GObject_ext_of_val(obj);
    if (!g_type_is_a(G_OBJECT_TYPE(gobj), G_TYPE_FILE_DESCRIPTOR_BASED)) {
        char msg[256];
        snprintf(msg, sizeof(msg),
            "from_gobject: object of type '%s' does not implement %s",
            G_OBJECT_TYPE_NAME(gobj), "GFileDescriptorBased");
        caml_failwith(msg);
    }
    g_object_ref(gobj);
    CAMLreturn(Val_GFileDescriptorBased((GFileDescriptorBased*)gobj));
}

#else


CAMLexport CAMLprim value ml_g_file_descriptor_based_get_fd(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("FileDescriptorBased requires GLib >= 2.24");
return Val_unit;
}

CAMLexport CAMLprim value ml_gio_file_descriptor_based_from_gobject(value obj)
{
    CAMLparam1(obj);
    (void)obj;
    caml_failwith("FileDescriptorBased requires GTK >= 2.24");
    return Val_unit;
}


#endif
