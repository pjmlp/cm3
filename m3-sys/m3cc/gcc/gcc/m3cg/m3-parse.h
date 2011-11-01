#if UCHAR_MAX == 0x0FFUL
typedef   signed char        INT8;
typedef unsigned char       UINT8;
#else
#error unable to find 8bit integer
#endif
#if USHRT_MAX == 0x0FFFFUL
typedef   signed short      INT16;
typedef unsigned short     UINT16;
#else
#error unable to find 16bit integer
#endif
#if UINT_MAX == 0x0FFFFFFFFUL
typedef   signed int        INT32;
typedef unsigned int       UINT32;
#elif ULONG_MAX == 0x0FFFFFFFFUL
typedef   signed long       INT32;
typedef unsigned long      UINT32;
#else
#error unable to find 32bit integer
#endif
#if defined(_MSC_VER) || defined(__DECC)
typedef   signed __int64    INT64;
typedef unsigned __int64   UINT64;
#else
typedef   signed long long  INT64;
typedef unsigned long long UINT64;
#endif
typedef char* PSTR;
typedef const char* PCSTR;
typedef signed char SCHAR;
typedef unsigned char UCHAR;
typedef unsigned int UINT;
typedef unsigned HOST_WIDE_INT UWIDE;
typedef HOST_WIDE_INT WIDE;

typedef enum
{
  /* 00 */ T_word_8,
  /* 01 */ T_int_8,
  /* 02 */ T_word_16,
  /* 03 */ T_int_16,
  /* 04 */ T_word_32,
  /* 05 */ T_int_32,
  /* 06 */ T_word_64,
  /* 07 */ T_int_64,
  /* 08 */ T_reel,
  /* 09 */ T_lreel,
  /* 0A */ T_xreel,
  /* 0B */ T_addr,
  /* 0C */ T_struct,
  /* 0D */ T_void,
  /* 0E */ T_word,
  /* 0F */ T_int,
  /* 10 */ T_longword,
  /* 11 */ T_longint,
  /* 12 */ T_LAST
} m3_type;


typedef struct _m3buf_t {
  char buf[256];
} m3buf_t;

#if !GCC45
static bool m3_mark_addressable (tree exp);
#endif
static tree m3_type_for_size (UINT precision, int unsignedp);
#if !GCC46
static tree m3_type_for_mode (enum machine_mode, int unsignedp);
#endif
static tree m3_unsigned_type (tree type_node);
static tree m3_signed_type (tree type_node);
static tree m3_signed_or_unsigned_type (int unsignedp, tree type);
#if !GCC46
#if GCC42
typedef HOST_WIDE_INT alias_set_type;
#endif
static alias_set_type m3_get_alias_set (tree);
#endif

extern "C" {

/* Functions to keep track of the current scope */
static tree pushdecl (tree decl);

}

/* Langhooks.  */
static tree
builtin_function (PCSTR name, tree type,
#if GCC42
                  int function_code,
#else
                  built_in_function function_code,
#endif
		  enum built_in_class clas, const char *library_name,
		  tree attrs);

#if !GCC46
static tree getdecls (void);
static int global_bindings_p (void);
#endif
#if !GCC45
static void insert_block (tree block);
#endif

#if GCC42
static void
m3_expand_function (tree fndecl);
#endif

static tree m3_push_type_decl (tree type, tree name);
#if !GCC46
static void m3_write_globals (void);
#endif

static PCSTR trace_name (PCSTR* inout_name);
static PSTR trace_upper_hex (PSTR format);
static void trace_int (PCSTR name, INT64 val);
static void trace_typeid (PCSTR name, UINT32 val);
static void trace_string (PCSTR name, PCSTR result, long length);
static void trace_type (PCSTR name, m3_type type);
static void trace_type_tree (PCSTR name, tree type);
//static void trace_float (PCSTR name, UINT kind, long Longs[2]);
static void trace_boolean (PCSTR name, bool val);
static void trace_var (PCSTR name, tree var, size_t a);
static void trace_proc (PCSTR, tree p, size_t a);
static void trace_label (PCSTR name, size_t a);

static INT64 get_int (void);
static UINT64 get_uint (void);
static UINT32 get_typeid (void);
static PCSTR scan_string (long length);
static tree scan_calling_convention (void);
static m3_type scan_type (void);
static tree scan_mtype (m3_type* T);
static UINT scan_sign (void);
static tree scan_float (UINT *out_Kind);
static bool scan_boolean (void);
static tree scan_var (enum tree_code code, size_t* a);
static tree scan_proc (size_t* a);
static tree scan_label (size_t* a);

static bool IsHostBigEndian (void);

static void format_tag_v (m3buf_t* buf, char kind, UINT32 type_id, PCSTR fmt, va_list args);
static void debug_tag (char kind, UINT32 type_id, PCSTR fmt, ...);
static void dump_record_type (tree record_type);
static void debug_field_name_length (PCSTR name, size_t length);
static void debug_field_name (PCSTR name);
static void debug_field_id (UINT32 type_id);
static void debug_field_fmt_v (UINT32 type_id, PCSTR fmt, va_list args);
static void debug_field_fmt (UINT32 type_id, PCSTR fmt, ...);
static void debug_struct (void);
static void one_field (UINT64 offset, UINT64 size, tree type, tree *out_f, tree *out_v);
static void one_gap (UINT64 next_offset);

static void m3_gap (UINT64 next_offset);
static void m3_field (PCSTR name, size_t name_length, tree type, UINT64 offset,
                      UINT64 size, tree* out_f, tree* out_v);

static void add_stmt (tree t);
static tree fix_name (PCSTR name, size_t length, UINT32 type_id);
static tree declare_temp (tree type);
static tree proc_addr (tree p);
static void m3_start_call (void);
static void m3_pop_param (tree t);
static struct language_function* m3_language_function (void);
#if !GCC42
static void m3_volatilize_decl (tree decl);
static void m3_volatilize_current_function (void);
#else
#define m3_volatilize_decl(x) /* nothing */
#define m3_volatilize_current_function() /* nothing */
#endif
static void m3_call_direct (tree p, tree return_type);
static void m3_call_indirect (tree return_type, tree calling_convention);
static void m3_swap (void);
static tree m3_deduce_field_reference (PCSTR caller, tree value, UINT64 offset,
                                       tree field_treetype, m3_type field_m3type);
static bool m3_type_match (tree t1, tree t2);
static bool m3_type_mismatch (tree t1, tree t2);
static void m3_load (tree v, UINT64 offset, tree src_t, m3_type src_T,
                     tree dst_t, m3_type dst_T);
static void m3_store (tree v, UINT64 offset, tree src_t, m3_type src_T,
                      tree dst_t, m3_type dst_T);
static void setop (tree p, INT64 n, int q);
static void setop2 (tree p, int q);

static PCSTR mode_to_string (enum machine_mode mode);

#if !GCC46
static void declare_fault_proc (void);
#endif
static void emit_fault_proc (void);
static tree generate_fault (int code);

static void m3_gimplify_function (tree fndecl);

static void m3_declare_record_common (void);
static void m3_declare_pointer_common (PCSTR caller, UINT32 my_id, UINT32 target_id);
static void m3cg_if_compare (tree type, tree label, enum tree_code o);
static void m3cg_compare (tree src_t, tree dst_t, enum tree_code op);
static void m3_minmax (tree type, int min);
static tree m3cg_set_member_ref (tree type, tree* out_bit_in_word);
static void m3cg_set_compare (UINT64 n, tree type, tree proc);
static tree m3_do_fixed_extract (tree x, INT64 m, INT64 n, tree type);
static void m3cg_fetch_and_op (tree type1, tree type2, enum built_in_function fncode);

#if !GCC46
static void m3_breakpoint(void);
static void m3_parse_file (int);

static UINT m3_init_options (UINT argc, PCSTR* argv);
static int m3_handle_option (size_t code, PCSTR arg, int value);
static bool m3_post_options (PCSTR* pfilename);
static bool m3_init (void);
#endif

static tree m3_build1 (enum tree_code code, tree tipe, tree op0);
static tree m3_build2 (enum tree_code code, tree tipe, tree op0, tree op1);
static tree m3_build3 (enum tree_code code, tree tipe, tree op0, tree op1, tree op2);
static tree m3_cast (tree type, tree op0);
static tree m3_convert (tree type, tree op0);
static tree m3_build_pointer_type (tree a);
static tree m3_build_type_id (m3_type type, UINT64 size, UINT64 align, UINT32 type_id);
static tree m3_build_type (m3_type type, UINT64 size, UINT64 align);
static tree m3_do_insert (tree x, tree y, tree i, tree n, tree orig_type);
static tree left_shift (tree t, int i);
static tree m3_do_fixed_insert (tree x, tree y, UINT64 i, UINT64 n, tree type);
static tree m3_do_extract (tree x, tree i, tree n, tree type);
static tree m3_do_rotate (enum tree_code code, tree orig_type, tree val, tree cnt);
static tree m3_do_shift (enum tree_code code, tree orig_type, tree val, tree count);

#if !GCC46 /* work in progress */
tree convert (tree type, tree expr);
#endif

/*======================================================= OPTION HANDLING ===*/

static int option_trace_all;
