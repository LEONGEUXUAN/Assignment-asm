; ATM Withdrawal Logic with Fee Calculation

section .data
    base_fee db 50  ; base fee in sen
    fee_reduction db 25  ; fee reduction per RM50
    min_fee db 100 ; minimum fee in sen

section .text
    global _start

_start:
    ; Assuming some logic to get the withdrawal amount
    mov eax, [withdrawal_amount]  ; withdrawal amount in sen

    ; Check if withdrawal is a multiple of RM50
    cmp eax, 0
    jle exit
    mov ebx, 5000 ; RM50 in sen
    xor edx, edx
    div ebx
    cmp edx, 0
    jne not_multiple

    ; Calculate fee
    mov ebx, eax
    shr ebx, 1 ; divide by 2
    sub ebx, base_fee
    cmp ebx, min_fee
    jge apply_fee
    mov ebx, min_fee
    jmp done

apply_fee:
    ; Apply fee reduction
    sub ebx, fee_reduction ; reduce fee

done:
    ; Logic to dispense cash and deduct fee
    ; ...

not_multiple:
    ; Handle error for non-multiples of RM50
    ; ...

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
