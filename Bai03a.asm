;Bài 3a. S(n)=(1*2)+(2*3)+...+(n*(n+1)).
include irvine32.inc        ; Bao gồm tệp irvine32.inc để sử dụng các hàm và macro trong thư viện Irvine32.
.386                        ; Chỉ định sử dụng kiến trúc 32-bit.
.model flat, stdcall        ; Đặc tả mô hình bộ nhớ là flat và cách gọi hàm là stdcall.
.stack 4096                 ; Đặt kích thước stack là 4096 bytes.
ExitProcess proto, dwExitCode:dword ; Nguyên mẫu hàm ExitProcess.

.data                       ; Phần khai báo các biến dữ liệu.
  n dword 10                ; Khai báo biến n là một số nguyên 32 bit và gán giá trị là 10.
  s dword ?                 ; Khai báo biến s là một số nguyên 32 bit.

.code                       ; Phần mã lệnh.
main proc                   ; Bắt đầu định nghĩa hàm main.
  push n                    ; Đẩy giá trị của biến n vào stack để truyền vào hàm TinhSn3a.
  call TinhSn3a             ; Gọi hàm TinhSn3a để tính tổng và trả về kết quả trong thanh ghi eax.
  mov s, eax                ; Di chuyển giá trị của thanh ghi eax vào biến s để lưu kết quả.
  call WriteDec             ; Gọi hàm WriteDec để hiển thị giá trị của biến s ra màn hình.
  call crlf                 ; Gọi hàm crlf để xuống dòng.
  call readchar             ; Gọi hàm readchar để đợi người dùng nhập một ký tự từ bàn phím.
  invoke ExitProcess, 0     ; Gọi hàm ExitProcess để kết thúc chương trình với mã lỗi là 0.
main endp                   ; Kết thúc định nghĩa hàm main.

TinhSn3a proc               ; Bắt đầu định nghĩa hàm TinhSn3a.
  push ebp                  ; Lưu giá trị của ebp vào stack để chuẩn bị cho việc sử dụng ebp.
  mov ebp, esp              ; Thiết lập ebp bằng giá trị của esp, tạo frame cho hàm.
  push ebx                  ; Lưu giá trị của ebx vào stack để chuẩn bị cho việc sử dụng ebx.
  push ecx                  ; Lưu giá trị của ecx vào stack để chuẩn bị cho việc sử dụng ecx.
  xor ecx, ecx              ; Xoá giá trị của ecx, sử dụng ecx để đếm từ 1 đến n.
  xor ebx, ebx              ; Xoá giá trị của ebx, sử dụng ebx để tính tổng S(n).
  xor eax, eax              ; Xoá giá trị của eax, sử dụng eax để lưu kết quả của từng phép nhân.

for1:                       ; Nhãn cho vòng lặp.
  cmp ecx, [ebp+8]          ; So sánh giá trị của ecx (đếm) với giá trị của biến n.
  ja endfor                 ; Nếu ecx > n, thoát khỏi vòng lặp.
  mov eax, ecx              ; Di chuyển giá trị của ecx vào eax.
  inc eax                   ; Tăng eax lên một đơn vị để có giá trị của (n+1).
  imul eax, ecx             ; Nhân kết quả với ecx để có phép nhân n*(n+1).
  add ebx, eax              ; Cộng kết quả vào tổng ebx.
  inc ecx                   ; Tăng giá trị của ecx lên một đơn vị để chuẩn bị cho lần lặp tiếp theo.
  jmp for1                  ; Nhảy đến nhãn for1 để tiếp tục vòng lặp.

endfor:                     ; Nhãn kết thúc vòng lặp.
  mov eax, ebx              ; Di chuyển giá trị của tổng ebx vào thanh ghi eax (lưu kết quả).
  pop ecx                   ; Lấy giá trị của ecx từ stack.
  pop ebx                   ; Lấy giá trị của ebx từ stack.
  pop ebp                   ; Lấy giá trị của ebp từ stack.
  ret 4                     ; Trả về và loại bỏ tham số ra khỏi stack.
TinhSn3a endp               ; Kết thúc định nghĩa hàm TinhSn3a.
end main                    ; Kết thúc định nghĩa hàm main.
