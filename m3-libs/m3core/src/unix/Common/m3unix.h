#if _MSC_VER > 1000
#pragma once
#endif

#define _FILE_OFFSET_BITS 64

#ifndef INCLUDED_M3UNIX_H
#define INCLUDED_M3UNIX_H

#ifdef __INTERIX
#ifndef _ALL_SOURCE
#define _ALL_SOURCE
#endif
#ifndef _REENTRANT
#define _REENTRANT
#endif
#endif

#ifdef _MSC_VER
#define _CRT_SECURE_NO_DEPRECATE
#define _CRT_NONSTDC_NO_DEPRECATE
struct _RPC_ASYNC_STATE; /* warning 4115: named type definition in parentheses */
struct IRpcStubBuffer;   /* warning 4115: named type definition in parentheses */
#pragma warning(disable:4100) /* unused parameter*/
#pragma warning(disable:4201) /* nonstandard extension: nameless struct/union */
#pragma warning(disable:4214) /* nonstandard extension: bitfield other than int */
#pragma warning(disable:4514) /* unused inline function removed */
#if _MSC_VER < 1000
#pragma warning(disable:4705) /* statement has no effect for merely using assert() at -W4 */
#pragma warning(disable:4209) /* nonstandard extension: benign re-typedef */
#pragma warning(disable:4226) /* nonstandard extension: __export */
#endif
#endif

#ifdef __OpenBSD__
#define ucontext_t openbsd_ucontext_t
#endif

#include <sys/types.h>
#include <sys/stat.h>
#include <assert.h>
#include <stddef.h>
#include <time.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <signal.h>

#ifdef _WIN32
#include <direct.h>
#include <io.h>
#include <winsock.h>
#include <process.h>
typedef ptrdiff_t ssize_t;
#else
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <dirent.h>
#include <grp.h>
#include <netdb.h>
#include <pthread.h>
#include <unistd.h>
#include <pwd.h>
#define ZeroMemory(a,b) (memset((a), 0, (b)))
#endif

#ifdef __INTERIX
#include <utime.h>
#endif

#ifdef __OpenBSD__
#undef ucontext_t
#endif

typedef struct sockaddr sockaddr_t;
typedef struct itimerval itimerval_t;
typedef struct hostent hostent_t;
typedef struct group group_t;
typedef struct timeval timeval_t;
typedef struct timespec timespec_t;
typedef struct timezone timezone_t;
typedef struct tm tm_t;
typedef struct utimbuf utimbuf_t;

typedef   signed char       INT8;
typedef unsigned char      UINT8;
typedef   signed short      INT16;
typedef unsigned short     UINT16;
typedef   signed int        INT32;
typedef unsigned int       UINT32;
#ifdef _MSC_VER
typedef   signed __int64  INT64;
typedef unsigned __int64 UINT64;
#else
typedef   signed long long  INT64;
typedef unsigned long long UINT64;
#endif

/* My headers have this wrong so we fix it here. */

typedef struct _arm_darwin_stat_t {
/* size must be 108 */
/* 00 */    UINT32 dev;
/* 04 */    UINT16 mode;
/* 06 */    UINT16 nlink;
/* 08 */    UINT64 ino;
/* 10 */    UINT32 uid;
/* 14 */    UINT32 gid;
/* 18 */    UINT32 rdev;
/* 1C */    UINT32 atime;
/* 20 */    UINT32 atimensec;
/* 24 */    UINT32 mtime;
/* 28 */    UINT32 mtimensec;
/* 2C */    UINT32 ctime;
/* 30 */    UINT32 ctimensec;
/* 34 */    UINT32 birthtime;
/* 38 */    UINT32 birthtimensec;
/* 3C */    UINT64 size;
/* 44 */    UINT64 blocks;
/* 4C */    UINT32 blksize;
/* 50 */    UINT32 flags;
/* 54 */    UINT32 gen;
/* 58 */    UINT32 lspare;
/* 5C */    UINT64 qspare[2];
/* 6C */
} arm_darwin_stat_t;

#if defined(__APPLE__) && defined(__arm)

typedef arm_darwin_stat_t stat_t;

#else

typedef struct stat stat_t;

#endif


#ifdef __cplusplus
extern "C" {
#endif

/* INTEGER is always signed and exactly the same size as a pointer */
typedef ptrdiff_t INTEGER;

/* LONGINT is always signed and exactly 64 bits. */
typedef INT64 LONGINT;

typedef void* ADDRESS;

/* see Utypes.i3; we assert that these are large enough, they don't have
be exactly correctly sizes, and often are not */
typedef LONGINT m3_dev_t;
typedef INTEGER m3_gid_t;
typedef LONGINT m3_ino_t;
typedef INTEGER m3_mode_t;
typedef LONGINT m3_nlink_t;
typedef INTEGER m3_pid_t;
typedef ADDRESS m3_pthread_t;
typedef LONGINT m3_off_t;
typedef INTEGER m3_uid_t;

#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#define HAS_STAT_FLAGS
#endif

struct _m3_stat_t;
typedef struct _m3_stat_t m3_stat_t;

int Ustat__fstat(int fd, m3_stat_t* m3st);
int Ustat__lstat(const char* path, m3_stat_t* m3st);
int Ustat__stat(const char* path, m3_stat_t* m3st);
#ifdef HAS_STAT_FLAGS
int Ustat__fchflags(int fd, unsigned long flags);
int Ustat__chflags(const char* path, unsigned long flags);
#endif

/*
socklen_t
cygwin:
    signed 32 bit
hpux:
    size_t
    therefore:
    hpux32:
        unsigned 32 bit
    hpux64:
        unsigned 64 bit, but again, size_t
everyone else:
    unsigned 32 bit

The values involved are all small positive values,
so we will play loose with signedness, though we
assert that all the values are positive.

Since the values are always small anyway, we will stick to 32 bits.

m3_socklen_t is equivalent to socklen_t, when socklen_t is 32 bits.
It is a reasonable facsimile to the type the Modula-3 code uses -- the
same size and usually the same signedness.
*/
#if defined(__CYGWIN__) || defined(_WIN32)
typedef int m3_socklen_t;
#else
typedef unsigned m3_socklen_t;
#endif


int Usocket__listen(int s, int backlog);
int Usocket__shutdown(int s, int how);
int Usocket__socket(int af, int type, int protocol);
int Usocket__bind(int s, sockaddr_t* name, m3_socklen_t len);
int Usocket__connect(int s, sockaddr_t* name, m3_socklen_t len);
int Usocket__sendto(int s, void* msg, size_t length, int flags, sockaddr_t* dest, m3_socklen_t len);
int Usocket__setsockopt(int s, int level, int optname, void* optval, m3_socklen_t len);
int Usocket__getpeername(int s, sockaddr_t* name, m3_socklen_t* plen);
int Usocket__getsockname(int s, sockaddr_t* name, m3_socklen_t* plen);
int Usocket__accept(int s, sockaddr_t* addr, m3_socklen_t* plen);
int Usocket__getsockopt(int s, int level, int optname, void* optval, m3_socklen_t* plen);
int Usocket__recvfrom(int s, void* buf, size_t len, int flags, sockaddr_t* from, m3_socklen_t* plen);


#ifndef _WIN32
DIR* Udir__opendir(const char* a);
#endif

int Umman__mprotect(ADDRESS addr, size_t len, int prot);
ADDRESS Umman__mmap(ADDRESS addr, size_t len, int prot, int flags, int fd, m3_off_t off);
int Umman__munmap(ADDRESS addr, size_t len);



void UtimeC__dummy(void);
time_t Utime__get_timezone(void);
time_t Utime__get_altzone(void);
int Utime__get_daylight(void);
const char* Utime__get_tzname(unsigned a);

void Unix__Assertions(void);


int Unix__open(const char* path, int flags, m3_mode_t mode);
int Unix__mkdir(const char* path, m3_mode_t mode);
int Unix__ftruncate(int fd, m3_off_t length);
m3_off_t Unix__lseek(int fd, m3_off_t offset, int whence);
int Unix__fcntl(int fd, int request, int arg);
int Unix__ioctl(int fd, int request, void* argp);
int Unix__mknod(const char* path, m3_mode_t mode, m3_dev_t dev);
m3_mode_t Unix__umask(m3_mode_t newmask);

struct _m3_hostent_t;
typedef struct _m3_hostent_t m3_hostent_t;

m3_hostent_t* Unetdb__gethostbyname(const char* name, m3_hostent_t* m3);
m3_hostent_t* Unetdb__gethostbyaddr(const char* addr, int len, int type, m3_hostent_t* m3);


struct _m3_group_t;
typedef struct _m3_group_t m3_group_t;

m3_group_t* Ugrp__getgrent(m3_group_t* m3group);
m3_group_t* Ugrp__getgrgid(m3_group_t* m3group, m3_gid_t gid);
m3_group_t* Ugrp__getgrnam(m3_group_t* m3group, const char* name);
void Ugrp__setgrent(void);
void Ugrp__endgrent(void);


int Unix__link(const char* name1, const char* name2);
int Unix__chmod(const char* path, m3_mode_t mode);
int Unix__fchmod(int fd, m3_mode_t mode);
int Unix__chown(const char* path, m3_uid_t owner, m3_gid_t group);
int Unix__fchown(int fd, m3_uid_t owner, m3_gid_t group);
int Unix__creat(const char* path, m3_mode_t mode);
int Unix__dup(int oldd);

UINT32 Uin__ntohl(UINT32 x);
UINT16 Uin__ntohs(UINT16 x);
UINT32 Uin__htonl(UINT32 x);
UINT16 Uin__htons(UINT16 x);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
