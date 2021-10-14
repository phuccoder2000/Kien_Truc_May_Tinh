.MODEL SMALL
.STACK

.DATA
    MGS1 DB 10,13, 'Nhap so thu nhat: $'
    MGS2 DB 10,13, 'Nhap so thu hai: $'
    MGS3 DB 10,13, 'Tong cua hai so la: $'

    NUM1 DB ?
    NUM2 DB ?
    TONG DB ?

.CODE
    ;Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX   

INPUT1:
 
    ;Xuat thong bao yeu cau nhap so thu nhat 
    MOV AH, 9h
    LEA DX, MGS1
    INT 21h  

    ;Nhap mot ki tu tu ban phim
    MOV AH, 1h
    INT 21h  
    
    ;kiem tra dieu kien
    CMP AL, '0' 
    JB INPUT1 ;quay ve input1 neu nhap nho hon 0
    
    CMP AL, '9'
    JA INPUT1 ;quay ve input1 neu nhap so lon hon 9
    
    ;xu li ki tu va luu ket qua
    SUB AL, 30h ;31 - 30
    MOV NUM1, AL   ;Gan so thu nhat vao NUM1 

INPUT2:
    ;Xuat thong bao yeu cau nhap so thu hai
    MOV AH, 9h
    LEA DX, MGS2
    INT 21h  

    ;Nhap mot ki tu tu ban phim
    MOV AH, 1h
    INT 21h 
    
    ;kiem tra dieu kien
    CMP AL, '0' 
    JB INPUT2 ;quay ve input2 neu nhap nho hon 0
    
    CMP AL, '9'
    JA INPUT2 ;quay ve input2 neu nhap so lon hon 9
    
    ;xu li ki tu va luu ket qua
    
       
    SUB AL, 30h ;32 - 30
    MOV NUM2, AL   ;Gan so thu hai vao NUM2
    
    
    ;========================================
    ;Xuat thong bao tinh tong
    MOV AH, 9h
    MOV DX, OFFSET MGS3
    INT 21h
    
    ;Tinh tong
    MOV AL, NUM1      ;Gan 2 vung nho vao 2 thanh ghi
    MOV BL, NUM2
    ADD AL, BL          ;Cong 2 thanh ghi luu vao AL
    
    ADD AL, 30h
    MOV TONG, AL       ; gan TONG bang AL
    
    
    ;Xuat tong ra man hinh
    MOV AH, 2h
    MOV DL, TONG
    INT 21H
       
    ;Thoat chuong trinh   
    MOV AH, 4Ch
    INT 21h   
       
       
END