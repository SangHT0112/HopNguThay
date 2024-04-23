include irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
  n dword 10
  s dword ?
.code
main proc
  push n
  call TinhSn1d
  mov s, eax
  call WriteDec
  call crlf
  call readchar
  invoke ExitProcess, 0
main endp

TinhSn1d proc
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  xor ecx ,ecx
  xor ebx, ebx
  xor eax, eax
for1:
  cmp ecx, [ebp+8]
  ja endfor
  add ebx, ecx
  add eax, ebx
  inc ecx
  jmp for1
endfor:
  pop ecx
  pop ebx
  pop ebp
  ret 4d
TinhSn1d endp
end main
