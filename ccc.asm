
global _fft
global fft
global show
global main




SECTION .text                      ; section number 1, code

extern rand                                             ; near
extern __isoc99_scanf                                   ; near
extern srand                                            ; near
extern time                                             ; near
extern printf                                           ; near
extern __stack_chk_fail                                 ; near
extern __muldc3                                         ; near
extern cexp                                             ; near
extern _GLOBAL_OFFSET_TABLE_                            ; byte

_start:
_fft:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 80                                 ; 0004 _ 48: 83. EC, 50
        mov     qword [rbp-38H], rdi                    ; 0008 _ 48: 89. 7D, C8
        mov     qword [rbp-40H], rsi                    ; 000C _ 48: 89. 75, C0
        mov     dword [rbp-44H], edx                    ; 0010 _ 89. 55, BC
        mov     dword [rbp-48H], ecx                    ; 0013 _ 89. 4D, B8
        mov     eax, dword [rbp-48H]                    ; 0016 _ 8B. 45, B8
        cmp     eax, dword [rbp-44H]                    ; 0019 _ 3B. 45, BC
        jge     ?_003                                   ; 001C _ 0F 8D, 000001D3
        mov     eax, dword [rbp-48H]                    ; 0022 _ 8B. 45, B8
        lea     ecx, [rax+rax]                          ; 0025 _ 8D. 0C 00
        mov     edx, dword [rbp-44H]                    ; 0028 _ 8B. 55, BC
        mov     rsi, qword [rbp-38H]                    ; 002B _ 48: 8B. 75, C8
        mov     rax, qword [rbp-40H]                    ; 002F _ 48: 8B. 45, C0
        mov     rdi, rax                                ; 0033 _ 48: 89. C7
        call    _fft                                    ; 0036 _ E8, 00000000(rel)
        mov     eax, dword [rbp-48H]                    ; 003B _ 8B. 45, B8
        lea     edx, [rax+rax]                          ; 003E _ 8D. 14 00
        mov     eax, dword [rbp-48H]                    ; 0041 _ 8B. 45, B8
        cdqe                                            ; 0044 _ 48: 98
        shl     rax, 4                                  ; 0046 _ 48: C1. E0, 04
        mov     rcx, rax                                ; 004A _ 48: 89. C1
        mov     rax, qword [rbp-38H]                    ; 004D _ 48: 8B. 45, C8
        lea     rsi, [rcx+rax]                          ; 0051 _ 48: 8D. 34 01
        mov     eax, dword [rbp-48H]                    ; 0055 _ 8B. 45, B8
        cdqe                                            ; 0058 _ 48: 98
        shl     rax, 4                                  ; 005A _ 48: C1. E0, 04
        mov     rcx, rax                                ; 005E _ 48: 89. C1
        mov     rax, qword [rbp-40H]                    ; 0061 _ 48: 8B. 45, C0
        lea     rdi, [rcx+rax]                          ; 0065 _ 48: 8D. 3C 01
        mov     eax, dword [rbp-44H]                    ; 0069 _ 8B. 45, BC
        mov     ecx, edx                                ; 006C _ 89. D1
        mov     edx, eax                                ; 006E _ 89. C2
        call    _fft                                    ; 0070 _ E8, 00000000(rel)
        mov     dword [rbp-24H], 0                      ; 0075 _ C7. 45, DC, 00000000
        jmp     ?_002                                   ; 007C _ E9, 00000168


?_001:  movsd   xmm1, qword [rel PI]                    ; 0081 _ F2: 0F 10. 0D, 00000000(rel)
        movsd   xmm0, qword [rel ?_021]                 ; 0089 _ F2: 0F 10. 05, 00000000(rel)
        movapd  xmm2, xmm0                              ; 0091 _ 66: 0F 28. D0
        mulsd   xmm2, xmm1                              ; 0095 _ F2: 0F 59. D1
        cvtsi2sd xmm0, dword [rbp-24H]                  ; 0099 _ F2: 0F 2A. 45, DC
        mulsd   xmm2, xmm0                              ; 009E _ F2: 0F 59. D0
        movq    xmm3, qword [rel ?_022]                 ; 00A2 _ F3: 0F 7E. 1D, 00000000(rel)
        xorpd   xmm1, xmm3                              ; 00AA _ 66: 0F 57. CB
        mulsd   xmm1, xmm0                              ; 00AE _ F2: 0F 59. C8
        cvtsi2sd xmm0, dword [rbp-44H]                  ; 00B2 _ F2: 0F 2A. 45, BC
        divsd   xmm2, xmm0                              ; 00B7 _ F2: 0F 5E. D0
        divsd   xmm1, xmm0                              ; 00BB _ F2: 0F 5E. C8
        movapd  xmm0, xmm1                              ; 00BF _ 66: 0F 28. C1
        movapd  xmm1, xmm0                              ; 00C3 _ 66: 0F 28. C8
        movapd  xmm0, xmm2                              ; 00C7 _ 66: 0F 28. C2
        call    cexp                                    ; 00CB _ E8, 00000000(PLT r)
        movq    rax, xmm0                               ; 00D0 _ 66 48: 0F 7E. C0
        movapd  xmm0, xmm1                              ; 00D5 _ 66: 0F 28. C1
        mov     qword [rbp-50H], rax                    ; 00D9 _ 48: 89. 45, B0
        movsd   xmm1, qword [rbp-50H]                   ; 00DD _ F2: 0F 10. 4D, B0
        movapd  xmm2, xmm0                              ; 00E2 _ 66: 0F 28. D0
        mov     edx, dword [rbp-24H]                    ; 00E6 _ 8B. 55, DC
        mov     eax, dword [rbp-48H]                    ; 00E9 _ 8B. 45, B8
        add     eax, edx                                ; 00EC _ 01. D0
        cdqe                                            ; 00EE _ 48: 98
        shl     rax, 4                                  ; 00F0 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 00F4 _ 48: 89. C2
        mov     rax, qword [rbp-40H]                    ; 00F7 _ 48: 8B. 45, C0
        add     rax, rdx                                ; 00FB _ 48: 01. D0
        mov     rdx, qword [rax]                        ; 00FE _ 48: 8B. 10
        movsd   xmm0, qword [rax+8H]                    ; 0101 _ F2: 0F 10. 40, 08
        movapd  xmm3, xmm2                              ; 0106 _ 66: 0F 28. DA
        movapd  xmm2, xmm1                              ; 010A _ 66: 0F 28. D1
        movapd  xmm1, xmm0                              ; 010E _ 66: 0F 28. C8
        mov     qword [rbp-50H], rdx                    ; 0112 _ 48: 89. 55, B0
        movsd   xmm0, qword [rbp-50H]                   ; 0116 _ F2: 0F 10. 45, B0
        call    __muldc3                                ; 011B _ E8, 00000000(PLT r)
        movq    rax, xmm0                               ; 0120 _ 66 48: 0F 7E. C0
        movapd  xmm0, xmm1                              ; 0125 _ 66: 0F 28. C1
        mov     qword [rbp-10H], rax                    ; 0129 _ 48: 89. 45, F0
        movsd   qword [rbp-8H], xmm0                    ; 012D _ F2: 0F 11. 45, F8
        movsd   xmm0, qword [rbp-10H]                   ; 0132 _ F2: 0F 10. 45, F0
        movsd   qword [rbp-20H], xmm0                   ; 0137 _ F2: 0F 11. 45, E0
        movsd   xmm0, qword [rbp-8H]                    ; 013C _ F2: 0F 10. 45, F8
        movsd   qword [rbp-18H], xmm0                   ; 0141 _ F2: 0F 11. 45, E8
        mov     eax, dword [rbp-24H]                    ; 0146 _ 8B. 45, DC
        cdqe                                            ; 0149 _ 48: 98
        shl     rax, 4                                  ; 014B _ 48: C1. E0, 04
        mov     rdx, rax                                ; 014F _ 48: 89. C2
        mov     rax, qword [rbp-40H]                    ; 0152 _ 48: 8B. 45, C0
        add     rax, rdx                                ; 0156 _ 48: 01. D0
        movsd   xmm1, qword [rax]                       ; 0159 _ F2: 0F 10. 08
        movsd   xmm0, qword [rax+8H]                    ; 015D _ F2: 0F 10. 40, 08
        mov     eax, dword [rbp-24H]                    ; 0162 _ 8B. 45, DC
        mov     edx, eax                                ; 0165 _ 89. C2
        shr     edx, 31                                 ; 0167 _ C1. EA, 1F
        add     eax, edx                                ; 016A _ 01. D0
        sar     eax, 1                                  ; 016C _ D1. F8
        cdqe                                            ; 016E _ 48: 98
        shl     rax, 4                                  ; 0170 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 0174 _ 48: 89. C2
        mov     rax, qword [rbp-38H]                    ; 0177 _ 48: 8B. 45, C8
        add     rax, rdx                                ; 017B _ 48: 01. D0
        addsd   xmm1, qword [rbp-20H]                   ; 017E _ F2: 0F 58. 4D, E0
        addsd   xmm0, qword [rbp-18H]                   ; 0183 _ F2: 0F 58. 45, E8
        movsd   qword [rax], xmm1                       ; 0188 _ F2: 0F 11. 08
        movsd   qword [rax+8H], xmm0                    ; 018C _ F2: 0F 11. 40, 08
        mov     eax, dword [rbp-24H]                    ; 0191 _ 8B. 45, DC
        cdqe                                            ; 0194 _ 48: 98
        shl     rax, 4                                  ; 0196 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 019A _ 48: 89. C2
        mov     rax, qword [rbp-40H]                    ; 019D _ 48: 8B. 45, C0
        add     rax, rdx                                ; 01A1 _ 48: 01. D0
        movsd   xmm1, qword [rax]                       ; 01A4 _ F2: 0F 10. 08
        movsd   xmm0, qword [rax+8H]                    ; 01A8 _ F2: 0F 10. 40, 08
        mov     edx, dword [rbp-24H]                    ; 01AD _ 8B. 55, DC
        mov     eax, dword [rbp-44H]                    ; 01B0 _ 8B. 45, BC
        add     eax, edx                                ; 01B3 _ 01. D0
        mov     edx, eax                                ; 01B5 _ 89. C2
        shr     edx, 31                                 ; 01B7 _ C1. EA, 1F
        add     eax, edx                                ; 01BA _ 01. D0
        sar     eax, 1                                  ; 01BC _ D1. F8
        cdqe                                            ; 01BE _ 48: 98
        shl     rax, 4                                  ; 01C0 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 01C4 _ 48: 89. C2
        mov     rax, qword [rbp-38H]                    ; 01C7 _ 48: 8B. 45, C8
        add     rax, rdx                                ; 01CB _ 48: 01. D0
        subsd   xmm1, [rbp-20H]                   ; 01CE _ F2: 0F 5C. 4D, E0
        subsd   xmm0, [rbp-18H]                   ; 01D3 _ F2: 0F 5C. 45, E8
        movsd   qword [rax], xmm1                       ; 01D8 _ F2: 0F 11. 08
        movsd   qword [rax+8H], xmm0                    ; 01DC _ F2: 0F 11. 40, 08
        mov     eax, dword [rbp-48H]                    ; 01E1 _ 8B. 45, B8
        add     eax, eax                                ; 01E4 _ 01. C0
        add     dword [rbp-24H], eax                    ; 01E6 _ 01. 45, DC
?_002:  mov     eax, dword [rbp-24H]                    ; 01E9 _ 8B. 45, DC
        cmp     eax, dword [rbp-44H]                    ; 01EC _ 3B. 45, BC
        jl      ?_001                                   ; 01EF _ 0F 8C, FFFFFE8C
?_003:  nop                                             ; 01F5 _ 90
        leave                                           ; 01F6 _ C9
        ret                                             ; 01F7 _ C3
; _fft End of function

fft:    ; Function begin
        push    rbp                                     ; 01F8 _ 55
        mov     rbp, rsp                                ; 01F9 _ 48: 89. E5
        push    rbx                                     ; 01FC _ 53
        sub     rsp, 56                                 ; 01FD _ 48: 83. EC, 38
        mov     qword [rbp-38H], rdi                    ; 0201 _ 48: 89. 7D, C8
        mov     dword [rbp-3CH], esi                    ; 0205 _ 89. 75, C4
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0208 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-18H], rax                    ; 0211 _ 48: 89. 45, E8
        xor     eax, eax                                ; 0215 _ 31. C0
        mov     rax, rsp                                ; 0217 _ 48: 89. E0
        mov     rbx, rax                                ; 021A _ 48: 89. C3
        mov     eax, dword [rbp-3CH]                    ; 021D _ 8B. 45, C4
        movsxd  rdx, eax                                ; 0220 _ 48: 63. D0
        sub     rdx, 1                                  ; 0223 _ 48: 83. EA, 01
        mov     qword [rbp-28H], rdx                    ; 0227 _ 48: 89. 55, D8
        movsxd  rdx, eax                                ; 022B _ 48: 63. D0
        mov     r10, rdx                                ; 022E _ 49: 89. D2
        mov     r11d, 0                                 ; 0231 _ 41: BB, 00000000
        movsxd  rdx, eax                                ; 0237 _ 48: 63. D0
        mov     r8, rdx                                 ; 023A _ 49: 89. D0
        mov     r9d, 0                                  ; 023D _ 41: B9, 00000000
        cdqe                                            ; 0243 _ 48: 98
        shl     rax, 4                                  ; 0245 _ 48: C1. E0, 04
        lea     rdx, [rax+7H]                           ; 0249 _ 48: 8D. 50, 07
        mov     eax, 16                                 ; 024D _ B8, 00000010
        sub     rax, 1                                  ; 0252 _ 48: 83. E8, 01
        add     rax, rdx                                ; 0256 _ 48: 01. D0
        mov     ecx, 16                                 ; 0259 _ B9, 00000010
        mov     edx, 0                                  ; 025E _ BA, 00000000
        div     rcx                                     ; 0263 _ 48: F7. F1
        imul    rax, rax, 16                            ; 0266 _ 48: 6B. C0, 10
        sub     rsp, rax                                ; 026A _ 48: 29. C4
        mov     rax, rsp                                ; 026D _ 48: 89. E0
        add     rax, 7                                  ; 0270 _ 48: 83. C0, 07
        shr     rax, 3                                  ; 0274 _ 48: C1. E8, 03
        shl     rax, 3                                  ; 0278 _ 48: C1. E0, 03
        mov     qword [rbp-20H], rax                    ; 027C _ 48: 89. 45, E0
        mov     dword [rbp-2CH], 0                      ; 0280 _ C7. 45, D4, 00000000
        jmp     ?_005                                   ; 0287 _ EB, 3A

?_004:  mov     eax, dword [rbp-2CH]                    ; 0289 _ 8B. 45, D4
        cdqe                                            ; 028C _ 48: 98
        shl     rax, 4                                  ; 028E _ 48: C1. E0, 04
        mov     rdx, rax                                ; 0292 _ 48: 89. C2
        mov     rax, qword [rbp-38H]                    ; 0295 _ 48: 8B. 45, C8
        add     rax, rdx                                ; 0299 _ 48: 01. D0
        movsd   xmm1, qword [rax]                       ; 029C _ F2: 0F 10. 08
        movsd   xmm0, qword [rax+8H]                    ; 02A0 _ F2: 0F 10. 40, 08
        mov     rax, qword [rbp-20H]                    ; 02A5 _ 48: 8B. 45, E0
        mov     edx, dword [rbp-2CH]                    ; 02A9 _ 8B. 55, D4
        movsxd  rdx, edx                                ; 02AC _ 48: 63. D2
        shl     rdx, 4                                  ; 02AF _ 48: C1. E2, 04
        add     rax, rdx                                ; 02B3 _ 48: 01. D0
        movsd   qword [rax], xmm1                       ; 02B6 _ F2: 0F 11. 08
        movsd   qword [rax+8H], xmm0                    ; 02BA _ F2: 0F 11. 40, 08
        add     dword [rbp-2CH], 1                      ; 02BF _ 83. 45, D4, 01
?_005:  mov     eax, dword [rbp-2CH]                    ; 02C3 _ 8B. 45, D4
        cmp     eax, dword [rbp-3CH]                    ; 02C6 _ 3B. 45, C4
        jl      ?_004                                   ; 02C9 _ 7C, BE
        mov     rsi, qword [rbp-20H]                    ; 02CB _ 48: 8B. 75, E0
        mov     edx, dword [rbp-3CH]                    ; 02CF _ 8B. 55, C4
        mov     rax, qword [rbp-38H]                    ; 02D2 _ 48: 8B. 45, C8
        mov     ecx, 1                                  ; 02D6 _ B9, 00000001
        mov     rdi, rax                                ; 02DB _ 48: 89. C7
        call    _fft                                    ; 02DE _ E8, 00000000(rel)
        mov     rsp, rbx                                ; 02E3 _ 48: 89. DC
        nop                                             ; 02E6 _ 90
        mov     rax, qword [rbp-18H]                    ; 02E7 _ 48: 8B. 45, E8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rax, qword [fs:abs 28H]                 ; 02EB _ 64 48: 33. 04 25, 00000028
        jz      ?_006                                   ; 02F4 _ 74, 05
        call    __stack_chk_fail                        ; 02F6 _ E8, 00000000(PLT r)
?_006:  mov     rbx, qword [rbp-8H]                     ; 02FB _ 48: 8B. 5D, F8
        leave                                           ; 02FF _ C9
        ret                                             ; 0300 _ C3
; fft End of function

show:   ; Function begin
        push    rbp                                     ; 0301 _ 55
        mov     rbp, rsp                                ; 0302 _ 48: 89. E5
        sub     rsp, 48                                 ; 0305 _ 48: 83. EC, 30
        mov     qword [rbp-18H], rdi                    ; 0309 _ 48: 89. 7D, E8
        mov     qword [rbp-20H], rsi                    ; 030D _ 48: 89. 75, E0
        mov     dword [rbp-24H], edx                    ; 0311 _ 89. 55, DC
        mov     rax, qword [rbp-18H]                    ; 0314 _ 48: 8B. 45, E8
        mov     rsi, rax                                ; 0318 _ 48: 89. C6
        lea     rdi, [rel ?_014]                        ; 031B _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0322 _ B8, 00000000
        call    printf                                  ; 0327 _ E8, 00000000(PLT r)
        mov     dword [rbp-4H], 0                       ; 032C _ C7. 45, FC, 00000000
        jmp     ?_010                                   ; 0333 _ E9, 000000AE

?_007:  mov     eax, dword [rbp-4H]                     ; 0338 _ 8B. 45, FC
        cdqe                                            ; 033B _ 48: 98
        shl     rax, 4                                  ; 033D _ 48: C1. E0, 04
        mov     rdx, rax                                ; 0341 _ 48: 89. C2
        mov     rax, qword [rbp-20H]                    ; 0344 _ 48: 8B. 45, E0
        add     rax, rdx                                ; 0348 _ 48: 01. D0
        movsd   xmm0, qword [rax+8H]                    ; 034B _ F2: 0F 10. 40, 08
        pxor    xmm1, xmm1                              ; 0350 _ 66: 0F EF. C9
        ucomisd xmm0, xmm1                              ; 0354 _ 66: 0F 2E. C1
        jpe     ?_008                                   ; 0358 _ 7A, 3C
        pxor    xmm1, xmm1                              ; 035A _ 66: 0F EF. C9
        ucomisd xmm0, xmm1                              ; 035E _ 66: 0F 2E. C1
        jnz     ?_008                                   ; 0362 _ 75, 32
        mov     eax, dword [rbp-4H]                     ; 0364 _ 8B. 45, FC
        cdqe                                            ; 0367 _ 48: 98
        shl     rax, 4                                  ; 0369 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 036D _ 48: 89. C2
        mov     rax, qword [rbp-20H]                    ; 0370 _ 48: 8B. 45, E0
        add     rax, rdx                                ; 0374 _ 48: 01. D0
        mov     rax, qword [rax]                        ; 0377 _ 48: 8B. 00
        mov     qword [rbp-30H], rax                    ; 037A _ 48: 89. 45, D0
        movsd   xmm0, qword [rbp-30H]                   ; 037E _ F2: 0F 10. 45, D0
        lea     rdi, [rel ?_015]                        ; 0383 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 1                                  ; 038A _ B8, 00000001
        call    printf                                  ; 038F _ E8, 00000000(PLT r)
        jmp     ?_009                                   ; 0394 _ EB, 4C

?_008:  mov     eax, dword [rbp-4H]                     ; 0396 _ 8B. 45, FC
        cdqe                                            ; 0399 _ 48: 98
        shl     rax, 4                                  ; 039B _ 48: C1. E0, 04
        mov     rdx, rax                                ; 039F _ 48: 89. C2
        mov     rax, qword [rbp-20H]                    ; 03A2 _ 48: 8B. 45, E0
        add     rax, rdx                                ; 03A6 _ 48: 01. D0
        movsd   xmm0, qword [rax+8H]                    ; 03A9 _ F2: 0F 10. 40, 08
        mov     eax, dword [rbp-4H]                     ; 03AE _ 8B. 45, FC
        cdqe                                            ; 03B1 _ 48: 98
        shl     rax, 4                                  ; 03B3 _ 48: C1. E0, 04
        mov     rdx, rax                                ; 03B7 _ 48: 89. C2
        mov     rax, qword [rbp-20H]                    ; 03BA _ 48: 8B. 45, E0
        add     rax, rdx                                ; 03BE _ 48: 01. D0
        mov     rax, qword [rax]                        ; 03C1 _ 48: 8B. 00
        movapd  xmm1, xmm0                              ; 03C4 _ 66: 0F 28. C8
        mov     qword [rbp-30H], rax                    ; 03C8 _ 48: 89. 45, D0
        movsd   xmm0, qword [rbp-30H]                   ; 03CC _ F2: 0F 10. 45, D0
        lea     rdi, [rel ?_016]                        ; 03D1 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 2                                  ; 03D8 _ B8, 00000002
        call    printf                                  ; 03DD _ E8, 00000000(PLT r)
?_009:  add     dword [rbp-4H], 1                       ; 03E2 _ 83. 45, FC, 01
?_010:  mov     eax, dword [rbp-4H]                     ; 03E6 _ 8B. 45, FC
        cmp     eax, dword [rbp-24H]                    ; 03E9 _ 3B. 45, DC
        jl      ?_007                                   ; 03EC _ 0F 8C, FFFFFF46
        nop                                             ; 03F2 _ 90
        leave                                           ; 03F3 _ C9
        ret                                             ; 03F4 _ C3
; show End of function

main:   ; Function begin
        push    rbp                                     ; 03F5 _ 55
        mov     rbp, rsp                                ; 03F6 _ 48: 89. E5
        push    r15                                     ; 03F9 _ 41: 57
        push    r14                                     ; 03FB _ 41: 56
        push    r13                                     ; 03FD _ 41: 55
        push    r12                                     ; 03FF _ 41: 54
        push    rbx                                     ; 0401 _ 53
        sub     rsp, 40                                 ; 0402 _ 48: 83. EC, 28
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0406 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-38H], rax                    ; 040F _ 48: 89. 45, C8
        xor     eax, eax                                ; 0413 _ 31. C0
        mov     rax, rsp                                ; 0415 _ 48: 89. E0
        mov     rbx, rax                                ; 0418 _ 48: 89. C3
        movsd   xmm0, qword [rel ?_023]                 ; 041B _ F2: 0F 10. 05, 00000000(rel)
        movsd   qword [rel PI], xmm0                    ; 0423 _ F2: 0F 11. 05, 00000000(rel)
        mov     edi, 0                                  ; 042B _ BF, 00000000
        call    time                                    ; 0430 _ E8, 00000000(PLT r)
        mov     edi, eax                                ; 0435 _ 89. C7
        call    srand                                   ; 0437 _ E8, 00000000(PLT r)
        lea     rdi, [rel ?_017]                        ; 043C _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0443 _ B8, 00000000
        call    printf                                  ; 0448 _ E8, 00000000(PLT r)
        lea     rax, [rbp-50H]                          ; 044D _ 48: 8D. 45, B0
        mov     rsi, rax                                ; 0451 _ 48: 89. C6
        lea     rdi, [rel ?_018]                        ; 0454 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 045B _ B8, 00000000
        call    __isoc99_scanf                          ; 0460 _ E8, 00000000(PLT r)
        mov     eax, dword [rbp-50H]                    ; 0465 _ 8B. 45, B0
        movsxd  rdx, eax                                ; 0468 _ 48: 63. D0
        sub     rdx, 1                                  ; 046B _ 48: 83. EA, 01
        mov     qword [rbp-48H], rdx                    ; 046F _ 48: 89. 55, B8
        movsxd  rdx, eax                                ; 0473 _ 48: 63. D0
        mov     r14, rdx                                ; 0476 _ 49: 89. D6
        mov     r15d, 0                                 ; 0479 _ 41: BF, 00000000
        movsxd  rdx, eax                                ; 047F _ 48: 63. D0
        mov     r12, rdx                                ; 0482 _ 49: 89. D4
        mov     r13d, 0                                 ; 0485 _ 41: BD, 00000000
        cdqe                                            ; 048B _ 48: 98
        shl     rax, 4                                  ; 048D _ 48: C1. E0, 04
        lea     rdx, [rax+7H]                           ; 0491 _ 48: 8D. 50, 07
        mov     eax, 16                                 ; 0495 _ B8, 00000010
        sub     rax, 1                                  ; 049A _ 48: 83. E8, 01
        add     rax, rdx                                ; 049E _ 48: 01. D0
        mov     esi, 16                                 ; 04A1 _ BE, 00000010
        mov     edx, 0                                  ; 04A6 _ BA, 00000000
        div     rsi                                     ; 04AB _ 48: F7. F6
        imul    rax, rax, 16                            ; 04AE _ 48: 6B. C0, 10
        sub     rsp, rax                                ; 04B2 _ 48: 29. C4
        mov     rax, rsp                                ; 04B5 _ 48: 89. E0
        add     rax, 7                                  ; 04B8 _ 48: 83. C0, 07
        shr     rax, 3                                  ; 04BC _ 48: C1. E8, 03
        shl     rax, 3                                  ; 04C0 _ 48: C1. E0, 03
        mov     qword [rbp-40H], rax                    ; 04C4 _ 48: 89. 45, C0
        mov     dword [rbp-4CH], 0                      ; 04C8 _ C7. 45, B4, 00000000
        jmp     ?_012                                   ; 04CF _ EB, 52

?_011:  call    rand                                    ; 04D1 _ E8, 00000000(PLT r)
        mov     ecx, eax                                ; 04D6 _ 89. C1
        mov     edx, 780903145                          ; 04D8 _ BA, 2E8BA2E9
        mov     eax, ecx                                ; 04DD _ 89. C8
        imul    edx                                     ; 04DF _ F7. EA
        sar     edx, 1                                  ; 04E1 _ D1. FA
        mov     eax, ecx                                ; 04E3 _ 89. C8
        sar     eax, 31                                 ; 04E5 _ C1. F8, 1F
        sub     edx, eax                                ; 04E8 _ 29. C2
        mov     eax, edx                                ; 04EA _ 89. D0
        shl     eax, 2                                  ; 04EC _ C1. E0, 02
        add     eax, edx                                ; 04EF _ 01. D0
        add     eax, eax                                ; 04F1 _ 01. C0
        add     eax, edx                                ; 04F3 _ 01. D0
        sub     ecx, eax                                ; 04F5 _ 29. C1
        mov     edx, ecx                                ; 04F7 _ 89. CA
        cvtsi2sd xmm0, edx                              ; 04F9 _ F2: 0F 2A. C2
        movapd  xmm1, xmm0                              ; 04FD _ 66: 0F 28. C8
        pxor    xmm0, xmm0                              ; 0501 _ 66: 0F EF. C0
        mov     rax, qword [rbp-40H]                    ; 0505 _ 48: 8B. 45, C0
        mov     edx, dword [rbp-4CH]                    ; 0509 _ 8B. 55, B4
        movsxd  rdx, edx                                ; 050C _ 48: 63. D2
        shl     rdx, 4                                  ; 050F _ 48: C1. E2, 04
        add     rax, rdx                                ; 0513 _ 48: 01. D0
        movsd   qword [rax], xmm1                       ; 0516 _ F2: 0F 11. 08
        movsd   qword [rax+8H], xmm0                    ; 051A _ F2: 0F 11. 40, 08
        add     dword [rbp-4CH], 1                      ; 051F _ 83. 45, B4, 01
?_012:  mov     eax, dword [rbp-50H]                    ; 0523 _ 8B. 45, B0
        cmp     dword [rbp-4CH], eax                    ; 0526 _ 39. 45, B4
        jl      ?_011                                   ; 0529 _ 7C, A6
        mov     edx, dword [rbp-50H]                    ; 052B _ 8B. 55, B0
        mov     rax, qword [rbp-40H]                    ; 052E _ 48: 8B. 45, C0
        mov     rsi, rax                                ; 0532 _ 48: 89. C6
        lea     rdi, [rel ?_019]                        ; 0535 _ 48: 8D. 3D, 00000000(rel)
        call    show                                    ; 053C _ E8, 00000000(rel)
        mov     edx, dword [rbp-50H]                    ; 0541 _ 8B. 55, B0
        mov     rax, qword [rbp-40H]                    ; 0544 _ 48: 8B. 45, C0
        mov     esi, edx                                ; 0548 _ 89. D6
        mov     rdi, rax                                ; 054A _ 48: 89. C7
        call    fft                                     ; 054D _ E8, 00000000(rel)
        mov     edx, dword [rbp-50H]                    ; 0552 _ 8B. 55, B0
        mov     rax, qword [rbp-40H]                    ; 0555 _ 48: 8B. 45, C0
        mov     rsi, rax                                ; 0559 _ 48: 89. C6
        lea     rdi, [rel ?_020]                        ; 055C _ 48: 8D. 3D, 00000000(rel)
        call    show                                    ; 0563 _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0568 _ B8, 00000000
        mov     rsp, rbx                                ; 056D _ 48: 89. DC
        mov     rbx, qword [rbp-38H]                    ; 0570 _ 48: 8B. 5D, C8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rbx, qword [fs:abs 28H]                 ; 0574 _ 64 48: 33. 1C 25, 00000028
        jz      ?_013                                   ; 057D _ 74, 05
        call    __stack_chk_fail                        ; 057F _ E8, 00000000(PLT r)
?_013:  lea     rsp, [rbp-28H]                          ; 0584 _ 48: 8D. 65, D8
        pop     rbx                                     ; 0588 _ 5B
        pop     r12                                     ; 0589 _ 41: 5C
        pop     r13                                     ; 058B _ 41: 5D
        pop     r14                                     ; 058D _ 41: 5E
        pop     r15                                     ; 058F _ 41: 5F
        pop     rbp                                     ; 0591 _ 5D
        ret                                             ; 0592 _ C3
; main End of function


SECTION .data                       ; section number 2, data
	PI DQ 0 


SECTION .bss                          ; section number 3, bss


SECTION .rodata                     ; section number 4, const

?_014:                                                  ; byte
        db 25H, 73H, 00H                                ; 0000 _ %s.

?_015:                                                  ; byte
        db 25H, 67H, 20H, 00H                           ; 0003 _ %g .

?_016:                                                  ; byte
        db 28H, 25H, 67H, 2CH, 20H, 25H, 67H, 29H       ; 0007 _ (%g, %g)
        db 20H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _  .......
        db 00H                                          ; 0017 _ .

?_017:                                                  ; byte
        db 54H, 61H, 6DH, 61H, 0C3H, 0B1H, 6FH, 20H     ; 0018 _ Tama..o 
        db 64H, 65H, 20H, 61H, 72H, 72H, 65H, 67H       ; 0020 _ de arreg
        db 6CH, 6FH, 20H, 28H, 64H, 65H, 62H, 65H       ; 0028 _ lo (debe
        db 20H, 73H, 65H, 72H, 20H, 65H, 6CH, 65H       ; 0030 _  ser ele
        db 76H, 61H, 64H, 6FH, 20H, 61H, 20H, 6CH       ; 0038 _ vado a l
        db 61H, 20H, 32H, 29H, 3AH, 20H, 00H            ; 0040 _ a 2): .

?_018:                                                  ; byte
        db 25H, 64H, 00H                                ; 0047 _ %d.

?_019:                                                  ; byte
        db 44H, 61H, 74H, 61H, 3AH, 20H, 00H            ; 004A _ Data: .

?_020:                                                  ; byte
        db 0AH, 46H, 46H, 54H, 20H, 3AH, 20H, 00H       ; 0051 _ .FFT : .
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H            ; 0059 _ .......

?_021:  dq 8000000000000000H                            ; 0060 _ -0.0 
        dq 0000000000000000H                            ; 0068 _ 0.0 

?_022:  dq 8000000000000000H                            ; 0070 _ 8000000000000000 
        dq 0000000000000000H                            ; 0078 _ 0000000000000000 

?_023:  dq 400921FB54442D18H                            ; 0080 _ 3.141592653589793 


