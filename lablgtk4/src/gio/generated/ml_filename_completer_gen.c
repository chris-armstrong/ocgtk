/* GENERATED CODE - DO NOT EDIT */
/* C bindings for FilenameCompleter */

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


CAMLexport CAMLprim value ml_g_filename_completer_new(value unit)
{
CAMLparam1(unit);
GFilenameCompleter *obj = g_filename_completer_new();
CAMLreturn(Val_GFilenameCompleter(obj));
}

CAMLexport CAMLprim value ml_g_filename_completer_set_dirs_only(value self, value arg1)
{
CAMLparam2(self, arg1);

g_filename_completer_set_dirs_only(GFilenameCompleter_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_filename_completer_get_completion_suffix(value self, value arg1)
{
CAMLparam2(self, arg1);

char* result = g_filename_completer_get_completion_suffix(GFilenameCompleter_val(self), String_val(arg1));
CAMLreturn(Val_option_string(result));
}
